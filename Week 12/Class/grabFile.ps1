#Create commandline Paramaters to copy a file and place it into an evidence directory
param (

#you have 1 paracter and you gave it 1 variable reportNo(number) that has been set to be true
[Parameter(Mandatory = $true)]
[int]$reportNo,

[Parameter(Mandatory = $true)]
[String]$filePath


)

#Create a directory with the report number
$reportDir = "rpt$reportNo"

#Creating a new directory
mkdir $reportDir

#Copy the file into the new directory
Copy-Item $filePath $reportDir