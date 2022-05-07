import os, sys

#need to define rootdir
root = "C:\\Users\\ethan\\PycharmProjects\\SYS-320-01\\logs\\weblogs"

#passes in a directory with rootdir
def dir_search(rootdir):

    #Check if the argument is a directory
    if not os.path.isdir(rootdir):
        print("Invalid Directory => {}".format(rootdir))
        exit()

    #list to  save files
    #initalize outside for loop so the for loop is in the scope
    #changes information into list format
    fList = []

    #Crawl through the provided directory
    for root, subfolders, filenames in os.walk(rootdir):

        for f in filenames:

            #concatinates the directory (Shows full path)
            # print(root + "/" + f)

            #double checks that the code is working properly
            fileList = root + "\\" + f
            #print(fileList)
            fList.append(fileList)

    return(fList)


results = dir_search(root)

print(results)

#write out steps to go into the file