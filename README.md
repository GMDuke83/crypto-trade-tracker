
# Crypto Trade Tracker — Static Deploy

This folder contains a static, buildless version of your app. `index.html` is ready to deploy. Below are classic, reliable ways to publish **and** keep editing offline, then push updates easily.

---

## Option A — GitHub Pages (traditional, free)

1. Create a new repo on GitHub, e.g. `crypto-trade-tracker`.
2. Put these files at the repo root and commit:

   ```bash
   git init
   git add .
   git commit -m "Initial publish"
   git branch -M main
   git remote add origin https://github.com/<USER>/crypto-trade-tracker.git
   git push -u origin main
   ```

3. Enable **Settings → Pages** → Source: **Deploy from a branch**, Branch: `main`, Folder: `/ (root)`.
4. Your site will be available at: `https://<USER>.github.io/crypto-trade-tracker/`.
5. **Update flow:** Edit offline → `git add . && git commit -m "Update" && git push` → live in ~30–60s.

> Custom domain: Add it under **Pages → Custom domain** and create the suggested DNS records at your registrar.

---

## Option B — Cloudflare Pages (drag & drop or repo)

### Drag & Drop
1. Go to Cloudflare Dashboard → **Pages** → **Create a project** → **Upload assets**.
2. Drag this folder. Framework preset: **None** (static). Root directory: this folder.
3. You get a `*.pages.dev` URL.
4. **Updates:** Re-upload the folder ZIP next time, or connect a GitHub repo to auto-deploy on push.

### GitHub Connect
1. Create a repo (as above), then in Cloudflare Pages **Connect to Git**.
2. Framework preset: **None**; Build command: **(empty)**; Output directory: **/**.
3. **Updates:** `git push` triggers deployment.

---

## Option C — Netlify (one-click, repo or drag–drop)

### Netlify Drop
1. Visit https://app.netlify.com/drop and drop this folder.
2. **Updates:** Drop a new ZIP/folder whenever you have changes.

### Git-backed
1. New site from Git → pick your repo → Build cmd: _(empty)_, Publish dir: `/`.
2. **Updates:** `git push` triggers deploy.

---

## Option D — Classic SFTP/rsync to your server

Edit `deploy_rsync.sh` with your server, then:

```bash
bash deploy_rsync.sh
```

This syncs only changed files to `/var/www/ctt` (adjust as needed).

---

## Notes

- Keep **relative paths** for local assets (CSS/JS/images) so the site works on any host and subpath.
- If you load external APIs (e.g., Binance), ensure CORS is allowed. If not, proxy via your server.
- For cache-busting, append a query to your own scripts: `app.js?v=2025-08-18` when you update.
- `404.html` improves routing on GitHub Pages/Netlify; `robots.txt` is permissive by default.
