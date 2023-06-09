# EasyBuild 101

Easybuild makes use of **easyconfigs** which are configuration files to install packages. You can search for easyconfigs using `-S` option such as searching all M4 easyconfigs ``eb -S M4``. 

Let's install M4-1.4.19.eb we can do this as follows:

```console
siddiq90@login12> eb M4-1.4.19.eb
== Temporary log file in case of crash /tmp/eb-c4raYD/easybuild-v_A67B.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/m/M4/M4-1.4.19.eb
== building and installing M4/1.4.19...
== fetching files...
== ... (took 1 secs)
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== ... (took 58 secs)
== building...
== ... (took 5 secs)
== testing...
== installing...
== ... (took 1 secs)
== taking care of extensions...
== restore after iterating...
== postprocessing...
== sanity checking...
== ... (took 1 secs)
== cleaning up...
== creating module...
== ... (took 1 secs)
== permissions...
== packaging...
== COMPLETED: Installation ended successfully (took 1 min 11 secs)
== Results of the build can be found in the log file(s) /global/homes/s/siddiq90/.local/easybuild/software/M4/1.4.19/easybuild/easybuild-M4-1.4.19-20211004.143345.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-c4raYD/easybuild-v_A67B.log* have been removed.
== Temporary directory /tmp/eb-c4raYD has been removed.
```

The `eb -D` will show dry run of all easyconfigs that will be installed. The `[x]` indicates package is already installed. 

```console
siddiq90@login12> eb bzip2-1.0.8-GCCcore-10.3.0.eb -D
== Temporary log file in case of crash /tmp/eb-C6dayA/easybuild-LE4e0h.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
Dry run: printing build status of easyconfigs and dependencies
CFGS=/global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs
 * [x] $CFGS/m/M4/M4-1.4.18.eb (module: M4/1.4.18)
 * [ ] $CFGS/b/Bison/Bison-3.7.6.eb (module: Bison/3.7.6)
 * [x] $CFGS/b/Bison/Bison-3.5.3.eb (module: Bison/3.5.3)
 * [x] $CFGS/z/zlib/zlib-1.2.11.eb (module: zlib/1.2.11)
 * [x] $CFGS/h/help2man/help2man-1.47.4.eb (module: help2man/1.47.4)
 * [x] $CFGS/f/flex/flex-2.6.4.eb (module: flex/2.6.4)
 * [ ] $CFGS/b/binutils/binutils-2.36.1.eb (module: binutils/2.36.1)
 * [ ] $CFGS/g/GCCcore/GCCcore-10.3.0.eb (module: GCCcore/10.3.0)
 * [ ] $CFGS/h/help2man/help2man-1.48.3-GCCcore-10.3.0.eb (module: help2man/1.48.3-GCCcore-10.3.0)
 * [ ] $CFGS/m/M4/M4-1.4.18-GCCcore-10.3.0.eb (module: M4/1.4.18-GCCcore-10.3.0)
 * [ ] $CFGS/z/zlib/zlib-1.2.11-GCCcore-10.3.0.eb (module: zlib/1.2.11-GCCcore-10.3.0)
 * [ ] $CFGS/b/Bison/Bison-3.7.6-GCCcore-10.3.0.eb (module: Bison/3.7.6-GCCcore-10.3.0)
 * [ ] $CFGS/f/flex/flex-2.6.4-GCCcore-10.3.0.eb (module: flex/2.6.4-GCCcore-10.3.0)
 * [ ] $CFGS/b/binutils/binutils-2.36.1-GCCcore-10.3.0.eb (module: binutils/2.36.1-GCCcore-10.3.0)
 * [ ] $CFGS/b/bzip2/bzip2-1.0.8-GCCcore-10.3.0.eb (module: bzip2/1.0.8-GCCcore-10.3.0)
== Temporary log file(s) /tmp/eb-C6dayA/easybuild-LE4e0h.log* have been removed.
== Temporary directory /tmp/eb-C6dayA has been removed.
```

The `eb -x` will show extended dry run output that can be useful for understanding how easybuild will build, install and generate modulefile.

Easybuild won't install all dependencies by default you should run `--robot` to ensure eb will resolve all dependencies. Take for instance this example

```console
siddiq90@login12> eb bzip2-1.0.8-GCCcore-10.3.0.eb 
== Temporary log file in case of crash /tmp/eb-nnbJVf/easybuild-Cf6er3.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/b/bzip2/bzip2-1.0.8-GCCcore-10.3.0.eb
== building and installing bzip2/1.0.8-GCCcore-10.3.0...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== FAILED: Installation ended unsuccessfully (build directory: /global/homes/s/siddiq90/.local/easybuild/build/bzip2/1.0.8/GCCcore-10.3.0): build failed (first 300 chars): Missing modules for dependencies (use --robot?): binutils/2.36.1-GCCcore-10.3.0 (took 2 secs)
== Results of the build can be found in the log file(s) /tmp/eb-nnbJVf/easybuild-bzip2-1.0.8-20211004.143700.jwrFv.log
ERROR: Build of /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/b/bzip2/bzip2-1.0.8-GCCcore-10.3.0.eb failed (err: 'build failed (first 300 chars): Missing modules for dependencies (use --robot?): binutils/2.36.1-GCCcore-10.3.0')
```

If you try installing an easyconfig that is already installed you will get the following message

```console
siddiq90@login12> eb M4-1.4.19.eb
== Temporary log file in case of crash /tmp/eb-1LiUHF/easybuild-740bgf.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== M4/1.4.19 is already installed (module found), skipping
== No easyconfigs left to be built.
== Build succeeded for 0 out of 0
== Temporary log file(s) /tmp/eb-1LiUHF/easybuild-740bgf.log* have been removed.
== Temporary directory /tmp/eb-1LiUHF has been removed.
```

Easybuild will look at the current modules in your active **MODULEPATH** in this case our previous M4 installation is located in the following location

```console
siddiq90@login12> module av M4/1.4.19

---------------------------------------------------------- /global/homes/s/siddiq90/.local/easybuild/modules/all -----------------------------------------------------------
   M4/1.4.19 (D)

  Where:
   D:  Default Module

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```

If you want to rebuild the software, use the `--rebuild` and eb will rebuild the software from source

```console
siddiq90@login12> eb M4-1.4.19.eb --rebuild
== Temporary log file in case of crash /tmp/eb-aoDIpZ/easybuild-SWhzMh.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/m/M4/M4-1.4.19.eb
== building and installing M4/1.4.19...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== ... (took 1 secs)
== patching...
== preparing...
== configuring...
== ... (took 46 secs)
== building...
== ... (took 4 secs)
== testing...
== installing...
== ... (took 1 secs)
== taking care of extensions...
== restore after iterating...
== postprocessing...
== sanity checking...
== cleaning up...
== creating module...
== permissions...
== packaging...
== COMPLETED: Installation ended successfully (took 55 secs)
== Results of the build can be found in the log file(s) /global/homes/s/siddiq90/.local/easybuild/software/M4/1.4.19/easybuild/easybuild-M4-1.4.19-20211004.144303.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-aoDIpZ/easybuild-SWhzMh.log* have been removed.
== Temporary directory /tmp/eb-aoDIpZ has been removed.
```

easybuild will perform all stages `configure`, `build`, `install`, `test` including module generation. Let's assume you want to only update modulefile you can do this via `--module-only` option with
`--rebuild` and eb will skip all the other stages

```
siddiq90@login12> eb M4-1.4.19.eb --rebuild --module-only
== Temporary log file in case of crash /tmp/eb-oNR8vh/easybuild-2TSyFu.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/m/M4/M4-1.4.19.eb
== building and installing M4/1.4.19...
== fetching files [skipped]
== creating build dir, resetting environment...
== backup of existing module file stored at /global/homes/s/siddiq90/.local/easybuild/modules/all/M4/1.4.19.bak_20211004144404_30455
== unpacking [skipped]
== patching [skipped]
== preparing...
== configuring [skipped]
== building [skipped]
== testing [skipped]
== installing [skipped]
== taking care of extensions [skipped]
== restore after iterating...
== postprocessing [skipped]
== sanity checking...
== cleaning up [skipped]
== creating module...
== comparing module file with backup /global/homes/s/siddiq90/.local/easybuild/modules/all/M4/1.4.19.bak_20211004144404_30455; no differences found
== ... (took 1 secs)
== permissions [skipped]
== packaging [skipped]
== COMPLETED: Installation ended successfully (took 2 secs)
== Results of the build can be found in the log file(s) /global/homes/s/siddiq90/.local/easybuild/software/M4/1.4.19/easybuild/easybuild-M4-1.4.19-20211004.144407.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-oNR8vh/easybuild-2TSyFu.log* have been removed.
== Temporary directory /tmp/eb-oNR8vh has been removed.
```

All easyconfigs are built via toolchains which are defined in easybuild. A toolchain consist of compiler, MPI, blas, library. For list of available toolchain you can run the following
command:

```console
siddiq90@login12> eb --list-toolchains
List of known toolchains (toolchainname: module[,module...]):
	ClangGCC: Clang, GCC
	CrayCCE: PrgEnv-cray
	CrayGNU: PrgEnv-gnu
	CrayIntel: PrgEnv-intel
	CrayPGI: PrgEnv-pgi
	FCC: lang
	Fujitsu: FCC, FFTW
	GCC: GCC
	GCCcore: GCCcore
	GNU: GCC
	NVHPC: NVHPC
	PGI: PGI
	cgmpich: Clang, GCC, MPICH
	cgmpolf: BLACS, Clang, FFTW, GCC, MPICH, OpenBLAS, ScaLAPACK
	cgmvapich2: Clang, GCC, MVAPICH2
	cgmvolf: BLACS, Clang, FFTW, GCC, MVAPICH2, OpenBLAS, ScaLAPACK
	cgompi: Clang, GCC, OpenMPI
	cgoolf: BLACS, Clang, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	ffmpi: FCC
	foss: BLACS, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	fosscuda: BLACS, CUDA, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	gcccuda: CUDA, GCC
	gimkl: GCC, imkl, impi
	gimpi: GCC, impi
	gimpic: CUDA, GCC, impi
	giolf: BLACS, FFTW, GCC, OpenBLAS, ScaLAPACK, impi
	giolfc: BLACS, CUDA, FFTW, GCC, OpenBLAS, ScaLAPACK, impi
	gmacml: ACML, BLACS, FFTW, GCC, MVAPICH2, ScaLAPACK
	gmkl: GCC, imkl
	gmklc: CUDA, GCC, imkl
	gmpich: GCC, MPICH
	gmpich2: GCC, MPICH2
	gmpolf: BLACS, FFTW, GCC, MPICH, OpenBLAS, ScaLAPACK
	gmvapich2: GCC, MVAPICH2
	gmvolf: BLACS, FFTW, GCC, MVAPICH2, OpenBLAS, ScaLAPACK
	goalf: ATLAS, BLACS, FFTW, GCC, OpenMPI, ScaLAPACK
	gobff: BLACS, BLIS, FFTW, GCC, OpenMPI, ScaLAPACK, libFLAME
	goblf: BLACS, BLIS, FFTW, GCC, LAPACK, OpenMPI, ScaLAPACK
	gofbf: BLACS, FFTW, FlexiBLAS, GCC, OpenMPI, ScaLAPACK
	golf: FFTW, GCC, OpenBLAS
	golfc: CUDA, FFTW, GCC, OpenBLAS
	gomkl: GCC, OpenMPI, imkl
	gomklc: CUDA, GCC, OpenMPI, imkl
	gompi: GCC, OpenMPI
	gompic: CUDA, GCC, OpenMPI
	goolf: BLACS, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	goolfc: BLACS, CUDA, FFTW, GCC, OpenBLAS, OpenMPI, ScaLAPACK
	gpsmpi: GCC, psmpi
	gpsolf: BLACS, FFTW, GCC, OpenBLAS, ScaLAPACK, psmpi
	gqacml: ACML, BLACS, FFTW, GCC, QLogicMPI, ScaLAPACK
	gsmpi: GCC, SpectrumMPI
	gsolf: BLACS, FFTW, GCC, OpenBLAS, ScaLAPACK, SpectrumMPI
	iccifort: icc, ifort
	iccifortcuda: CUDA, icc, ifort
	ictce: icc, ifort, imkl, impi
	iibff: BLACS, BLIS, FFTW, ScaLAPACK, icc, ifort, impi, libFLAME
	iimkl: icc, ifort, imkl
	iimklc: CUDA, icc, ifort, imkl
	iimpi: icc, ifort, impi
	iimpic: CUDA, icc, ifort, impi
	iiqmpi: QLogicMPI, icc, ifort
	impich: MPICH, icc, ifort
	impmkl: MPICH, icc, ifort, imkl
	intel: icc, ifort, imkl, impi
	intel-compilers: intel-compilers
	intel-para: icc, ifort, imkl, psmpi
	intelcuda: CUDA, icc, ifort, imkl, impi
	iomkl: OpenMPI, icc, ifort, imkl
	iomklc: CUDA, OpenMPI, icc, ifort, imkl
	iompi: OpenMPI, icc, ifort
	iompic: CUDA, OpenMPI, icc, ifort
	ipsmpi: icc, ifort, psmpi
	iqacml: ACML, BLACS, FFTW, QLogicMPI, ScaLAPACK, icc, ifort
	ismkl: MPICH2, icc, ifort, imkl
	nvompic: CUDA, NVHPC, OpenMPI
	nvpsmpic: CUDA, NVHPC, psmpi
	pmkl: PGI, imkl
	pomkl: OpenMPI, PGI, imkl
	pompi: OpenMPI, PGI
	system: 
	xlcxlf: xlc, xlf
	xlmpich: MPICH, xlc, xlf
	xlmpich2: MPICH2, xlc, xlf
	xlmvapich2: MVAPICH2, xlc, xlf
	xlompi: OpenMPI, xlc, xlf
```

Let's assume you want to install **bzip2-1.0.8.eb** but there is no easyconfig however we see there is an easyconfig for 1.0.6

```
siddiq90@login12> eb bzip2-1.0.8.eb -D
== Temporary log file in case of crash /tmp/eb-Qo5po0/easybuild-aUN0m0.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
ERROR: One or more files not found: bzip2-1.0.8.eb (search paths: /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs)

siddiq90@login12> eb -S bzip2-1.0.6.eb 
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
CFGS1=/global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/b/bzip2
 * $CFGS1/bzip2-1.0.6.eb
```

One way to work around this issue is create an easyconfig by hand or use the eb `--try*` options. See https://docs.easybuild.io/en/latest/Using_the_EasyBuild_command_line.html#tweaking-existing-easyconfig-files-using-try for list of options.

Let's assume you want to build bzip2 you can specify an input easyconfig and use `--try-software-version` to specify an alternate version. In example below we see easybuild will tweak the easyconfig version

```
siddiq90@login12> eb bzip2-1.0.6.eb --try-software-version=1.0.8 -D
== Temporary log file in case of crash /tmp/eb-7YUnCC/easybuild-OYdDjl.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
Dry run: printing build status of easyconfigs and dependencies
CFGS=/tmp/eb-7YUnCC/tweaked_easyconfigs
 * [ ] $CFGS/bzip2-1.0.8.eb (module: bzip2/1.0.8)
== Temporary log file(s) /tmp/eb-7YUnCC/easybuild-OYdDjl.log* have been removed.
== Temporary directory /tmp/eb-7YUnCC has been removed.
``` 

Now let's install bzip2 1.0.8

```console
siddiq90@login12> eb bzip2-1.0.6.eb --try-software-version=1.0.8 
== Temporary log file in case of crash /tmp/eb-jADhY3/easybuild-DQPoBL.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== processing EasyBuild easyconfig /tmp/eb-jADhY3/tweaked_easyconfigs/bzip2-1.0.8.eb
== building and installing bzip2/1.0.8...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
== patching...
== preparing...
== configuring...
== building...
== ... (took 1 secs)
== testing...
== installing...
== ... (took 1 secs)
== taking care of extensions...
== restore after iterating...
== postprocessing...
== sanity checking...
== ... (took 1 secs)
== cleaning up...
== creating module...
== ... (took 1 secs)
== permissions...
== packaging...
== COMPLETED: Installation ended successfully (took 6 secs)
== Results of the build can be found in the log file(s) /global/homes/s/siddiq90/.local/easybuild/software/bzip2/1.0.8/easybuild/easybuild-bzip2-1.0.8-20211004.145543.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-jADhY3/easybuild-DQPoBL.log* have been removed.
== Temporary directory /tmp/eb-jADhY3 has been removed.
```

Similarly, you can tweak the toolchain name or toolchain version using `--try-toolchain-name`, `--try-toolchain-version`. 

To see content of a given easyconfig you can specify name of easyconfig and use the `--show-ec` option

```console
siddiq90@login12> eb bzip2-1.0.6.eb --show-ec
== Temporary log file in case of crash /tmp/eb-rdibcU/easybuild-F7oCVS.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== Contents of /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/b/bzip2/bzip2-1.0.6.eb:
name = 'bzip2'
version = '1.0.6'

homepage = 'https://sourceware.org/bzip2'
description = """bzip2 is a freely available, patent free, high-quality data compressor. It typically 
compresses files to within 10% to 15% of the best available techniques (the PPM family of statistical 
compressors), whilst being around twice as fast at compression and six times faster at decompression."""

toolchain = SYSTEM
toolchainopts = {'pic': True}

source_urls = ['https://sourceware.org/pub/bzip2/']
sources = [SOURCE_TAR_GZ]
patches = ['bzip2-%(version)s-pkgconfig.patch']
checksums = [
    'a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd',  # bzip2-1.0.6.tar.gz
    '5a823e820b332eca3684416894f58edc125ac3dace9f46e62f98e45362aa8a6d',  # bzip2-1.0.6-pkgconfig.patch
]

buildopts = "CC=gcc CFLAGS='-Wall -Winline -O3 -fPIC -g $(BIGFILES)'"

# building of shared libraries doesn't work on OS X (where 'gcc' is actually Clang...)
with_shared_libs = OS_TYPE == 'Linux'

moduleclass = 'tools'

== Temporary log file(s) /tmp/eb-rdibcU/easybuild-F7oCVS.log* have been removed.
== Temporary directory /tmp/eb-rdibcU has been removed.
```

If you want see all software provided by easybuild you can run the following. 

```
eb --list-software
```

The core implementation for software is implemented in python classes called easyblocks. The [easybuild-easyblocks](https://github.com/easybuilders/easybuild-easyblocks) repo contains all the easyblocks. You can see all the easyblocks via `eb --list-easyblocks`. The `eb -a` option can show all options for easyconfigs. Shown below are all easyconfig options

```console
siddiq90@login06> eb -a
Available easyconfig parameters:

MANDATORY
---------
description             A short description of the software [default: None]
docurls                 List of urls with documentation of the software (not necessarily on homepage) [default: None]
homepage                The homepage of the software [default: None]
name                    Name of software [default: None]
software_license        Software license [default: None]
software_license_urls   List of software license locations [default: None]
toolchain               Name and version of toolchain [default: None]
version                 Version of software [default: None]

TOOLCHAIN
---------
onlytcmod       Boolean/string to indicate if the toolchain should only load the environment with module (True) or also set all other variables (False) like compiler CC etc (if string: comma separated list of variables that will be ignored). [default: False]
toolchainopts   Extra options for compilers [default: None]

BUILD
-----
banned_linked_shared_libs     List of shared libraries (names, file names, or paths) which are not allowed to be linked in any installed binary/library [default: []]
bin_lib_subdirs               List of subdirectories for binaries and libraries, which is used during sanity check to check RPATH linking and banned/required libraries [default: []]
bitbucket_account             Bitbucket account name to be used to resolve template values in source URLs [default: "%(namelower)s"]
buildopts                     Extra options passed to make step (default already has -j X) [default: ""]
checksums                     Checksums for sources and patches [default: []]
configopts                    Extra options passed to configure (default already has --prefix) [default: ""]
cuda_compute_capabilities     List of CUDA compute capabilities to build with (if supported) [default: []]
easyblock                     EasyBlock to use for building; if set to None, an easyblock is selected based on the software name [default: None]
easybuild_version             EasyBuild-version this spec-file was written for [default: None]
enhance_sanity_check          Indicate that additional sanity check commands & paths should enhance the existin sanity check, not replace it [default: False]
fix_bash_shebang_for          List of files for which Bash shebang should be fixed to '#!/usr/bin/env bash' (glob patterns supported) [default: None]
fix_perl_shebang_for          List of files for which Perl shebang should be fixed to '#!/usr/bin/env perl' (glob patterns supported) [default: None]
fix_python_shebang_for        List of files for which Python shebang should be fixed to '#!/usr/bin/env python' (glob patterns supported) [default: None]
github_account                GitHub account name to be used to resolve template values in source URLs [default: "%(namelower)s"]
hidden                        Install module file as 'hidden' by prefixing its version with '.' [default: False]
installopts                   Extra options for installation [default: ""]
maxparallel                   Max degree of parallelism [default: None]
parallel                      Degree of parallelism for e.g. make (default: based on the number of cores, active cpuset and restrictions in ulimit) [default: None]
patches                       List of patches to apply [default: []]
postinstallcmds               Commands to run after the install step. [default: []]
prebuildopts                  Extra options pre-passed to build command. [default: ""]
preconfigopts                 Extra options pre-passed to configure. [default: ""]
preinstallopts                Extra prefix options for installation. [default: ""]
pretestopts                   Extra prefix options for test. [default: ""]
required_linked_shared_libs   List of shared libraries (names, file names, or paths) which must be linked in all installed binaries/libraries [default: []]
runtest                       Indicates if a test should be run after make; should specify argument after make (for e.g.,"test" for make test) [default: None]
sanity_check_commands         format: [(name, options)] e.g. [('gzip','-h')]. Using a non-tuple is equivalent to (name, '-h') [default: []]
sanity_check_paths            List of files and directories to check (format: {'files':<list>, 'dirs':<list>}) [default: {}]
skip                          Skip existing software [default: False]
skipsteps                     Skip these steps [default: []]
source_urls                   List of URLs for source files [default: []]
sources                       List of source files [default: []]
stop                          Keyword to halt the build process after a certain step. [default: None]
testopts                      Extra options for test. [default: ""]
tests                         List of test-scripts to run after install. A test script should return a non-zero exit status to fail [default: []]
unpack_options                Extra options for unpacking source [default: ""]
unwanted_env_vars             List of environment variables that shouldn't be set during build [default: []]
versionprefix                 Additional prefix for software version (placed before version and toolchain name) [default: ""]
versionsuffix                 Additional suffix for software version (placed after toolchain name) [default: ""]

FILE-MANAGEMENT
---------------
buildininstalldir      Boolean to build (True) or not build (False) in the installation directory [default: False]
cleanupoldbuild        Boolean to remove (True) or backup (False) the previous build directory with identical name or not. [default: True]
cleanupoldinstall      Boolean to remove (True) or backup (False) the previous install directory with identical name or not. [default: True]
dontcreateinstalldir   Boolean to create (False) or not create (True) the install directory [default: False]
keeppreviousinstall    Boolean to keep the previous installation with identical name. Experts only! [default: False]
keepsymlinks           Boolean to determine whether symlinks are to be kept during copying or if the content of the files pointed to should be copied [default: False]
start_dir              Path to start the make in. If the path is absolute, use that path. If not, this is added to the guessed path. [default: None]

DEPENDENCIES
------------
allow_system_deps         Allow listed system dependencies (format: (<name>, <version>)) [default: []]
builddependencies         List of build dependencies [default: []]
dependencies              List of dependencies [default: []]
hiddendependencies        List of dependencies available as hidden modules [default: []]
moddependpaths            Absolute path(s) to prepend to MODULEPATH before loading dependencies [default: None]
multi_deps                Dict of lists of dependency versions over which to iterate [default: {}]
multi_deps_load_default   Load module for first version listed in multi_deps by default [default: True]
osdependencies            OS dependencies that should be present on the system [default: []]

LICENSE
-------
accept_eula           Accepted End User License Agreement (EULA) for this software [default: False]
group                 Name of the user group for which the software should be available; format: string or 2-tuple with group name + custom error for users outside group [default: None]
key                   Key for installing software [default: None]
license_file          License file for software [default: None]
license_server        License server for software [default: None]
license_server_port   Port for license server [default: None]

EXTENSIONS
----------
exts_classmap            Map of extension name to class for handling build and installation. [default: {}]
exts_default_options     List of default options for extensions [default: {}]
exts_defaultclass        List of module for and name of the default extension class [default: None]
exts_download_dep_fail   Fail if downloaded dependencies are detected for extensions [default: False]
exts_filter              Extension filter details: template for cmd and input to cmd (templates for ext_name, ext_version and src). [default: None]
exts_list                List with extensions added to the base installation [default: []]

MODULES
-------
allow_prepend_abs_path       Allow specifying absolute paths to prepend in modextrapaths [default: False]
citing                       Free-form text that describes how the software should be cited in publications [default: None]
docpaths                     List of paths for documentation relative to installation directory [default: None]
examples                     Free-form text with examples on using the software [default: None]
include_modpath_extensions   Include $MODULEPATH extensions specified by module naming scheme. [default: True]
modaliases                   Aliases to be defined in module file [default: {}]
modaltsoftname               Module name to use (rather than using software name [default: None]
modextrapaths                Extra paths to be prepended in module file [default: {}]
modextravars                 Extra environment variables to be added to module file [default: {}]
modloadmsg                   Message that should be printed when generated module is loaded [default: {}]
modluafooter                 Footer to include in generated module file (Lua syntax) [default: ""]
modtclfooter                 Footer to include in generated module file (Tcl syntax) [default: ""]
module_depends_on            Use depends_on (Lmod 7.6.1+) for dependencies in generated module (implies recursive unloading of modules). [default: False]
moduleclass                  Module class to be used for this software [default: "base"]
moduleforceunload            Force unload of all modules when loading the extension [default: False]
moduleloadnoconflict         Don't check for conflicts, unload other versions instead  [default: False]
recursive_module_unload      Recursive unload of all dependencies when unloading module (True/False to hard enable/disable; None implies honoring the --recursive-module-unload EasyBuild configuration setting [default: None]
site_contacts                String/list of strings with site contacts for the software [default: None]
upstream_contacts            String/list of strings with upstream contact addresses (e.g., support e-mail, mailing list, bugtracker) [default: None]
usage                        Usage instructions for the software [default: None]
whatis                       List of brief (one line) description entries for the software [default: None]

OTHER
-----
block        List of other 'block' sections on which this block depends (only relevant in easyconfigs with subblocks) [default: None]
buildstats   A list of dicts with build statistics [default: None]
deprecated   String specifying reason why this easyconfig file is deprecated and will be archived in the next major release of EasyBuild [default: False]
```

