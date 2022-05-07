# http://rules.emergingthreats.net/blockrules/emerging-botcc.rules
# https://rules.emergingthreats.net/blockrules/compromised-ips.txt


# array of websites containing the threat intel
$drop_urls = @('https://rules.emergingthreats.net/blockrules/emerging-botcc.rules', 'https://rules.emergingthreats.net/blockrules/compromised-ips.txt')

#Loop throught the urls for the rules list
foreach ($u in $drop_urls) {
     #Extract the filenames
     $temp = $u.split("/")

     #The last element in the array plucked off is the filename
     $file_name = $temp[-1]

     #eq = equal
     if (Test-Path $file_name) {
          
          continue

     } else {

          #Download the rules list
          Invoke-WebRequest -Uri $u -OutFile $file_name
     } #close the if statement
} #close the foreach loop
#The array contining the filenames
$input_paths = @('.\compromised-ips.txt', '.\emerging-botcc.rules')


#Extract the Ip addresses
# 108.190.109.107
#d{1,3} search for a digit with 1 to 3 digits
#. is looking for a literal dot
$regex_drop = '\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b'


#Append the IP addresses to the temporary IP list
Select-String -Path $input_paths -Pattern $regex_drop | 
ForEach-Object { $_.Matches } | 
ForEach-Object { $_.Value } | Sort-Object | Get-Unique |
Out-File -FilePath "ips-bad.tmp"

#Get the IP addresses discoverd, loop throught them and replace the begining of the line with IPTables syntax
#After the ip address, add the remaining IPTables sysntax and save the results to a file.
#iptables -A INPUT -s 108.191.2.72 -j DROP
##You can either use ForEach-Object or %
(Get-Content -Path ".\ips-bad.tmp") | ForEach-Object
{ $_  -replace "^", "iptables -A INPUT -s" -replace "$", "-j DROP" } |
Out-File -FilePath "iptables.bash"