import logCheck
import importlib
importlib.reload(logCheck)

def search_events(filename, hostname):

    # Call syslogCheck and return the results
    is_found = logCheck._logs(filename, hostname)

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
        # Get /cgi-bin/test-cgi HTTP/1.1" 404 435 "-" "-"
        found.append(sp_results[0] + " " + sp_results[2] + " " + sp_results[3])

    # Remove duplicates by using set
    # and convert the list to a dictionary
    hosts = set(found)

    # print results
    for eachValue in hosts:

        print(eachValue)

