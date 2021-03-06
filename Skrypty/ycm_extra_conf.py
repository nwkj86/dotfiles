# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import os
import ycm_core


class Config(object):
    def __init__(self):
        # starting from current file PWD go up to the project root
        # check these subdirs for compilation databse
        self.database_lookup_dirs = ['.', 'build']

        # file to log data to
        self.log_file = '/tmp/ycm_extra_conf_{}.log'.format(os.getpid())

        # for finding project root
        self.cvs_markers = ['.git', '.hg', '.svn']

        # for include paths
        self.path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']

        # header -> source mapping
        self.source_extensions = ['.cpp', '.cxx', '.c++', '.cc', '.c', '.m', '.mm']
        self.header_extensions = ['.h', '.hxx', '.hpp', '.hh']

        # ignore unknown flags
        self.common_flags = ['-Wno-unknown-warning-option -I/usr/include']

        # flags if compilation database is not present
        self.static_flags = [
            '-Wall',
            '-Wextra',
            '-Werror',
            '-Wno-long-long',
            '-Wno-variadic-macros',
            '-fexceptions',
            '-DNDEBUG',
            '-DUSE_CLANG_COMPLETER',
            '-std=c++14',
            '-x',
            'c++',
            '-isystem',
            '../BoostParts',
            '-isystem',

            # OS X only
            '/System/Library/Frameworks/Python.framework/Headers',
            '-isystem',
            '../llvm/include',
            '-isystem',
            '../llvm/tools/clang/include',
            '-I',
            '.',
            '-I',
            './ClangCompleter',
            '-isystem',
            './tests/gmock/gtest',
            '-isystem',
            './tests/gmock/gtest/include',
            '-isystem',
            './tests/gmock',
            '-isystem',
            './tests/gmock/include',
        ]


config = Config()


class Logger(object):
    def __init__(self, logFile, indent=4 * ' '):
        self.file = open(logFile, 'a')
        self.indent = indent
        self.log(0, "Logger initialized")
        self.log(0, "CWD: {}".format(os.getcwd()))

    def log(self, indent_depth, message):
        self.file.write(indent_depth * self.indent + message + '\n')
        self.file.flush()


logger = Logger(config.log_file)


def get_dir_for_file(filename):
    return os.path.dirname(os.path.abspath(filename))


def get_dir_of_this_script():
    return os.path.normpath(os.path.dirname(os.path.abspath(__file__)))


def is_top_dir(path):
    """Top dir is a CVS dir or this file dir"""
    for csv_dir in config.cvs_markers:
        if os.path.exists(os.path.join(path, csv_dir)) or path == '/':
            return True
    path = os.path.normpath(path)

    return path == get_dir_of_this_script()


def get_level_up(path):
    if is_top_dir(path):
        return None
    return os.path.abspath(os.path.dirname(path))


def get_top_dir(filename):
    dir = get_dir_for_file(filename)
    while get_level_up(dir):
        dir = get_level_up(dir)
    return dir


def make_relative_paths_in_flags_absolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in config.path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def is_header_file(filename):
    extension = os.path.splitext(filename)[1]
    return extension in config.header_extensions


def is_source_file(filename):
    extension = os.path.splitext(filename)[1]
    return extension in config.source_extensions


def get_alternative_files(filename):
    basename = os.path.splitext(filename)[0]
    return map(lambda ext: basename + ext, config.source_extensions)


def get_compilation_database(dir):
    """ find compilation database file """
    while dir:
        for d in config.database_lookup_dirs:
            database_dir = os.path.join(dir, d)
            database_file = os.path.join(database_dir, 'compile_commands.json')
            logger.log(1, "checking database {}".format(database_file))

            if os.path.exists(database_file):
                logger.log(0, "using database {}".format(database_file))
                return ycm_core.CompilationDatabase(database_dir)

        dir = get_level_up(dir)

    logger.log(0, "database not found")
    return None


class FlagsProvider(object):
    def __init__(self):
        self.database = None

    def match_cpp_file(self, filename):
        """ Try to match source file for given header file """
        logger.log(0, "match_cpp_file({})".format(filename))
        for replacement_file in get_alternative_files(filename):
            logger.log(1, "replacement_file {}".format(replacement_file))
            compilation_info = self.database.GetCompilationInfoForFile(
                replacement_file)

            if compilation_info.compiler_flags_:
                logger.log(0, "using replacement file {}".format(
                    replacement_file))

                return compilation_info
        logger.log(1, "flags not found")
        return None

    def any_cpp_file_lookup(self, filename):
        """ Try to match any source file for header file in current directory,
            repeat process in directory above if failed till top dir is reached"""
        logger.log(0, "any_cpp_file_lookup({})".format(filename))
        dirname = os.path.dirname(filename)
        logger.log(1, "dirname {}".format(dirname))

        while True:
            for dirpath, dirs, files in os.walk(dirname):
                logger.log(2, "walk {}, {}, {}, {}".format(dirname, dirpath, dirs, files))
                for file in files:
                    logger.log(3, "check {}".format(file))
                    if is_source_file(file):
                        replacement_file = os.path.join(dirpath, file)
                        logger.log(4, "replacement_file {}".format(replacement_file))
                        compilation_info = self.database.GetCompilationInfoForFile(replacement_file)
                        if compilation_info.compiler_flags_:
                            logger.log(5, "...found")
                            return compilation_info

            dirname = get_level_up(dirname)
            if dirname:
                logger.log(2, "up, dirname {} ".format(dirname))
            else:
                logger.log(2, "hit root")
                break

        logger.log(1, "flags not found")
        return None

    def get_compilation_info_for_file(self, filename):
        if is_header_file(filename):
            logger.log(0, 'header file {}'.format(filename))
            flags = self.match_cpp_file(filename)
            return flags if flags else self.any_cpp_file_lookup(filename)

        logger.log(0, 'direct db call {}'.format(filename))
        return self.database.GetCompilationInfoForFile(filename)

    def flags_for_file(self, filename, **kwargs):
        root_dir = get_top_dir(filename)
        script_dir = get_dir_of_this_script()

        logger.log(0, "Filename: {}".format(filename))
        logger.log(0, "Project dir: {}".format(root_dir))
        logger.log(0, "Script dir: {}".format(script_dir))

        self.database = get_compilation_database(
            get_dir_for_file(filename))

        if self.database:
            compilation_info = self.get_compilation_info_for_file(filename)
            if not compilation_info:
                return None

            final_flags = make_relative_paths_in_flags_absolute(
                compilation_info.compiler_flags_,
                get_dir_for_file(filename))
        else:
            final_flags = make_relative_paths_in_flags_absolute(config.static_flags, script_dir)

        return {'flags': final_flags + config.common_flags}


def FlagsForFile(filename, **kwargs):
    flagsProvider = FlagsProvider()
    return flagsProvider.flags_for_file(filename, **kwargs)
