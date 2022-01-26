import syslogCheck
import importlib
importlib.reload(syslogCheck)

# SSH authentication falures
def ssh_user(filename, searchTerms):

    # Call syslogCheck and return the results
    is_found = syslogCheck._syslog(filename, searchTerms)

    # found list
    found = []

    # Loop through the results
    for eachFound in is_found:

        #print(eachFound)
        # Split the results
        # (" ") means for each space found
        sp_results = eachFound.split(" ")

        # Append the split value to the found list
        # [8] means the 8th element
        found.append(sp_results[5])

    # Remove duplicates by using set
    # and convert the list to a dictionary
    returnedValues = set(found)

    # print results
    for eachHost in returnedValues:

        print(eachHost)

