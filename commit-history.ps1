$startDate = Get-Date -Year 2015 -Month 1 -Day 2
$endDate = Get-Date -Year 2025 -Month 3 -Day 27

# Get all files and directories in the current directory
$files = Get-ChildItem -File -Recurse

foreach ($file in $files) {
    # Generate a random date between 2015 and the current date
    $randomDate = Get-Date (Get-Random -Minimum $startDate.Ticks -Maximum $endDate.Ticks)

    # Set the GIT_COMMITTER_DATE environment variable for the random commit date
    $env:GIT_COMMITTER_DATE = $randomDate.ToString("yyyy-MM-ddTHH:mm:ss")

    # Add the file to the staging area
    git add $file.FullName

    # Commit the file with the random date
    git commit -m "Commit on $($randomDate.ToString('yyyy-MM-dd'))" --date="$($randomDate.ToString('yyyy-MM-ddTHH:mm:ss'))"
}