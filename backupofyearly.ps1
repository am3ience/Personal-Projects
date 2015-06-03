#########################
#
#	Paul Cabanez
#	03/23/2015
#
#
#	>Smart backup of Year-To-Date report of deployed Fogbugz cases
#
#
#	
#
#
####################################

#System Variables

$date = Get-Date
$date = $date.ToString('yyyy')
$CurrentDate = Get-Date
$CurrentDate = $CurrentDate.ToString('MM-dd-yyyy')
$source = "\\vanfile\documents\Release_Management\documents\reports\deployments_year_to_date\deployed_cases_$date.csv"
$dest = "\\vanfile\documents\Release_Management\documents\reports\deployments_year_to_date\deployed_cases_2015_backup_$CurrentDate.csv"
Copy-Item -Path $source -Destination $dest