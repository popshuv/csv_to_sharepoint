# Read the CSV file
$csv = Import-CSV -path "C:\Data.csv"
 
# Declare SharePoint URL
$web = Get-SPWeb -identity "<SHAREPOINT/URL>"
 
# Get the SharePoint List
$list = $web.Lists["Log"]
 
# Iterate through each row in CSV file
foreach ($row in $csv) {
    $item = $list.Items.Add();
    
    # Mock data
    $item["Name"] = $row.Name
    $item["Request Type"] = $row.RequestType
    $item["Request Subtype"] = $row.Tags
 
    #Set the People Picker Field value
    $item["Technician"] = Get-SPUser -Identity $row.AssignedTo -web "<SHAREPOINT/URL>"
 
    $item.Update()
}