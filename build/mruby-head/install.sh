#!/bin/bash

. ./init.sh

PREFIX=/opt/wandbox/mruby-head

# get sources

cd ~/
git clone --depth 1 https://github.com/mruby/mruby.git
cd mruby

# build

./minirake
mkdir $PREFIX || true
cp -r bin $PREFIX

# get version

echo "`$PREFIX/bin/mruby --version | cut -d' ' -f2` (`git rev-parse --short HEAD`)" > $PREFIX/VERSION

test_mruby $PREFIX

rm -r ~/*
