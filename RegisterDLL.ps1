#DLL Registration - Start
function RegisterDLL($DLLPath)
{
    # .SYNOPSIS  A function that uses the utility regsvr32.exe utility to register a file .PARAMETER FilePath  The file path 
    process 
    {  
    try 
        {   
        start-process "..\RegDLL.bat" $DLLPath  
        } 
    catch 
        {   
        Write-Error $_.Exception.Message   $false  
        } 
    }
} 
#End Function#DLL Registration - End
