#Import csv and re
#Fix: re was not originally imported
import csv
import re

#Define the urlHausOpen function
#Fix: replace 1 with l in url part of urlHausOpen
def urlHausOpen(filename, searchTerm):

    #Opens the csv file we selected
    #Fix:Indented, changed while to with and added single quotes so that filename is now a variable
    with open(filename) as f:

        #Reads the csv file
        #Fix:Indented, removed extra =, changed filename to f, changed .review to .reader
        contents = csv.reader(f)

        #loops throgh first 9 elements in the range
        #Fix:Indented
        for _ in range(9):

            #passes the first 9 elements
            #Fix:Indented,
            next(contents)

        #loops through each line
        #Fix:Indented, swapped "keyword in searchTerm" for eachLine in contents*
        for eachLine in contents:

            #loops through the searchterms
            #Fix:Indented,*, removed the extra s in searchTerm
            for keyword in searchTerm:

                #when a line is selected it bounces it against our searchterms and sees if it matches
                #Fix:Indented, removed the r and + since they are not used
                x = re.findall(keyword, eachLine[2])

                #loops through the data that matched in x = re.findall(keyword + eachLine[2])
                #Fix:Indented
                for _ in x:

                    # Don't edit this line. It is here to show how it is possible
                    # to remove the "tt" so programs don't convert the malicious
                    # domains to links that an be accidentally clicked on.

                    #Stops links from being useable
                    #Fix:Indented
                    the_url = eachLine[2].replace("http","hxxp")

                    #set the abuse.ch link with the matched url to a variable
                    #Fix:Indented, replaced 4 with 7
                    the_src = eachLine[7]

                    #prints results formated and readable,
                    #Fix:Indented, added missing {}, replaces the + with *, changed the comma to a period in format
                    #moved the ) from behind the 60 to after the_src, also changed the "" to '' around the *
                    print("""
                    URL: {}
                    Info: {}  
                    """.format(the_url, the_src) + '*' * 60)
