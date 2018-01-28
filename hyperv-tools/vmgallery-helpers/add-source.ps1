Param(
    [Parameter(Mandatory=$true)]
    [string]$newURI
)

$galleryRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization"
$galleryRegKey = "GalleryLocations"
$regContents = (Get-ItemProperty -Path $galleryRegPath -Name $galleryRegKey).$galleryRegKey

[string[]]$gallerylocations = (
    # Custom image json
    $newURI,
    # existing contents
    $regContents
)

Set-ItemProperty -Path $galleryregpath -Name $galleryRegKey -Value $gallerylocations

Write-Host ""
Write-Host "Successfully added $newURI to $galleryRegKey"
Write-Host ""
Write-Host "New Value is: "
Write-Host (Get-ItemProperty -Path $galleryRegPath -Name $galleryRegKey).$galleryRegKey
