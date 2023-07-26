

# Set the download URL
$downloadURL = "https://curl.se/download/curl-8.1.1.zip"

# Set the output filename
$outputFile = "Curl.zip"

# Set the destination directory for extraction
$destinationDir = "FinalTools"

# Create a new WebClient object
$webClient = New-Object System.Net.WebClient

# Download the file using the WebClient
$webClient.DownloadFile($downloadURL, $outputFile)

# Extract the contents of the ZIP file
Expand-Archive -Path $outputFile -DestinationPath $destinationDir -Force

# Display success message
Write-Host "File has been downloaded and extracted successfully."