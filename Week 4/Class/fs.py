# File to traverse a given directory and it:s subdirs and retrieve all the files.

import os, sys

#Good way to test code**
# Get information from the commandline
#print(sys.argv)

#Directory to traverse
#The thing in the first position will be the directory as dictated by the [1]
rootdir = sys.argv[1]

#print(rootdir)

#In our story, we will traverse a directory

#Check if the argument is a directory

if not os.path.isdir(rootdir):
    print("Invalid Directory => {}".format(rootdir))
    exit

#list to  save files
#initalize outside for loop so the for loop is in the scope
#changes information into list format
fList = []

#Crawl through the provided directory
for root, subfolders, filenames in os.walk(rootdir):

    for f in filenames:

        #concatinates the directory (Shows full path)
        #print(root + "/" + f)

        #double checks that the code is working properly
        fileList = root + "/" + f
        #print(fileList)
        fList.append(fileList)

#print(fList)

def statFile(toStat):

    #Using the valiable I it is going to be the variable used for each of the metadata elements
    i = os.stat(toStat, follow_symlinks=False)

    #mode
    mode = i[0]

    #inode is what is used to process and keep up with all files on a system
    inode = i[1]

    #uid
    uid = i[4]

    #gid
    gid = i[5]

    #file size
    fsize = i[6]

    #access time
    atime = i[7]

    #modification time
    mtime = i[8]

    #ctime => windows is the birth of the file, when it was created unix it is when attributes of the file  changes.
    ctime = i[9]
    crtime = i[9]

    print("0|{}|{}|{}|{}|{}|{}|{}|{}|{}|{}".format(toStat, inode, mode, uid, gid, fsize, atime, mtime, ctime, crtime))

#shows each file in its original inode syntax, the first item in the ()s is the 0th item
for eachFile in fList:

    #print(os.stat(eachFile))
    #looks through each file and gets the metadata for those files
    statFile(eachFile)

#can gather all metadata and then use timeliner to parse it