#!/usr/bin/env bash

$IMPALA_TOOLCHAIN/breakpad-$IMPALA_BREAKPAD_VERSION/bin/minidump_stackwalk $1 \
    /tmp/syms > /tmp/resolved.txt

