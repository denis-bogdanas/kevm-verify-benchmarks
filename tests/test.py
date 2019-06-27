import os, subprocess, sys

if len(sys.argv) != 3:
    print('Must have 2 arguments!')
    print('Correct usage is "python test.py ." ')
    exit()

test_dir = sys.argv[1]
cmd = 'currentframe'

# iterate over the contents of the directory
for f in os.listdir(test_dir):
    # index of last period in string
    fi = f.rfind('.')
    # separate filename from extension
    file_name = f[:fi]
    file_ext = f[fi:]

    if file_ext == '.sol':
        cli_args = ['/opt/solc-0.5.0', f]
        if subprocess.call(cli_args, shell=True):
            print('An error has occurred with command "%s"' % ' '.join(cli_args))
