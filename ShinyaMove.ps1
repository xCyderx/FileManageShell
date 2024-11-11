<#
Rename and Move
#>

$folder_list = Get-ChildItem -Name

mkdir "NewFile"

for($i=0; $i -lt $folder_list.count; $i++)
{
    $childfolder = Get-ChildItem $folder_list[$i] -Name
    $childfolder = ([string]::Format("{0}\\{1}",$folder_list[$i],$childfolder))
    $filename = Get-ChildItem $childfolder -Name
    $filename = ([string]::Format("{0}\\{1}",$childfolder,$filename))

    mv $filename ([string]::Format("{0}.jpg",$folder_list[$i]))
}