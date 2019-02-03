#!/bin/bash

if [ ! $(uname) = "Darwin" ]; then exit 0; fi

sudo ifconfig lo0 alias $@ up
