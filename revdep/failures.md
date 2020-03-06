# gwsem

<details>

* Version: 0.1.15
* Source code: https://github.com/cran/gwsem
* URL: https://github.com/jpritikin/gwsem
* BugReports: https://github.com/jpritikin/gwsem/issues
* Date/Publication: 2020-02-17 19:50:09 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"gwsem")` for more info

</details>

## In both

*   checking whether package ‘gwsem’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/gwsem/new/gwsem.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘gwsem’ ...
** package ‘gwsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c bgen.cpp -o bgen.o
In file included from bgen.cpp:14:
In file included from include/genfile/bgen/bgen.hpp:20:
include/genfile/zlib.hpp:47:7: warning: unused variable 'result' [-Wunused-variable]
                int result = uncompress(
                    ^
include/genfile/zlib.hpp:62:24: warning: unused variable 'uncompressed_size' [-Wunused-variable]
            std::size_t const uncompressed_size = ZSTD_getDecompressedSize( reinterpret_cast< void const* >( begin ), source_size ) ;
                              ^
include/genfile/zlib.hpp:63:21: warning: unused variable 'result' [-Wunused-variable]
                std::size_t const result = ZSTD_decompress(
                                  ^
In file included from bgen.cpp:14:
include/genfile/bgen/bgen.hpp:86:16: warning: 'genfile::bgen::BGenError::what' hides overloaded virtual function [-Woverloaded-virtual]
                        char const* what() throw() {
                                    ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/exception:102:25: note: hidden overloaded virtual function 'std::exception::what' declared here: different qualifiers (const vs none)
    virtual const char* what() const _NOEXCEPT;
                        ^
In file included from bgen.cpp:14:
include/genfile/bgen/bgen.hpp:1694:22: warning: unused variable 'max_id_length' [-Wunused-variable]
                        std::size_t const max_id_length = std::numeric_limits< uint16_t >::max() ;
                                          ^
In file included from bgen.cpp:710:
include/genfile/bgen/View.hpp:19:14: warning: function 'to_string' is not needed and will not be emitted [-Wunneeded-internal-declaration]
        std::string to_string( std::size_t i ) {
                    ^
6 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c db_wrapper.cpp -o db_wrapper.o
db_wrapper.cpp:415:7: warning: unused variable 'bytes' [-Wunused-variable]
                int bytes = sqlite3_column_bytes( m_statement, column_id ) ;
                    ^
1 warning generated.
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c entropy_common.c -o entropy_common.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c fse_compress.c -o fse_compress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c fse_decompress.c -o fse_decompress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c huf_compress.c -o huf_compress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c huf_decompress.c -o huf_decompress.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c init.cpp -o init.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c loader.cpp -o loader.o
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
In file included from include/genfile/bgen/bgen.hpp:20:
include/genfile/zlib.hpp:47:7: warning: unused variable 'result' [-Wunused-variable]
                int result = uncompress(
                    ^
include/genfile/zlib.hpp:62:24: warning: unused variable 'uncompressed_size' [-Wunused-variable]
            std::size_t const uncompressed_size = ZSTD_getDecompressedSize( reinterpret_cast< void const* >( begin ), source_size ) ;
                              ^
include/genfile/zlib.hpp:63:21: warning: unused variable 'result' [-Wunused-variable]
                std::size_t const result = ZSTD_decompress(
                                  ^
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
include/genfile/bgen/bgen.hpp:86:16: warning: 'genfile::bgen::BGenError::what' hides overloaded virtual function [-Woverloaded-virtual]
                        char const* what() throw() {
                                    ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/exception:102:25: note: hidden overloaded virtual function 'std::exception::what' declared here: different qualifiers (const vs none)
    virtual const char* what() const _NOEXCEPT;
                        ^
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
include/genfile/bgen/bgen.hpp:1694:22: warning: unused variable 'max_id_length' [-Wunused-variable]
                        std::size_t const max_id_length = std::numeric_limits< uint16_t >::max() ;
                                          ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
In file included from loader.cpp:1:
include/genfile/bgen/View.hpp:19:14: warning: function 'to_string' is not needed and will not be emitted [-Wunneeded-internal-declaration]
        std::string to_string( std::size_t i ) {
                    ^
10 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c openmx.cpp -o openmx.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c pgenlib_internal.cpp -o pgenlib_internal.o
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
4 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c plink2_base.cc -o plink2_base.o
In file included from plink2_base.cc:18:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
4 warnings generated.
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c sqlite3.c -o sqlite3.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c xxhash.c -o xxhash.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c zbuff_compress.c -o zbuff_compress.o
zbuff_compress.c:97:64: error: invalid application of 'sizeof' to an incomplete type 'ZBUFF_CCtx' (aka 'struct ZSTD_CCtx_s')
    zbc = (ZBUFF_CCtx*)customMem.customAlloc(customMem.opaque, sizeof(ZBUFF_CCtx));
                                                               ^     ~~~~~~~~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:99:20: error: invalid application of 'sizeof' to an incomplete type 'ZBUFF_CCtx' (aka 'struct ZSTD_CCtx_s')
    memset(zbc, 0, sizeof(ZBUFF_CCtx));
                   ^     ~~~~~~~~~~~~
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:77:33: note: expanded from macro 'memset'
                __builtin___memset_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                              ^~~~~~~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:100:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    memcpy(&zbc->customMem, &customMem, sizeof(ZSTD_customMem));
            ~~~^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:63:27: note: expanded from macro 'memcpy'
                __builtin___memcpy_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                        ^~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:100:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    memcpy(&zbc->customMem, &customMem, sizeof(ZSTD_customMem));
            ~~~^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:63:62: note: expanded from macro 'memcpy'
                __builtin___memcpy_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                                                           ^~~~
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_common.h:38:55: note: expanded from macro '__darwin_obsz0'
#define __darwin_obsz0(object) __builtin_object_size (object, 0)
                                                      ^~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:101:8: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->zc = ZSTD_createCCtx_advanced(customMem);
    ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:102:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->zc == NULL) { ZBUFF_freeCCtx(zbc); return NULL; }
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:109:22: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    ZSTD_freeCCtx(zbc->zc);
                  ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:25: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                     ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:51: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                                               ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:74: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                                                                      ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:26: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                      ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:52: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                                                ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:75: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                                                                       ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:112:8: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->customMem.customFree(zbc->customMem.opaque, zbc);
    ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:112:34: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->customMem.customFree(zbc->customMem.opaque, zbc);
                              ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:125:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
        if (zbc->inBuffSize < neededInBuffSize) {
            ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:126:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
            zbc->inBuffSize = neededInBuffSize;
            ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
make: *** [zbuff_compress.o] Error 1
ERROR: compilation failed for package ‘gwsem’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/gwsem/new/gwsem.Rcheck/gwsem’

```
### CRAN

```
* installing *source* package ‘gwsem’ ...
** package ‘gwsem’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c bgen.cpp -o bgen.o
In file included from bgen.cpp:14:
In file included from include/genfile/bgen/bgen.hpp:20:
include/genfile/zlib.hpp:47:7: warning: unused variable 'result' [-Wunused-variable]
                int result = uncompress(
                    ^
include/genfile/zlib.hpp:62:24: warning: unused variable 'uncompressed_size' [-Wunused-variable]
            std::size_t const uncompressed_size = ZSTD_getDecompressedSize( reinterpret_cast< void const* >( begin ), source_size ) ;
                              ^
include/genfile/zlib.hpp:63:21: warning: unused variable 'result' [-Wunused-variable]
                std::size_t const result = ZSTD_decompress(
                                  ^
In file included from bgen.cpp:14:
include/genfile/bgen/bgen.hpp:86:16: warning: 'genfile::bgen::BGenError::what' hides overloaded virtual function [-Woverloaded-virtual]
                        char const* what() throw() {
                                    ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/exception:102:25: note: hidden overloaded virtual function 'std::exception::what' declared here: different qualifiers (const vs none)
    virtual const char* what() const _NOEXCEPT;
                        ^
In file included from bgen.cpp:14:
include/genfile/bgen/bgen.hpp:1694:22: warning: unused variable 'max_id_length' [-Wunused-variable]
                        std::size_t const max_id_length = std::numeric_limits< uint16_t >::max() ;
                                          ^
In file included from bgen.cpp:710:
include/genfile/bgen/View.hpp:19:14: warning: function 'to_string' is not needed and will not be emitted [-Wunneeded-internal-declaration]
        std::string to_string( std::size_t i ) {
                    ^
6 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c db_wrapper.cpp -o db_wrapper.o
db_wrapper.cpp:415:7: warning: unused variable 'bytes' [-Wunused-variable]
                int bytes = sqlite3_column_bytes( m_statement, column_id ) ;
                    ^
1 warning generated.
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c entropy_common.c -o entropy_common.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c fse_compress.c -o fse_compress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c fse_decompress.c -o fse_decompress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c huf_compress.c -o huf_compress.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c huf_decompress.c -o huf_decompress.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c init.cpp -o init.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c loader.cpp -o loader.o
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
In file included from include/genfile/bgen/bgen.hpp:20:
include/genfile/zlib.hpp:47:7: warning: unused variable 'result' [-Wunused-variable]
                int result = uncompress(
                    ^
include/genfile/zlib.hpp:62:24: warning: unused variable 'uncompressed_size' [-Wunused-variable]
            std::size_t const uncompressed_size = ZSTD_getDecompressedSize( reinterpret_cast< void const* >( begin ), source_size ) ;
                              ^
include/genfile/zlib.hpp:63:21: warning: unused variable 'result' [-Wunused-variable]
                std::size_t const result = ZSTD_decompress(
                                  ^
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
include/genfile/bgen/bgen.hpp:86:16: warning: 'genfile::bgen::BGenError::what' hides overloaded virtual function [-Woverloaded-virtual]
                        char const* what() throw() {
                                    ^
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/exception:102:25: note: hidden overloaded virtual function 'std::exception::what' declared here: different qualifiers (const vs none)
    virtual const char* what() const _NOEXCEPT;
                        ^
In file included from loader.cpp:1:
In file included from include/genfile/bgen/View.hpp:15:
include/genfile/bgen/bgen.hpp:1694:22: warning: unused variable 'max_id_length' [-Wunused-variable]
                        std::size_t const max_id_length = std::numeric_limits< uint16_t >::max() ;
                                          ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from loader.cpp:3:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
In file included from loader.cpp:1:
include/genfile/bgen/View.hpp:19:14: warning: function 'to_string' is not needed and will not be emitted [-Wunneeded-internal-declaration]
        std::string to_string( std::size_t i ) {
                    ^
10 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c openmx.cpp -o openmx.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c pgenlib_internal.cpp -o pgenlib_internal.o
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from pgenlib_internal.cpp:17:
In file included from ./pgenlib_internal.h:74:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
4 warnings generated.
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include     -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1  -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c plink2_base.cc -o plink2_base.o
In file included from plink2_base.cc:18:
./plink2_base.h:477:13: warning: 'getc_unlocked' macro redefined [-Wmacro-redefined]
#    define getc_unlocked getc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:308:9: note: previous definition is here
#define getc_unlocked(fp)       __sgetc(fp)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:478:13: warning: 'putc_unlocked' macro redefined [-Wmacro-redefined]
#    define putc_unlocked putc
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:309:9: note: previous definition is here
#define putc_unlocked(x, fp)    __sputc(x, fp)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:481:13: warning: 'ferror_unlocked' macro redefined [-Wmacro-redefined]
#    define ferror_unlocked ferror
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:394:9: note: previous definition is here
#define ferror_unlocked(p)      __sferror(p)
        ^
In file included from plink2_base.cc:18:
./plink2_base.h:482:13: warning: 'feof_unlocked' macro redefined [-Wmacro-redefined]
#    define feof_unlocked feof
            ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/stdio.h:393:9: note: previous definition is here
#define feof_unlocked(p)        __sfeof(p)
        ^
4 warnings generated.
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c sqlite3.c -o sqlite3.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c xxhash.c -o xxhash.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/BH/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/gwsem/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -I. -Iinclude -Iinclude/zstd-1.1.0 -Iinclude/zstd-1.1.0/common -Iinclude/zstd-1.1.0/compress -Iinclude/zstd-1.1.0/decompress -D SQLITE_ENABLE_COLUMN_METADATA -D SQLITE_ENABLE_STAT4 -D SQLITE_MAX_EXPR_DEPTH=10000 -D SQLITE_USE_URI=1    -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c zbuff_compress.c -o zbuff_compress.o
zbuff_compress.c:97:64: error: invalid application of 'sizeof' to an incomplete type 'ZBUFF_CCtx' (aka 'struct ZSTD_CCtx_s')
    zbc = (ZBUFF_CCtx*)customMem.customAlloc(customMem.opaque, sizeof(ZBUFF_CCtx));
                                                               ^     ~~~~~~~~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:99:20: error: invalid application of 'sizeof' to an incomplete type 'ZBUFF_CCtx' (aka 'struct ZSTD_CCtx_s')
    memset(zbc, 0, sizeof(ZBUFF_CCtx));
                   ^     ~~~~~~~~~~~~
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:77:33: note: expanded from macro 'memset'
                __builtin___memset_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                              ^~~~~~~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:100:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    memcpy(&zbc->customMem, &customMem, sizeof(ZSTD_customMem));
            ~~~^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:63:27: note: expanded from macro 'memcpy'
                __builtin___memcpy_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                        ^~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:100:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    memcpy(&zbc->customMem, &customMem, sizeof(ZSTD_customMem));
            ~~~^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_string.h:63:62: note: expanded from macro 'memcpy'
                __builtin___memcpy_chk (dest, __VA_ARGS__, __darwin_obsz0 (dest))
                                                                           ^~~~
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/secure/_common.h:38:55: note: expanded from macro '__darwin_obsz0'
#define __darwin_obsz0(object) __builtin_object_size (object, 0)
                                                      ^~~~~~
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:101:8: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->zc = ZSTD_createCCtx_advanced(customMem);
    ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:102:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->zc == NULL) { ZBUFF_freeCCtx(zbc); return NULL; }
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:109:22: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    ZSTD_freeCCtx(zbc->zc);
                  ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:25: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                     ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:51: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                                               ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:110:74: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->inBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->inBuff);
                                                                      ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:12: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
        ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:26: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                      ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:52: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                                                ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:111:75: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    if (zbc->outBuff) zbc->customMem.customFree(zbc->customMem.opaque, zbc->outBuff);
                                                                       ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:112:8: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->customMem.customFree(zbc->customMem.opaque, zbc);
    ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:112:34: error: incomplete definition of type 'struct ZSTD_CCtx_s'
    zbc->customMem.customFree(zbc->customMem.opaque, zbc);
                              ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:125:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
        if (zbc->inBuffSize < neededInBuffSize) {
            ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
zbuff_compress.c:126:16: error: incomplete definition of type 'struct ZSTD_CCtx_s'
            zbc->inBuffSize = neededInBuffSize;
            ~~~^
/usr/local/include/zstd.h:194:16: note: forward declaration of 'struct ZSTD_CCtx_s'
typedef struct ZSTD_CCtx_s ZSTD_CCtx;
               ^
fatal error: too many errors emitted, stopping now [-ferror-limit=]
20 errors generated.
make: *** [zbuff_compress.o] Error 1
ERROR: compilation failed for package ‘gwsem’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/gwsem/old/gwsem.Rcheck/gwsem’

```
# rpf

<details>

* Version: 1.0.3
* Source code: https://github.com/cran/rpf
* URL: https://github.com/jpritikin/rpf
* Date/Publication: 2020-02-23 18:10:02 UTC
* Number of recursive dependencies: 73

Run `revdep_details(,"rpf")` for more info

</details>

## In both

*   checking whether package ‘rpf’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/rpf/new/rpf.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘rpf’ ...
** package ‘rpf’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/rpf/Rcpp/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/rpf/RcppEigen/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp    -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘rpf’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/rpf/new/rpf.Rcheck/rpf’

```
### CRAN

```
* installing *source* package ‘rpf’ ...
** package ‘rpf’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/rpf/Rcpp/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/rpf/RcppEigen/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -fopenmp    -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c RcppExports.cpp -o RcppExports.o
clang: error: unsupported option '-fopenmp'
make: *** [RcppExports.o] Error 1
ERROR: compilation failed for package ‘rpf’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/rpf/old/rpf.Rcheck/rpf’

```
# vroom

<details>

* Version: 1.2.0
* Source code: https://github.com/cran/vroom
* URL: https://github.com/r-lib/vroom
* BugReports: https://github.com/r-lib/vroom/issues
* Date/Publication: 2020-01-13 22:40:02 UTC
* Number of recursive dependencies: 88

Run `revdep_details(,"vroom")` for more info

</details>

## In both

*   checking whether package ‘vroom’ can be installed ... ERROR
    ```
    Installation failed.
    See ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/vroom/new/vroom.Rcheck/00install.out’ for details.
    ```

## Installation

### Devel

```
* installing *source* package ‘vroom’ ...
** package ‘vroom’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c Iconv.cpp -o Iconv.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c LocaleInfo.cpp -o LocaleInfo.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c altrep.cc -o altrep.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c delimited_index.cc -o delimited_index.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c delimited_index_connection.cc -o delimited_index_connection.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c fixed_width_index_connection.cc -o fixed_width_index_connection.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c gen.cc -o gen.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c grisu3.c -o grisu3.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c guess_type.cc -o guess_type.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c index_collection.cc -o index_collection.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c localtime.c -o localtime.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c vroom.cc -o vroom.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c vroom_big_int.cc -o vroom_big_int.o
vroom_big_int.cc:23:13: error: use of undeclared identifier 'LONG_LONG_MAX'
  if (val > LONG_LONG_MAX) {
            ^
1 error generated.
make: *** [vroom_big_int.o] Error 1
ERROR: compilation failed for package ‘vroom’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/vroom/new/vroom.Rcheck/vroom’

```
### CRAN

```
* installing *source* package ‘vroom’ ...
** package ‘vroom’ successfully unpacked and MD5 sums checked
** using staged installation
** libs
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c Iconv.cpp -o Iconv.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c LocaleInfo.cpp -o LocaleInfo.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c RcppExports.cpp -o RcppExports.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c altrep.cc -o altrep.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c delimited_index.cc -o delimited_index.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c delimited_index_connection.cc -o delimited_index_connection.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c fixed_width_index_connection.cc -o fixed_width_index_connection.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c gen.cc -o gen.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c grisu3.c -o grisu3.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c guess_type.cc -o guess_type.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c index_collection.cc -o index_collection.o
clang -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include  -fPIC  -Wall -g -O2   -Wall -pedantic -fno-common -g -O0 -c localtime.c -o localtime.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c vroom.cc -o vroom.o
clang++ -std=gnu++11 -std=c++11 -I"/Library/Frameworks/R.framework/Resources/include" -DNDEBUG  -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/progress/include" -I"/Users/lionel/Desktop/lifecycle/revdep/library.noindex/vroom/Rcpp/include" -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -I/usr/local/include -Imio/include -DWIN32_LEAN_AND_MEAN -Ispdlog/include -fPIC  -Wall -g -O2  -arch x86_64 -ftemplate-depth-256 -Wall -pedantic -g -O0 -c vroom_big_int.cc -o vroom_big_int.o
vroom_big_int.cc:23:13: error: use of undeclared identifier 'LONG_LONG_MAX'
  if (val > LONG_LONG_MAX) {
            ^
1 error generated.
make: *** [vroom_big_int.o] Error 1
ERROR: compilation failed for package ‘vroom’
* removing ‘/Users/lionel/Desktop/lifecycle/revdep/checks.noindex/vroom/old/vroom.Rcheck/vroom’

```
