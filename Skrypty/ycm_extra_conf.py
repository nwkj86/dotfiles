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


class StaticFlags(object):
    def __init__(self):
        self.no_db_flags = [
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

        # Flags added to both compilation_database and static flags
        self.common_flags = [
            '-Wno-unknown-warning-option',  # ignore unknown flags
        ]


class FilesystemHelper(object):
    def __init__(self):
        self.PROJECT_ROOT = ['.git', '.hg']
        self.PATH_FLAGS = ['-isystem', '-I', '-iquote', '--sysroot=']

    def DirectoryOfThisScript(self):
        return os.path.dirname(os.path.abspath(__file__))

    def GetLevelUp(self, path):
        return os.path.abspath(os.path.dirname(path))

    def MakeRelativePathsInFlagsAbsolute(self, flags, working_directory):
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

            for path_flag in self.PATH_FLAGS:
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

    def IsProjectRoot(self, path):
        for csv_dir in self.PROJECT_ROOT:
                if os.path.exists(os.path.join(path, csv_dir)) or path == '/':
                        return True
        return False


class CppFiles(object):
    def __init__(self):
        self.SOURCE_EXTENSIONS = ['.cpp', '.cxx', '.c++', '.cc', '.c', '.m', '.mm']
        self.HEADER_EXTENSIONS = ['.h', '.hxx', '.hpp', '.hh']

    def IsHeaderFile(self, filename):
        extension = os.path.splitext(filename)[1]
        return extension in self.HEADER_EXTENSIONS

    def IsSourceFile(self, filename):
        extension = os.path.splitext(filename)[1]
        return extension in self.SOURCE_EXTENSIONS

    def GetAlternativeFiles(self, filename):
        basename = os.path.splitext(filename)[0]
        return map(lambda ext: basename + ext, self.SOURCE_EXTENSIONS)


class Logger(object):
    def __init__(self, logFile, indent=4 * ' '):
        self.logFile = logFile
        self.file = open(self.logFile, 'a')
        self.indent = indent

    def log(self, indent_depth, message):
        self.file.write(indent_depth * self.indent + message + '\n')


class FlagsProvider(object):
    def __init__(self):
        self.logger = Logger('/tmp/ycm_extra_conf.log')
        self.staticFlags = StaticFlags()
        self.fsHelper = FilesystemHelper()
        self.cppFiles = CppFiles()

        self.compilation_database_folder = 'build'

        if os.path.exists(os.path.join(self.compilation_database_folder, 'compile_commands.json')):
            self.database = ycm_core.CompilationDatabase(self.compilation_database_folder)
        else:
            self.database = None

    def MatchCppFile(self, filename):
        # match header -> source file
        self.logger.log(1, "match header -> source file")
        for replacement_file in self.cppFiles.GetAlternativeFiles(filename):
            self.logger.log(2, "replacement_file {}".format(replacement_file))
            if os.path.exists(replacement_file):
                self.logger.log(3, "exists")
                compilation_info = self.database.GetCompilationInfoForFile(replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None

    def AnyCppFileLookup(self, filename):
        # source file from here up to vcs root
        self.logger.log(1, "source file from here up to vcs root")
        dirname = os.path.dirname(filename)
        self.logger.log(1, "dirname {}".format(dirname))

        while True:
            for dirpath, dirs, files in os.walk(dirname):
                self.logger.log(2, "walk {}, {}, {}, {}".format(dirname, dirpath, dirs, files))
                for file in files:
                    self.logger.log(3, "check {}".format(file))
                    if self.cppFiles.IsSourceFile(file):
                        self.logger.log(4, "source file")
                        replacement_file = os.path.join(dirpath, file)
                        self.logger.log(4, "replacement_file {}".format(replacement_file))
                        compilation_info = self.database.GetCompilationInfoForFile(replacement_file)
                        if compilation_info.compiler_flags_:
                            return compilation_info

            if self.fsHelper.IsProjectRoot(dirname):
                self.logger.log(3, "hit root")
                return None
            else:
                dirname = self.fsHelper.GetLevelUp(dirname)
                self.logger.log(3, "up, dirname {} ".format(dirname))

        return None

    def GetCompilationInfoForFile(self, filename):
        if self.cppFiles.IsHeaderFile(filename):
            self.logger.log(0, 'header file')
            flags = self.MatchCppFile(filename)
            return flags if flags else self.AnyCppFileLookup(filename)

        self.logger.log(0, 'direct db call')
        return self.database.GetCompilationInfoForFile(filename)

    def FlagsForFile(self, filename, **kwargs):
        if self.database:
            compilation_info = self.GetCompilationInfoForFile(filename)
            if not compilation_info:
                return None

            final_flags = self.fsHelper.MakeRelativePathsInFlagsAbsolute(
                compilation_info.compiler_flags_,
                compilation_info.compiler_working_dir_)
        else:
            relative_to = self.fsHelper.DirectoryOfThisScript()
            final_flags = self.fsHelper.MakeRelativePathsInFlagsAbsolute(self.staticFlags.no_db_flags, relative_to)

        return {'flags': final_flags + self.staticFlags.common_flags}


def FlagsForFile(filename, **kwargs):
    flagsProvider = FlagsProvider()
    return flagsProvider.FlagsForFile(filename, **kwargs)
