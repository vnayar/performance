#!/bin/bash

siege -f urls.txt -c25 -b -r 1000
