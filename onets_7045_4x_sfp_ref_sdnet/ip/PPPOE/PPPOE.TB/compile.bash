#!/bin/bash
set -euo pipefail
set -x
g++ -I. -std=c++11 $(find .. -name '*.cpp')
