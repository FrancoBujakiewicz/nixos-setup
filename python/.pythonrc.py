# This is executed when the interpreter runs

import sys
import os
import math

MAGENTA = '\033[35m'
RESET = '\033[0m'

sys.ps1 = f'{MAGENTA} >>> {RESET}'

os.system('clear') # Cleans terminal letting just interpreter prompt

