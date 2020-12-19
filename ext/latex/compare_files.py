from pathlib import Path
import argparse
import sys
import os
import socket
import subprocess
from time import sleep

parser = argparse.ArgumentParser(description='')
parser.add_argument('-project1', type=str, default="")
parser.add_argument('-return_xpath', type=str, default="")
args = parser.parse_args()


flatex_command = "perl latexpand mainfile.tex > newfile.tex"
diff_command = "perl latexpand mainfile.tex > newfile.tex"

# Expand include files
process = subprocess.Popen(f"sudo -s bash {_root}/INSTALL.sh {user}", stdout=s$



# Genereate diff
output, error = process.communicate()

