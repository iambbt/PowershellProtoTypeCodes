#---------------SENDING MAIL --- Start ------ 
$SMTP_ServerName = ""

# This is Setter method to send 
function SMTP_SetSMTP_ServerName($SMTPServer)
{
    $global:SMTP_ServerName = $SMTPServer
    Write-Host "I came to assignment" + $global:SMTP_ServerName
}

function SMTP_SendHTMLMail($fromAddress, $Subject, $toAddress, $Body, $SMTPServer)
{
    Write-Host "I came to send mail from " + $global:SMTP_ServerName
    if ($SMTP_ServerName -ne "") {
        Send-MailMessage -From "$fromAddress" -Subject "$Subject"  -To "$toAddress" -Body $Body -BodyAsHtml -SmtpServer $SMTP_ServerName 
    }
    else
    {
        Write-Error "SMTP Server not set.  Please contact your System Administrator."
    }
}

function SMTP_SendTextMail($fromAddress, $Subject, $toAddress, $Body)
{
    if ($SMTP_ServerName -ne "") {
        Send-MailMessage -From "$fromAddress" -Subject "$Subject"  -To "$toAddress" -Body $Body -SmtpServer $SMTP_ServerName 
    }
    else
    {
        Write-Error "SMTP Server not set.  Please contact your System Administrator."
    }
}
#---------------SENDING MAIL --- end ------ 

#---------------TEST SAMPLE code-snippet --- start ------ 
#---------------------------------------------------------------------------
# IMPORTANT NOTE:
# 1. SMTP Server must be enterprise's SMTP server
# 2. From address must have SENDING PERMISSION and also has VALID mail-box in SMTP Server.
#---------------------------------------------------------------------------
function testMail(){
    $fromAddress = "BARANI <baranitharan.b@cognizant.com>"
    $toAddress = "Barani <baranitharan.b@cognizant.com>"
    $BodyHTML = "ERROR OCCURED: </BR> Please find below the details of the error. </BR></BR>" + $Message + "</BR></BR>For more details, reach out to Admin team."
    $BodyText = "ERROR OCCURED: Please find below the details of the error. \n\n" + $Message + "For more details, reach out to Admin team."
    $Subject = "MAIL-LIBRARY-TEST"
    SMTP_SendHTMLMail -fromAddress $fromAddress -Subject $Subject -toAddress $toAddress -Body $BodyHTML 
    SMTP_SendTextMail -fromAddress $fromAddress -Subject $Subject -toAddress $toAddress -Body $BodyText 
    SMTP_SetSMTP_ServerName -SMTPServer "192.168.100.100"
    SMTP_SendHTMLMail -fromAddress $fromAddress -Subject $Subject -toAddress $toAddress -Body $BodyHTML 
    SMTP_SendTextMail -fromAddress $fromAddress -Subject $Subject -toAddress $toAddress -Body $BodyText 
}
#---------------TEST SAMPLE code-snippet --- end ------ 
