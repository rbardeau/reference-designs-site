#!/usr/bin/env bash
# Downloads the original photos from the current Wix site into ./images
# Run this ONCE, before cancelling Wix:   bash fetch-images.sh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p images
W="https://static.wixstatic.com/media"
# Photos are pulled at max 1600px (plenty for the web, keeps the site fast). Logo/badges at original size.
fit() { echo "$W/$1/v1/fit/w_1600,h_1600,al_c,q_85/$1"; }

get() { echo "  -> images/$1"; curl -fsSL "$2" -o "images/$1"; }

echo "Downloading images from Wix..."
get logo.png          "$W/6728fa_eca06f648be64ef78068f6bdedad174c~mv2.png"
get badge-cedia.jpg   "$W/6728fa_c7b2f555209f4035b0a3f7237063ae62~mv2.jpg"
get badge-control4.jpg "$W/6728fa_939dafa19868439083c9e8722fd76eb4~mv2_d_1363_1395_s_2.jpg"
get badge-csd.jpg     "$W/6728fa_9921c648045547c8a50f7843c337be4d~mv2.jpg"
get hero.jpg          "$(fit 6728fa_d60fede9f13d49e088b46ffff265c224~mv2_d_2048_1536_s_2.jpg)"
get about.jpg         "$(fit 6728fa_29508665127b46b393d38b3ff998b1b9~mv2.jpg)"
get partners.jpg      "$(fit 6728fa_39f4d03c35884fd49aedf203926fc948~mv2_d_4032_3024_s_4_2.jpg)"
get contact.jpg       "$(fit 6728fa_794b8792de5f4542814d7f6fbd0114d9~mv2_d_3264_2448_s_4_2.jpg)"
echo "Done. Open index.html in a browser to check."
