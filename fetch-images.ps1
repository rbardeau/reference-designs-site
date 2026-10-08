# Downloads the original photos from the current Wix site into .\images
# Run BEFORE cancelling Wix. Easiest: double-click "Download images.bat".
$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot
New-Item -ItemType Directory -Force -Path "images" | Out-Null
$W = "https://static.wixstatic.com/media"
function Fit($id) { "$W/$id/v1/fit/w_1600,h_1600,al_c,q_85/$id" }

$files = [ordered]@{
  "logo.png"           = "$W/6728fa_eca06f648be64ef78068f6bdedad174c~mv2.png"
  "badge-cedia.jpg"    = "$W/6728fa_c7b2f555209f4035b0a3f7237063ae62~mv2.jpg"
  "badge-control4.jpg" = "$W/6728fa_939dafa19868439083c9e8722fd76eb4~mv2_d_1363_1395_s_2.jpg"
  "badge-csd.jpg"      = "$W/6728fa_9921c648045547c8a50f7843c337be4d~mv2.jpg"
  "hero.jpg"           = Fit "6728fa_d60fede9f13d49e088b46ffff265c224~mv2_d_2048_1536_s_2.jpg"
  "about.jpg"          = Fit "6728fa_29508665127b46b393d38b3ff998b1b9~mv2.jpg"
  "partners.jpg"       = Fit "6728fa_39f4d03c35884fd49aedf203926fc948~mv2_d_4032_3024_s_4_2.jpg"
  "contact.jpg"        = Fit "6728fa_794b8792de5f4542814d7f6fbd0114d9~mv2_d_3264_2448_s_4_2.jpg"
}

Write-Host "Downloading images from Wix..."
foreach ($name in $files.Keys) {
  Write-Host "  -> images\$name"
  Invoke-WebRequest -Uri $files[$name] -OutFile "images\$name" -UseBasicParsing
}
Write-Host "Done. Open index.html in a browser to check."
