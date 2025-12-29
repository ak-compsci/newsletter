# Newsletter to Email Converter
# Converts relative asset paths to absolute GitHub URLs and copies to clipboard

param(
    [string]$file
)

# If no file specified, prompt user
if (-not $file) {
    $file = Read-Host "Enter newsletter filename (e.g., 012026.html)"
}

# Check if file exists
if (-not (Test-Path $file)) {
    Write-Host "Error: File '$file' not found!" -ForegroundColor Red
    exit
}

# Read the file content
$content = Get-Content $file -Raw

# Convert relative paths to absolute GitHub URLs
$content = $content -replace 'src="assets/', 'src="https://ak-compsci.github.io/newsletter/assets/'
$content = $content -replace 'href="assets/', 'href="https://ak-compsci.github.io/newsletter/assets/'

# Copy to clipboard
$content | Set-Clipboard

Write-Host "✅ Success!" -ForegroundColor Green
Write-Host "HTML from '$file' has been copied to clipboard with absolute URLs."
Write-Host "You can now paste it directly into GovDelivery." -ForegroundColor Cyan
