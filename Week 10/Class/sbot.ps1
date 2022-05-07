#Send an email using Powershell

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