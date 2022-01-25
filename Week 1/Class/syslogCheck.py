# Create and interface to search through syslog files
import re
import sys

def _syslog(filename,listOfKeywords):

    # Open a file
    with open(filename) as f:

        # read in the file and save it as a variable
        contents = f.readlines()

    # Lists in to store the results
    results = []

    for line in contents:

        # Loops through keywords
        for eachKeyword in listOfKeywords:

            # If the 'line' contains the keyword then it will print
            # if eachKeyword in line:

            # Searches and returns results using a regular expression search
            x = re.findall(r''+eachKeyword+'', line)

            for found in x:


                # Append the reurned keywords to the results list
                results.append(found)
    #Check to see if there are results
    if len(results) == 0:
        print("No Results")
        sys.exit(1)

    # Sort the list
    results = sorted(results)

    return results
    # print(x)