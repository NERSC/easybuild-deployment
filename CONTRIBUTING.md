# Contributing Guide

This guide will walk you through the contributing guide. We recommend you contribute to the main project, so please **do not** fork this repository because we have setup
gitlab runner for this project which will only run on this project. If you fork this repository, the CI won't work because the gitlab runner is unable to access your project.

## Setup

To get started, please clone this project on NERSC system as follows

```
git clone https://software.nersc.gov/NERSC/easybuild-deployment.git
```

The contributing process is pretty simple, please create a feature branch from `main` branch, make your changes, and push to upstream repo as follows

```
git checkout main
git checkout -b featureX
git add <file1>
git commit -m <COMMIT_MESSAGE>
git push origin featureX
```

## Setting up Easybuild

To get started, navigate to the root of this repository and source the `setup.sh` script

```
source setup.sh
```

You will need to have a local installation of EasyBuild. You can try running

```
module use $HOME/.local/easybuild/modules/all
module load EasyBuild
```

If you don't have have a local copy of `EasyBuild`, you can try loading `ml nersc-easybuild` and it will provide a copy of `EasyBuild` module that can be
used. Next you can run the following to install the latest eb release in your local copy

```
eb --install-latest-eb-release
```

## Getting Started

To get started, you will need to determine what package to install. You can go to https://github.com/easybuilders/easybuild-easyconfigs repo and search for the
easyconfigs, keep in mind you need to be on the correct release branch. Alternatively, you can search for easyconfigs via `eb -S`. For instance to search for all `Julia` easyconfig, 
you can run

```
eb -S Julia
```

If you want to copy an easyconfig file locally so you can make some changes, you can use `--copy-ec` option. Let's say you want to copy this easyconfig file in your current directory, you can do

```
eb Julia-1.8.2-linux-x86_64.eb --copy-ec .
```

To show content of an easyconfig file you can use `--show-ec` option

```
eb Julia-1.8.2-linux-x86_64.eb --show-ec
```

Once you are ready to install, you can run the following:

```
eb Julia-1.8.2-linux-x86_64.eb --robot
```

Note, you may run into errors during installation or other issues with resolving dependency. If that is the case, you will need to copy other easyconfig files, and manually update them as needed. To do this, you will
need to search for the easyconfigs (`-S`), then copy the easyconfig (`--copy-ec`) if needed to make changes. 

Once you proceed with installation, you will see a software stack built in your $HOME directory, it will look something like this. The modules are present in the following location

```
----------------------------------------------------------------------------------------------------------- /global/homes/s/siddiq90/.local/easybuild/modules/all ------------------------------------------------------------------------------------------------------------
   binutils/2.37        bzip2/1.0.8                   cURL/7.72.0-CrayGNU-23.02          flex/2.6.4                  Julia/1.8.5-linux-x86_64 (D)    M4/1.4.19                 (D)    Nsight-Systems/2021.5.1              XZ/5.2.5-CrayGNU-23.02
   Bison/3.5.3          CMake/3.18.4-CrayGNU-23.02    EasyBuild/4.5.1                    Julia/1.7.0-linux-x86_64    M4/1.4.18                       METIS/5.1.0-CrayGNU-23.02        Perl/5.32.0-CrayGNU-23.02-minimal    zlib/1.2.11
   Bison/3.7.6   (D)    CrayGNU/23.02                 EasyBuild/4.7.1           (L,D)    Julia/1.8.2-linux-x86_64    M4/1.4.19-CrayGNU-23.02         Nsight-Compute/2022.1.0          Tcl/8.6.10-CrayGNU-23.02
```

If you want to change the path where software and modules are installed, you can use `--prefix` option. Let's say you want to install in **$PSCRATCH/easybuild** you can do

```
eb easyconfigs/* --robot --prefix=$PSCRATCH/easybuild
```

Easybuild will have a `software` directory and a `module` directory in the prefix location, which can be changed via `--installpath-software` and `--installpath-modules`. We recommend you check out
[Configuring EasyBuild](https://docs.easybuild.io/configuration/) for list of configuration options.  

Once you are ready to make the change, add the appropriate easyconfig files and push them to the upstream repo.
