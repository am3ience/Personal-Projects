#########################
#
#	Database Script
#	Paul Cabanez
#	03/09/2015
#
#
#	>Pulls users from BlacksCA database and extracts to a .cvs file.
#	
#
#
#
#
####################################


# Declare database and query variables
$SqlServer = 'STGDB005.pnistaging.local\TOSQLSTG013'
$Database = 'BlacksCA'
$SqlQuery = "SELECT * FROM [BlacksCA].[dbo].[User]"

### Path for .csv 
$AttachmentPath = "C:\Scripts\BlacksCA_UserList.csv"

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





