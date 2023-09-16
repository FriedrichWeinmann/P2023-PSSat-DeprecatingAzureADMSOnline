[CmdletBinding()]
param (
	$Budget,
	$Storage,
	$Shop
)

$vehicle = Get-Truck
Set-VehicleLocation -Vehicle $vehicle -Location $Shop

while ($Budget -gt 0) {
	$result = Buy-Beer -Money $Budget -Shop $Shop
	$Budget = $result.NewBudget
	Import-Beer -Beer $result.Beer -Vehicle $vehicle
}

Move-Truck -From $Shop -ToHome
Upload-Beer -From $Truck -To $Storage
Drink-Beer -Source $Storage