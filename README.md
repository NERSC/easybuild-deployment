# Easybuild Perlmutter

This repo contains [easybuild](https://docs.easybuild.io/en/latest/) configuration for Perlmutter. The easybuild stack is built in following location `/global/common/software/nersc/easybuild/perlmutter/21.01` you can run the following command to see modules generated by easybuild and gain access to `EasyBuild` module

```
module use /global/common/software/nersc/easybuild/perlmutter/21.10/modules/all/
```

To load Easybuild simply run the following

```
module load EasyBuild
```

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

Easybuild configuration can be defined in user setting `$HOME/.local/easybuild/config.cfg` however this won't work well in multi-system setup using a single account. For time being we will define the configuration
using [setup.sh](https://software.nersc.gov/NERSC/easybuild/-/blob/main/setup.sh) script which can be sourced to setup the easybuild environment.

## EasyBuild 101

Easybuild makes use of **easyconfigs** which are configuration files to install packages. You can search for easyconfigs using `-S` option such as searching all M4 easyconfigs ``eb -S M4``.

