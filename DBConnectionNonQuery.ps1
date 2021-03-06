$ServerInstance = "SQLDBSvr001"$Database = "SouthWind"$ConnectionTimeout = 20
function UpdateDB($Query)
{      
    $UserName = "SequelAdmin"
    $Passwod = "India_2020"
    $QueryTimeout = 120
    $conn=new-object System.Data.SqlClient.SQLConnection
    $ConnectionString = "Server={0};Database={1};Integrated Security=True;Connect Timeout={2}" -f $Global:ServerInstance,$Global:Database,$Global:ConnectionTimeout
    ##### $ConnectionString = "Server={0};Database={1};Connect Timeout={2};UserName={3};Password={4}" -f $Global:ServerInstance,$Global:Database,$Global:ConnectionTimeout,$UserName,$Password
    $conn.ConnectionString=$ConnectionString  
    write-verbose "DB Connection open-Start" -verbose  
    try  
    {    
        $conn.Open()
        write-verbose "DB Connection opened." -verbose  
        $cmd=new-object system.Data.SqlClient.SqlCommand($Query,$conn)  
        $cmd.CommandText = $Query
        $cmd.ExecuteNonQuery()
        write-verbose "DML Query Executed successfully" -verbose    
        $conn.Close()
        write-verbose "DB Connection Closed" -verbose  
    }
    catch (Exception exp)
    {
        $now = Get-Date -format "dd-MMM-yyyy HH:mm:ss"    
        Write-Error "Exception occured - " + exp.Message + " - Time:" $now    
    }
}

$UpdateDB -Query "Update MyTable Remarks ='Updated for temp visit'"
