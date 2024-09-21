<#
    .SYNOPSIS
        This script will rename all .html files to .json files in the specified directory.
    
    .DESCRIPTION
        This script will rename all .html files to .json files in the specified directory.
        This is useful for converting HTML files to JSON files for use in a static site generator.

    .NOTES
        File Name      : Set-DataFileNames.ps1
        Author         : thetestgame
        Prerequisite   : PowerShell 5.1
#>

# Define our constants
$siteDataFolder = $PSSCriptRoot + "/../../_site/data/"

function Main {
    <#
        .SYNOPSIS
            This is the main function that will rename all .html files to .json files in the specified directory.

        .DESCRIPTION
            This is the main function that will rename all .html files to .json files in the specified directory.
            This is useful for converting HTML files to JSON files for use in a static site generator.
    #>

    # Get all .html files recursively in the specified directory
    Get-ChildItem -Path $siteDataFolder -Filter *.html -Recurse | ForEach-Object {
        # Construct the new file name with .json extension
        $newName = $_.FullName -replace '\.html$', '.json'
        
        # Rename the file
        Rename-Item -Path $_.FullName -NewName $newName
    }

    Write-Output "Renaming of .html files to .json files is complete."
}

Main