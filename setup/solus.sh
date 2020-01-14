#!/usr/bin/env bash

# Copyright (C) 2019-2020 ZVNexus
# SPDX-License-Identifier: GPL-3.0-only

# Script to setup an AOSP build environment on Solus

sudo eopkg it -c system.devel
sudo eopkg it \
    android-tools \
    curl-devel \
    git \
    gnupg \
    gperf \
    libgcc-32bit \
    libxslt-devel \
    lzip \
    lzop \
    ncurses-32bit-devel \
    ncurses-devel \
    openjdk-8-devel \
    readline-32bit-devel \
    rsync \
    schedtool \
    sdl1-devel \
    squashfs-tools \
    unzip \
    vim \
    wxwidgets-devel \
    zip \
    zlib-32bit-devel

# Setup udev rules for ADB.
echo "Setting up udev rules for ADB!"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo usysconf run -f

echo "Installing repo"
sudo curl --create-dirs -L -o /usr/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+x /usr/bin/repo
