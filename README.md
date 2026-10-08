# reference-designs.com — off Wix

A single-page static site (one HTML file + one CSS file, no build step, no monthly platform fee). Old Wix URLs (`/book-online`, `/blog`, `/members`, etc.) redirect to the home page so no links break.

## 1. Grab the images (do this before cancelling Wix)

**Windows:** double-click **`Download images.bat`** in this folder.
*(Mac/Linux: `bash fetch-images.sh`)*

Pulls the 8 photos/logos from Wix's CDN into `images/`. Open `index.html` in a browser to check everything looks right.

## 2. Turn on the contact form

The form works out of the box by opening the visitor's email app pre-filled to info@reference-designs.com. For a proper "Send" button that emails you directly:

1. Create a free form at https://formspree.io (or use Netlify Forms — see below).
2. In `index.html`, replace `YOUR_FORM_ID` with your form ID.

*Netlify alternative:* add `data-netlify="true"` to the `<form>` tag and remove the `action=` attribute.

## 3. Host it (free options)

| Host | How |
|---|---|
| **Netlify** (easiest) | app.netlify.com → "Add new site" → "Deploy manually" → drag this folder in. |
| **Cloudflare Pages** | dash.cloudflare.com → Workers & Pages → Create → Pages → Upload assets. |
| **GitHub Pages** | Push to a repo, Settings → Pages. (`_redirects` is ignored there.) |

Both Netlify and Cloudflare honor `_redirects`, which forwards every old Wix URL (`/book-online`, `/blog`, `/post/...`, `/members`, etc.) to the home page.

## 4. Move the domain

1. Add `www.reference-designs.com` and `reference-designs.com` as custom domains in the new host; it'll show the DNS records to set.
2. **Where is the domain registered?** If it's registered through Wix, transfer it out first (Wix → Domains → ⋯ → Transfer away from Wix → get the auth code), then transfer to Cloudflare, Namecheap, etc. If it's registered elsewhere, just change the DNS records.
3. **Email:** if `info@` / `rbardeau@` run through Google Workspace bought via Wix, note the MX records before changing DNS and recreate them at the new DNS provider — otherwise email stops.
4. Wait for HTTPS to show active on the new host, verify the site, *then* cancel the Wix plan.
5. The Google Search Console verification tag is already in every page; submit `sitemap.xml` there.

## What changed vs. the Wix site

- **Book Online, Blog, Members / Log In, newsletter signup** — removed. Visitors who want a service or a Control4 demo use the contact form (the topic dropdown covers both).
- **Location wording** — the old Wix SEO description said "Torrance and Costa Mesa" while the page said Manhattan Beach. Everything now says Manhattan Beach; edit if that's wrong.
- **Footer** — "©2018 … Proudly created with Wix.com" replaced with an auto-updating year.
- Added: mobile menu, sitemap, robots.txt, social-share tags.

## Editing

Pages are plain HTML — open them in any text editor. Colors and fonts are at the top of `css/style.css` (`--accent` is the brand red).
