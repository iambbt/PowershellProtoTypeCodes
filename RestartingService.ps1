#Service Restarting - Start
function RestartService()
{ 
  get-service -Name "SQL*" | ForEach-Object {  
    $Service = $_.Name  
    $Status = $_.Status  
    if ( $Status -eq "Running" )
    {  
      Stop-service $Service  
      Start-service $Service    
      Write-Verbose ("AUDIT-LOG:>>" + $Service + "has been Restarted")  -verbose  
    } 
  }
} #End Function

function StopService()
{ 
  get-service -Name "SQL*" | ForEach-Object {
    $Service = $_.Name  
    $Status = $_.Status 
    if ( $Status -eq "Running" ) {  
        Stop-service $Service         
        Write-Verbose ("AUDIT-LOG:>>" + $Service + "has been Stopped")  -verbose
      }
    }
} 
#End Function

function StartService()
{ 
  get-service -Name "SQL*" | ForEach-Object { 
      $Service = $_.Name 
      $Status = $_.Status 
      if ( $Status -eq "Stopped" ) 
      {   
          Start-service $Service     
          Write-Verbose ("AUDIT-LOG:>>" + $Service + "has been Started")  -verbose 
      } 
  }
}
#End Function#Service Restarting - End
