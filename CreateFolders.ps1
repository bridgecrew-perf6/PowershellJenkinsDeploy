<#
      .SYNOPSIS
       Create Folders inside a directory
 
    .DESCRIPTION 
    Created function - Create-Folders to perform following tasks: 
    1. Creating single/multiple folders inside directory like C:\
    2. Verifying if the folder with same name exists inside the directory or not.
 
    .INPUTS
            Required Parameters to be passed to function:
            $Path: directory of folder like C:\
            [array]$name: specifying array to get an array of folders inside variable $name.
    .OUTPUTS
            Expected Output from Function:
            Creation of single folder or n number of folders inside a directory.
    .EXAMPLE
    C:\PS> Create-Folders -Path Path -Name Name -ItemType "directory"
    .LINK
   1. Creating an array in powershell - https://www.tutorialspoint.com/how-to-create-an-array-in-powershell#:~:text=To%20create%20or%20declare%20an%20array%20in%20PowerShell%2C,comma%20%28%2C%29%20and%20that%20variable%20becomes%20the%20variable.#:~:text=To%20create%20or%20declare%20an%20array%20in%20PowerShell%2C,comma%20%28%2C%29%20and%20that%20variable%20becomes%20the%20variable.#:~:text=To%20create%20or%20declare%20an%20array%20in%20PowerShell%2C,comma%20%28%2C%29%20and%20that%20variable%20becomes%20the%20variable.
   2. Specifying size of array  - https://stackoverflow.com/questions/43083051/creating-an-array-with-large-initial-size-in-powershell
   3. Check existance of folder - https://www.tutorialspoint.com/powershell/powershell_files_check_folder.htm
 #>
 Function Create-Folders() {
    [CmdLetBinding()]
    Param(
        [Parameter(Mandatory = $true)][string]$path, 
        [Parameter(Mandatory = $true)][array]$name)


    Begin {
       Write-Host 'Started Function: Executing'
    }

    Process {
        for($i=0; $i -lt $name.Length;$i++){
        $folderName = $name[$i];
        if((Test-Path $path\$folderName) -eq 'True')
        {
            Write-Host "Folder name - $folderName already exists !!, Kindly, mention unique folder names."
            continue
        }
        else
        {
        New-Item -Path $path -Name $folderName -ItemType "directory"
        Write-Host "Created folder - $folderName"
        }

    }
        New-Item -Path $path -Name $folderName -ItemType "directory"
        Write-Host "Created folder - $folderName"
}
    End {
        Write-Host 'Terminating Function: Finished Executing'
    }
 }

 Create-Folders -path "C:\test" -name "e","f","g"
