from distutils.log import error
import os
import shutil
import glob
from PIL import Image
import imagehash

os.chdir('NEW/')

picnames = glob.glob('*.png')

os.chdir('..')

flag = False; cut = 5 # empirical cutoff (to be adjusted...)

for file in picnames:
    newh = imagehash.dhash_vertical(Image.open('NEW/'+file))
    refh = imagehash.dhash_vertical(Image.open('REF/'+file))
    diff = abs(newh-refh)
    if diff > cut:
        print(file)
        shutil.move('NEW/'+file,'failed/NEW/'+file)
        print(diff)
        shutil.move('REF/'+file,'failed/REF/'+file)
        flag = True

import sys
sys.tracebacklimit = 0
if flag:
    raise Exception("^^^ Some vtests have failed! ^^^")
else:
    print("> All visual tests have been passed!")
