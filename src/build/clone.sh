#!/bin/bash

set -e
set -x

sourceTreeRoot="$1"
tag="$2"

ijGitUrl="https://github.com/JetBrains/intellij-community.git"
#ijGitUrl="file:///home/ppalaga/orgs/intellij/intellij-community/.git"

androidGitUrl="https://github.com/JetBrains/android.git"
#androidGitUrl="file:///home/ppalaga/orgs/intellij/intellij-community/android/.git"

adtGitUrl="git://git.jetbrains.org/idea/adt-tools-base.git"
#adtGitUrl="file:///home/ppalaga/orgs/intellij/intellij-community/android/tools-base/.git"

mkdir -p "${sourceTreeRoot}"
cd "${sourceTreeRoot}"
if [ ! -d "./.git" ]; then
    git init
    git remote add upstream "${ijGitUrl}"
fi

git fetch upstream tag "${tag}" --depth=1
git checkout "${tag}"


mkdir -p "${sourceTreeRoot}/android"
cd "${sourceTreeRoot}/android"
if [ ! -d "./.git" ]; then
    git init
    git remote add upstream "${androidGitUrl}"
fi
git fetch upstream tag "${tag}" --depth=1
git checkout "${tag}"

mkdir -p "${sourceTreeRoot}/android/tools-base"
cd "${sourceTreeRoot}/android/tools-base"
if [ ! -d "./.git" ]; then
    git init
    git remote add upstream "${adtGitUrl}"
fi
git fetch upstream tag "${tag}" --depth=1
git checkout "${tag}"

