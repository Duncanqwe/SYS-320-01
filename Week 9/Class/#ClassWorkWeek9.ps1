#Get A list of running processes
    #Get-Process
#Process IDs are extremely important
#Get list of members
    #Get-Process | Get-Member
#Think about why a threat actor would want to do with this information
#The headers in  Get-Process are properties
#Get-Process asks the kernal for all running processes
#Get-Member gets all avalible properties for all get processes

#Get a list of processes: name, id, path
    #Get-Process | Select ProcessName, id, Path 
#Select / Select-Object
#Prints out process information only pertaining to the definied properties

#Save the output to a CSV file
    #Get-Process | Select ProcessName, id, Path | Export-Csv -Path `
    #C:\Users\ethan\Desktop\processes.csv
#The ` continues the command on the next line

#When creating an output it starts with a $
    $outputName = "C:\Users\ethan\Desktop\SYS-320-01 File Dump\runningServices.csv"
    # Used for Test: $outputName1 = "C:\Users\ethan\Desktop\services.csvs"
#System Services and properties
    #Get-Service | Get-Member
#Get-Service prints out all services with their status, name and display name
    #Get-Service | Select Status, Name, DisplayName, BinaryPathName | Export-Csv -Path `
    #$outputName

#Get a list of running services
Get-Service |  Where { $_.Status -eq "Running" }
#Shows all stopped processes
    Get-Service |  Where { $_.Status -eq "Stopped" } | Select Status, Name, DisplayName | Export-Csv -Path `
    $outputName
#Where / Where-Object
#To access the properties of the commandlet you need to do $_ | Status is the property we are accessing
#Pulls a list of all services but only shows the ones with the

#Check to see if the file exists that we created
if ( Test-Path $outputName ) {
#Write-Host is the same thing as echo, if the path exists it will echo what you have in ""
#BackgroundColor and ForegroundColor determin what color the background and forground of the text to make it stand out
    Write-Host -BackgroundColor "Green" -ForegroundColor "white" "Services file was created!"

} else {

    Write-Host -BackgroundColor "red" -ForegroundColor "white" "Services file was not created!"

}