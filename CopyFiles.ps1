Function Copy-Files() {
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        $SourcePath,
        [Parameter(Mandatory = $true)]
        $DestinationPath
    )
    
    Begin {
       Write-Host 'Started Function: Executing'
    }

    Process {
           
       $global:foldPath = $null
       foreach($foldername in $DestinationPath.split("\")) {
           $global:foldPath += ($foldername+"\")
           if (!(Test-Path $global:foldPath)){
               New-Item -ItemType Directory -Path $global:foldPath
           }
       }
       Get-ChildItem -Path $SourcePath | Copy-Item -Destination $DestinationPath -Recurse
   }
       

    End {
    $count = (Get-ChildItem -Path $SourcePath -Recurse).Count
    Write-Output "Copy Finished! $count Files Copied" 
    Write-Host 'Terminating Function: Finished Executing'
    }
}

Copy-Files -SourcePath "C:\Test\f" -DestinationPath "C:\Test\t2"
