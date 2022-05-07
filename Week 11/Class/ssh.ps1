#Find-Module goes to the PS repositories with ssh in it
    #Find-Module ssh
    #If you put ** around it, it will search for any module with the specified word
    #Find-Module *ssh*
    #Install-Module Posh-SSH
    #Get-Command shows the commands that came with the module
    #Get-command -Module Posh-SSH

#Login to a remote SSH server
    #To generate a new ssh session use New-SSHSessopm then have the IP as well as login credentials
    #The password is sys320 *Shhhhh*
    #New-SSHSession -ComputerName '192.168.6.71' -Credential (Get-Credential ethan.deane) -Port 2222
    #help New-SSHSession
    #shows command type, name, version and source for the module you are looking into
    #Get-Command -Module Posh-SSH

    # #Loops the prompt
    # while ($True) {
    #     #Add a prompt to run commands
    #     $the_cmd = Read-Host -Prompt "Please enter a command"
    #     #netstat -apn --inet to see remote sockets on a server

    #     #Run command on remote server
    #     (Invoke-SSHCommand -index 0 $the_cmd).Output
    #     #To leave the ssh session do Remove-SSHSession
    # }

Set-SCPItem -ComputerName '192.168.6.71' -Credential (Get-Credential ethan.deane) -Port 2222 -Destination '/home/ethan.deane' -Path '.\powershell.exe'