# Create 3 VMS

param([string]$resourcegroup) 

$admincredential = get-credential -message "Enter the username password for VM administrator"
for($i=1; $i -le 3; $i++) {
    $vmname = "ConferenceDemo"+$i
    write-host "Creating VM:" $vmname
    new-azvm -resourcegroup $resourcegroup -name $vmname -credential $admincredential -image UbuntuLTS
}

# Execute script 

./conferencedailyreset.ps1 learn-fac3d57e-c810-40b0-89b6-ad4512b2e6ad

# View VMs

Get-AzResource -ResourceType Microsoft.Compute/virtualMachines