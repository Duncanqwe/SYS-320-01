#List the files in a directory and
#Use Get-ChildItem to go through the directory
#Add a *.extention, to add as many as you want
#Get-Member/Select to find FullName (Full filepaths)
#List all files and print the full paths.
#Get-ChildItem -Recurse -Include  *.docx, *.pdf, *.txt -Path .\Documents | Select FullName

#Get-ChildItem -Recurse -Include  *.docx, *.pdf, *.txt -Path .\Documents | Export-Csv -Path file.csv

#Import CSV file
#To pull a specific header do -header (which header you want)
$filelist = Import-Csv -Path .\file.csv -Header FullName

#Loop through the results
#when you run this you need to do .specificheader to get it to run correctly
foreach ($f in $filelist) {

    Get-ChildItem -Path $f.FullName

}