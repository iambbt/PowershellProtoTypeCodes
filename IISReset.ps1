$ComputerName = "MyIIS_Server001"

#Restarting IIS - START
function IISReset($ServerName)
{    
  write-verbose "IIS Reset Started" -verbose
  Invoke-Command -ComputerName $ServerName -ScriptBlock {iisreset}
  write-verbose "IIS Reset ended" -verbose
}
#Restarting IIS - End

#Invoking IIS Reset function
IISReset -ServerName $env:ComputerName
