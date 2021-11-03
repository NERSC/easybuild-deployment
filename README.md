# Easybuild Perlmutter

This repo contains [easybuild](https://docs.easybuild.io/en/latest/) configuration for Perlmutter. The easybuild stack is built in following location `/global/common/software/nersc/easybuild/perlmutter/21.10` you can run access the easybuild stack by loadin the following modulefile

```
module load nersc-easybuild/21.10
```

This will expose the moduletree and load `Easybuild` modulefile which provides the `eb` command that is used to install easyconfigs. 


By default easybuild will install packages in your user space you can run the following to see easybuild configuration

```
siddiq90@login12> eb --show-config
#
# Current EasyBuild configuration
# (C: command line argument, D: default value, E: environment variable, F: configuration file)
#
buildpath      (D) = /global/homes/s/siddiq90/.local/easybuild/build
containerpath  (D) = /global/homes/s/siddiq90/.local/easybuild/containers
installpath    (D) = /global/homes/s/siddiq90/.local/easybuild
repositorypath (D) = /global/homes/s/siddiq90/.local/easybuild/ebfiles_repo
robot-paths    (D) = /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs
sourcepath     (D) = /global/homes/s/siddiq90/.local/easybuild/sources
```

To see a complete listing of easybuild configuration you can run the following

```
eb --show-full-config
```

## How to use perlmutter easybuild configuration?

The easybuild configuration for perlmutter is defined in [perlmutter.config](https://software.nersc.gov/NERSC/easybuild/-/blob/main/perlmutter.config). Upon cloning this repo, you have few ways to use this configuration file

1. Copy the configuration to default location

```
mkdir -p $HOME/.config/easybuild
cp perlmutter.config $HOME/.config/easybuild/config.cfg
```

2. Use via command line argument ``eb --configfiles /path/to/perlmutter.config``
3. Use Environment variable ``EASYBUILD_CONFIGFILES=/path/to/perlmutter.config``

In this example, we have set the environment variable to point to **perlmutter.config**, if its done correctly you should see configuration tuned 
for perlmutter.

```console
siddiq90@login06> export EASYBUILD_CONFIGFILES=$HOME/software.nersc.gov/easybuild/perlmutter.config
siddiq90@login06> eb --show-config
#
# Current EasyBuild configuration
# (C: command line argument, D: default value, E: environment variable, F: configuration file)
#
buildpath          (F) = /global/common/software/nersc/easybuild/perlmutter/21.10/build
configfiles        (E) = /global/homes/s/siddiq90/software.nersc.gov/easybuild/perlmutter.config
containerpath      (F) = /global/common/software/nersc/easybuild/perlmutter/21.10/containers
hide-deps          (F) = Bison, DB, expat, flex, gettext, groff, help2man, hypothesis, libarchive, libevent, libfabric, libffi, libiconv, Libint, libpciaccess, libreadline, libcx, libxml2, libxsmm, makeinfo, pybind11, xorg-macros
installpath        (F) = /global/common/software/nersc/easybuild/perlmutter/21.10
minimal-toolchains (F) = True
packagepath        (F) = /global/common/software/nersc/easybuild/perlmutter/21.10/packages
prefix             (F) = /global/common/software/nersc/easybuild/perlmutter/21.10
repositorypath     (F) = /global/common/software/nersc/easybuild/perlmutter/21.10/ebfiles_repo
robot-paths        (D) = /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs
sourcepath         (F) = /global/common/software/nersc/easybuild/sources
```

## Where does easybuild store tarballs?

All easyconfig source files are stored in **/global/common/software/nersc/easybuild/sources**, this is configured via **sourcepath** configuration parameter. We recommend there is a single source directory to avoid redundant copy of source tarballs. easybuild will fetch tarballs from mirrors defined in easyconfig. There is one sub-directory per letter followed by name of easybuild package as a sub-directory where corresponding tarballs will be stored. For instance `binutils` package will store its tarball in `b/binutils` directory. In the event you need to manually download a tarball because easybuild can't fetch from upstream such as proprietary software you should download and move the file in the corresponding directory.

```
siddiq90@login12> ls /global/common/software/nersc/easybuild/sources
b  c  f  g  generic  h  i  m  n  o  s  z

siddiq90@login12> ls /global/common/software/nersc/easybuild/sources/b/binutils/
binutils-2.35.2.tar.gz
```

If you see an error with lock files such as error below you can remove the lock directory and try again.

```
siddiq90@login15> eb easyconfigs/* --robot
== Temporary log file in case of crash /tmp/eb-kC6a60/easybuild-sP1U3o.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== resolving dependencies ...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/g/GCCcore/GCCcore-10.2.0.eb
== building and installing GCCcore/10.2.0...
== FAILED: Installation ended unsuccessfully (build directory: /global/common/software/nersc/easybuild/perlmutter/21.10/build/GCCcore/10.2.0/system-system): build failed (first 300 chars): Lock /global/common/software/nersc/easybuild/perlmutter/21.10/software/.locks/_global_common_software_nersc_easybuild_perlmutter_21.10_software_GCCcore_10.2.0.lock already exists, aborting! (took 0 secs)
== Results of the build can be found in the log file(s) /tmp/eb-kC6a60/easybuild-GCCcore-10.2.0-20211004.151336.opAEN.log
ERROR: Build of /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/g/GCCcore/GCCcore-10.2.0.eb failed (err: 'build failed (first 300 chars): Lock /global/common/software/nersc/easybuild/perlmutter/21.10/software/.locks/_global_common_software_nersc_easybuild_perlmutter_21.10_software_GCCcore_10.2.0.lock already exists, aborting!')
```

## Copying Easyconfigs

If you want to contribute easyconfigs, please contribute them in [easyconfigs](https://software.nersc.gov/NERSC/easybuild/-/tree/main/easyconfigs) directory. You can copy easyconfigs using the `--copy-ec` option and specify path to directory. If you need to make any modification, please make them before contributing back.

```
siddiq90@login15> eb CP2K-8.1-foss-2020b.eb --copy-ec easyconfigs
== Temporary log file in case of crash /tmp/eb-_tUiJO/easybuild-n0F_Uo.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
/global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/c/CP2K/CP2K-8.1-foss-2020b.eb copied to easyconfigs
== Temporary log file(s) /tmp/eb-_tUiJO/easybuild-n0F_Uo.log* have been removed.
```

To install all easyconfigs just run the following

```
eb easyconfigs/* --robot
```

## Rebuilding Modules

Sometimes you want to rebuild the modulefiles without rebuilding the underlying software. The cleanest way to rebuild the entire stack would be to do the following

```
eb easyconfigs/* -r --module-only --rebuild
```

This will rebuild all the modules without rebuilding the software. However sometimes you may have leftover modulefiles as part of broken builds. In this case there are some extra steps that needs to be done. First we need to move `Easybuild` modulefile out of directory and remove all modulefiles 

```
cd /global/common/software/nersc/easybuild/perlmutter/21.10/modules/all
mv Easybuild ..
rm -rf /global/common/software/nersc/easybuild/perlmutter/21.10/modules/all/*
mv Easybuild /global/common/software/nersc/easybuild/perlmutter/21.10/modules/all/
```

Next navigate to your root wherever you cloned this repo and then run the following:

```
eb easyconfigs/* -r --module-only --rebuild
```


If this is done correctly you will see the following with all steps being skipped except for module generation. This will be processed for all easyconfigs which can take some time.

```
siddiq90@login39> eb easyconfigs/* -r --module-only --rebuild
== Temporary log file in case of crash /tmp/eb-nk2rnnxz/easybuild-02vx6dgb.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...
== resolving dependencies ...
== processing EasyBuild easyconfig /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs/c/CUDAcore/CUDAcore-11.1.1.eb
== building and installing CUDAcore/11.1.1...
== fetching files [skipped]
== creating build dir, resetting environment...
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
== ... (took 1 secs)
== cleaning up [skipped]
== creating module...
== ... (took 1 secs)
== permissions [skipped]
== packaging [skipped]
== COMPLETED: Installation ended successfully (took 5 secs)
== Results of the build can be found in the log file(s) /global/common/software/nersc/easybuild/perlmutter/21.10/software/CUDAcore/11.1.1/easybuild/easybuild-CUDAcore-11.1.1-20211031.175734.log
```

## How to rebuild stack from source

The software stack is installed in `/global/common/software/nersc/easybuild/perlmutter/21.10/software`, you can simply remove this entire directory
tree and then rebuild the stack from source by running

```
eb easyconfigs/*.eb -r
```

Please take note of the umask before installing the stack, we want to make sure group `nstaff` has write access inorder to build in same stack. The umask should be the following. 

```
siddiq90@login39> umask
0002
```

The umask setting is defined in easybuild configuration and should be the following

```
siddiq90@login39> eb --show-config | grep umask
umask              (F) = 002
```

You can rebuild the existing software from source by running the following

```
eb easyconfigs/*.eb -r --rebuild --force
```

## Installing New Easybuild

Each easybuild stack will be based on a fixed version of easybuild. New version of easybuild can be installed via following command

```
eb --install-latest-eb-release
```


For production, we should do something like this, let's assume we will build for Mar 2022, we will specify the `--prefix` path when installing easybuild

```
siddiq90@login39> eb --install-latest-eb-release --prefix=/global/common/software/nersc/easybuild/perlmutter/22.03
== Temporary log file in case of crash /tmp/eb-jibbt155/easybuild-pkpadxgu.log
== found valid index for /global/common/software/nersc/easybuild/perlmutter/21.10/software/EasyBuild/4.4.2/easybuild/easyconfigs, so using it...

WARNING: Deprecated functionality, will no longer work in v5.0: Use of 'dummy' toolchain is deprecated, use 'system' toolchain instead; see http://easybuild.readthedocs.org/en/latest/Deprecated-functionality.html for more information

== processing EasyBuild easyconfig /tmp/eb-jibbt155/tmpdod7to5k/easybuilders/easybuild-easyconfigs-develop/easybuild/easyconfigs/e/EasyBuild/EasyBuild-4.5.0.eb
== building and installing EasyBuild/4.5.0...
== fetching files...
== creating build dir, resetting environment...
== unpacking...
c== ... (took 11 secs)
== patching...
== preparing...
== configuring...
== building...
== testing...
== installing...
== ... (took 28 secs)
== taking care of extensions...
== restore after iterating...
== postprocessing...
== sanity checking...
== ... (took 6 secs)
== cleaning up...
== ... (took 7 secs)
== creating module...
== ... (took 1 secs)
== permissions...
== ... (took 3 secs)
== packaging...
== COMPLETED: Installation ended successfully (took 1 min 1 secs)
== Results of the build can be found in the log file(s) /global/common/software/nersc/easybuild/perlmutter/22.03/software/EasyBuild/4.5.0/easybuild/easybuild-EasyBuild-4.5.0-20211031.191453.log
== Build succeeded for 1 out of 1
== Temporary log file(s) /tmp/eb-jibbt155/easybuild-pkpadxgu.log* have been removed.
== Temporary directory /tmp/eb-jibbt155 has been removed.

```


This will install a `Easybuild` modulefile which can be accessed by running. Note that Lmod automatically swapped to newer eb version 

```
siddiq90@login39> module use /global/common/software/nersc/easybuild/perlmutter/22.03/modules/all/

The following have been reloaded with a version change:
  1) EasyBuild/4.4.2 => EasyBuild/4.5.0

siddiq90@login39> eb --version
This is EasyBuild 4.5.0 (framework: 4.5.0, easyblocks: 4.5.0) on host login39.
```

# References

- Easybuild Documentation: https://easybuild.rtfd.io/
- EasyBuild Home Page: https://easybuild.io/
- Easybuild GitHub: https://github.com/easybuilders/easybuild
- EasyBuild Slack: https://easybuild.slack.com/ or click [here](https://easybuild-slack.herokuapp.com/) to join
- [Easybuild Tutorial ISC'21](https://easybuilders.github.io/easybuild-tutorial/files/EasyBuild-tutorial-ISC21-20210625.pdf)


