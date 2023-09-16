[CmdletBinding()]
param (
	[string[]]
	$Friends
)

foreach ($hour in Get-PartyHour) {
	$beers = foreach ($beerPreference in Resolve-BeerPreference -Person $Friends -TimeOfDay $hour) {
		Get-Beer -Preference $beerPreference
	}

	Drink-Beer -Beer $beers -Hour $hour -Person $Friends
}