import os, yaml, re

dir = 'C:\\Users\\ethan\\PycharmProjects\\SYS-320-01\\logs\\weblogs'

# passes in a directory with rootdir
def file_search(dir):

    # Check if the argument is a directory
    if not os.path.isdir(dir):
        print("Invalid Directory => {}".format(dir))
        exit()

    # list to  save files
    # initalize outside for loop so the for loop is in the scope
    # changes information into list format
    fList = []

    # Crawl through the provided directory
    for root, subfolders, filenames in os.walk(dir):
        # loop through every file and add the root to it
        for f in filenames:
            #windows
            #file_list = directory + "\\" + f

            # concatinates the directory (Shows full path)
            # print(root + "/" + f)

            # double checks that the code is working properly
            fileList = dir + "\\" + f
            # print(fileList)
            fList.append(fileList)

    return(fList)


loadedfile = file_search(dir)

print(loadedfile)

rules = 'C:\\Users\\ethan\\PycharmProjects\\SYS-320-01\\Week 4\\Homework\\search.yaml'
# write out steps to go into the file

# open the rules
with open(rules, 'r') as f:
    # loads rules
    rule = yaml.safe_load_all(f)
    #.append
    # print(rule["shell_attacks"])
    # print(rule["sql_injection"])
    # print(rule["directory_traversal"])
    # print(rule["content_management_systems_attack"])
    # generator: data structure, not printable, need to iterate through, collection of dictionaries
    sa = "shell_attacks"
    sql = "sql_injection"
    dt = "directory_traversal"
    cms = "content_management_systems_attack"
    #extractedrules = sa.append
    # + sql.append + dt.append + cms.append
    # iterating though the object from the yaml file, this is the generator object
    for keyval in rule:
        # iterating though each individual dictionary ie shell_attack
        for key, val in keyval[sa].items():
            print(val)

# # Find the file
# for file in loadedfile:
#     # Open the file
#     # open('what file you are looking to open', 'read,write,execute'
#     with open(file, 'r') as l:
#         # Read line by line
#         lines = l.readlines()
#         # match readlines to rules
#         for line in lines:
#           # h is the search term in the loop
#             # re.findall(r'' + h + '', line)
#             for rule in extractedrules.items():
#                 if rule[1] in line:
#                     print(line)


