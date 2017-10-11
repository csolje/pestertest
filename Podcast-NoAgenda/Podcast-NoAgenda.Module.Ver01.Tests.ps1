$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$module = 'Podcast-NoAgenda'


Describe "$module Module Tests" {
	Context 'Module Setup' {
		It "has the root module $module.psm1" {
			"$here\$module.psm1" | Should Exist 
		}

		It "has the manifest a file of $module.psm1" {
			"$here\$module.psd1" | Should Exist
			"$here\$module.psd1" | Should Contain "$module.psm1"
		}

		It "$module folder has functions" {
			"$here\function-*.ps1" | Should Exist
		}
		It "$module is valid PowerShell code" {
			$psFile = Get-Content -Path "$here\$module.psm1" -ErrorAction Stop

			$errors = $null
			$null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
			$errors.Count | Should Be 0
		}
	}
} # Centext 'Module Setup'

	Context {
		It "Get-NoAgenda.ps1 should exist" {
			"$here\Get-NoAgenda.ps1" | Should Exist
		}

		It "Get-PodcastData.ps1 should exist" {
			"$here\function-Get-PodcastData.ps1" | Should Exist
		}

		It "Get-PodcastMedia.ps1 should exist" {
			"$here\function-Get-PodcastMedia.ps1" | Should Exist
		}

		It "Get-PodcastImage.ps1 should exist" {
			"$here\function-Get-PodcastImage.ps1" | Should Exist
		}

		It "ConvertTo-PodcastHtml.ps1 should exist" {
			"$here\function-ConvertTo-PodcastHtml.ps1" | Should Exist
		}

		It "ConvertTo-PodcastXML.ps1 should exist" {
			"$here\function-ConvertTo-PodcastXML.ps1" | Should Exist
		}
		
		It "Write-PodcastHtml should exist" {
			"$here\function-Write-PodcastHtml.ps1" | Should Exist
		}

		It "Write-PodcastXML.ps1 should exist" {
			"$here\function-Write-PodcastXML.ps1" | Should Exist
		}

		It "Format-PodcastHtml.ps1 should exist" {
			"$here\function-Format-PodcastHtml.ps1" | Should Exist
		}

		It "Format-PodcastXML.ps1 should exist" {
			"$here\function-Format-PodcastXML.ps1" | Should Exist
		}
	}