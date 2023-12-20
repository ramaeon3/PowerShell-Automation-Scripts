Get-ChildItem -Path "C:\Users\admin\Documents\randomdocs" -File |
    ForEach-Object {
        $letters = (65..90) + (97..122) | Get-Random -Count 5 | ForEach-Object { [char]$_ }
        $numbers = 0..9 | Get-Random -Count 4 | ForEach-Object { [string]$_ }
        $randomName = ($letters -join "") + "-" + ($numbers -join "")
        $extension = $_.Extension
        Rename-Item -Path $_.FullName -NewName "$randomName$extension"
    }