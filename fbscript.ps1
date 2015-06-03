#########################
#
#	FogBugz Script
#	Paul Cabanez
#	03/09/2015
#
#
#	>Gets FB cases from the past week
#	
#
#
#
#
####################################


# Declare database and query variables
$SqlServer = 'ITT'
$Database = 'fogbugz'
$SqlQuery = "

DECLARE 
	@Startdate DATETIME,
	@Enddate DATETIME

SET @STARTDATE = DATEADD(dd,-7,GETDATE())
SET @ENDDATE = GETDATE()


SELECT BE.ixBug, 
        sTitle, 
        sProject, 
        A.sArea, 
        S.sStatus, 
        dtdue, 
        pushxtimeC34, 
        passedxqaxxxstagingK81, 
        passedxqaxxxpreviewR53, 
        environmentA56,
        FF.sFixFor
FROM [fogbugz].[dbo].[Bug] B
JOIN [fogbugz].[dbo].[Area] A ON B.ixArea = A.ixArea
JOIN [fogbugz].[dbo].[Status] S ON B.ixStatus = S.ixStatus
JOIN [fogbugz].[dbo].[Project] P  ON B.ixProject = P.ixProject
JOIN [fogbugz].[dbo].[BugEvent] BE ON B.ixBug = BE.ixBug 
JOIN [fogbugz].[dbo].[FixFor] FF ON B.ixFixFor = FF.ixFixFor
LEFT JOIN [fogbugz].[dbo].[Plugin_7_CustomBugData] PC ON B.ixBug = PC.ixBug 
WHERE PC.passedxqaxxxpreviewR53 = 'Deployed'
AND pushxtimeC34 >= @STARTDATE
AND pushxtimeC34 <  @ENDDATE
GROUP BY BE.ixBug, sTitle, sProject, FF.sfixFor, reportedxenvironmentG45, environmentA56, passedxqaxxxstagingK81  ,passedxqaxxxpreviewR53 , pushxtimeC34, dtdue, S.sStatus, A.sArea
ORDER BY pushxtimeC34, BE.ixBug, sTitle, sProject"

#SMTP Relay Server
#$SMTPServer = "smtp.photochannel.net"

### Path for .csv 
$CurrentDate = Get-Date
$CurrentDate = $CurrentDate.ToString('MM-dd-yyyy')
$AttachmentPath = "\\vanfile\documents\Release_Management\documents\reports\weekly_deployments\WeeklyDeployment_$CurrentDate.csv"

# Connection string to connect to database
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server=$SqlServer;Database=$Database;Integrated Security=True"

# Builds the SqlCmd object for executing query
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection

# Builds Data Adapter to bridge data and source
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd

# Put database info into Dataset
$Dataset = New-Object System.Data.Dataset
$SqlAdapter.Fill($Dataset)
$SqlConnection.Close()

# Populate CSV with info
$objTable = $DataSet.Tables[0]

# Export to CSV
$objTable | Export-CSV $AttachmentPath

#Send SMTP Email
$EmailEndDate = Get-Date
$EmailEndDate = $EmailEndDate.ToString('MM-dd-yyyy')
$EmailStartDate = (Get-Date).AddDays(-7)
$EmailStartDate = $EmailStartDate.ToString('MM-dd-yyyy')
Send-MailMessage -To "Release Management <releasemanagementteam@pnimedia.com>", "Retail Support <retailteam@pnimedia.com>", "Andre Blanchard <ablanchard@pnimedia.com>"  -From "Release Agent <ReleaseAgent@pnimedia.com>" -SMTPServer smtp.photochannel.net  -Subject "Release Management Report: Deployed cases from $EmailStartDate to $EmailEndDate" -Body "This is an automated message. Please see the attached document." -Attachments "\\vanfile\documents\Release_Management\documents\reports\weekly_deployments\WeeklyDeployment_$CurrentDate.csv"
#$Mailer = New-Object Net.Mail.SMTPclient($SMTPServer)
#$From = "ReleaseAgent@pnimedia.com"
#$To = "<pcabanez@pnimedia.com>, <releasemanagementteam@pnimedia.com>"
#$Subject = "Release Management Report: Deployed cases from $EmailStartDate to $EmailEndDate"
#$Body = "This is an automated message. Please see the attached document."
#$Msg = New-Object Net.Mail.MailMessage($From,$To,$Subject,$Body)
#$Msg.IsBodyHTML = $False
#$Attachment = New-Object Net.Mail.Attachment($AttachmentPath)
#$Msg.attachments.add($Attachment)
#$Mailer.send($Msg)







