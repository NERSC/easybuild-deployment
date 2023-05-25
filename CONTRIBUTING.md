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

You will need to have a local installation of EasyBuild
