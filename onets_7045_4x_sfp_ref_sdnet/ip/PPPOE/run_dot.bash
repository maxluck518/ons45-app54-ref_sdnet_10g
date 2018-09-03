#!/bin/bash
set -euo pipefail
set -x
dot -Tpng PPPOE.dot -o PPPOE.png
dot -Tpng PPPOE_elaborated.dot -o PPPOE_elaborated.png
