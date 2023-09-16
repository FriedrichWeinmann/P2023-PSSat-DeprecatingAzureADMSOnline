@{
	BeerManager = @{
		'2.0.0' = @{
			'Drink-Beer' = @{
				Description = 'Was renamed to Remove-Beer'
			}
			'Import-Beer' = @{
				Parameters = @{
					Vehicle = 'Was renamed to "Storage"'
				}
			}
		}
		'3.0.0' = @{
			'Resolve-BeerPreference' = @{
				Parameters = @{
					Person = 'Was renamed to "-Identity'
				}
			}
			'Get-Beer' = @{
				Parameters = @{
					Storage = 'Save name validation was added, whitespace and special characters are no longer allowed.'
				}
			}
		}
	}
}