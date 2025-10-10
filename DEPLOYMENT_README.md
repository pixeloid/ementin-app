# 🚀 Ementin App - Automatic Deployment Setup

## Your Current Status

✅ **Keystore exists:** `/Users/pixeloid/upload-keystore.jks`
✅ **Key alias:** `upload`
❓ **Passwords:** You need to find/remember these
❓ **Google Play JSON:** Need to download from console

## 🎯 Quick Start (3 Steps)

### Step 1: Generate Secrets
```bash
cd /Users/pixeloid/FlutterProjects/eventapp
.github/generate-secrets.sh
```

**This will ask for:**
- Keystore password (the one you set in Sep 2023)
- Key password (often same as keystore password)

**It will give you:**
- ✅ KEYSTORE_BASE64 (auto-generated)
- ✅ KEY_ALIAS (already set to "upload")
- ✅ KEYSTORE_PASSWORD (what you entered)
- ✅ KEY_PASSWORD (what you entered)

### Step 2: Get Google Play JSON

1. Go to [Google Play Console](https://play.google.com/console)
2. Setup → API access → Service Accounts
3. Create/download JSON key
4. Grant permissions: "Release to production"

### Step 3: Add to GitHub

1. Go to: `https://github.com/YOUR_USERNAME/YOUR_REPO/settings/secrets/actions`
2. Click "New repository secret"
3. Add all 5 secrets (from Step 1 + Step 2)
4. Done! 🎉

## 📋 The 5 Required Secrets

| Secret Name | Where to Get It |
|-------------|-----------------|
| `KEYSTORE_BASE64` | Run `.github/generate-secrets.sh` |
| `KEYSTORE_PASSWORD` | Your keystore password (or check `android/key.properties`) |
| `KEY_PASSWORD` | Your key password (or check `android/key.properties`) |
| `KEY_ALIAS` | Already known: `upload` |
| `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` | Google Play Console → API access |

## 🔍 Where Are Your Passwords?

**Check these locations:**

1. **Local key.properties file:**
   ```bash
   cat android/key.properties
   ```
   (This file is gitignored, so it's only on your machine)

2. **Password manager** (1Password, LastPass, Keychain, etc.)

3. **Your notes** from when you created the keystore (Sep 19, 2023)

4. **Android Studio settings:**
   - Preferences → Build, Execution, Deployment → Signing configs

## 🎬 After Setup

Once all 5 secrets are added to GitHub:

```bash
git add .
git commit -m "Update deployment setup"
git push origin main
```

GitHub Actions will automatically:
1. Build signed AAB
2. Upload to Google Play production track
3. Your app goes live! 🚀

Watch progress: **Actions** tab in GitHub

## 📚 Documentation

- [SECRETS_QUICK_GUIDE.md](.github/SECRETS_QUICK_GUIDE.md) - Detailed secret setup
- [DEPLOYMENT_GUIDE.md](.github/DEPLOYMENT_GUIDE.md) - Full deployment guide
- [SECRETS_SETUP.md](.github/SECRETS_SETUP.md) - Technical details

## 🆘 Forgot Your Passwords?

If you can't find the passwords:

**Option 1:** Check if you have local `android/key.properties`:
```bash
cat android/key.properties
```

**Option 2:** If you're using Google Play App Signing, you can create a new upload keystore

**Option 3:** Contact whoever set up the original keystore

## ✅ Checklist

- [ ] Run `.github/generate-secrets.sh`
- [ ] Find/remember keystore password
- [ ] Download Google Play service account JSON
- [ ] Add all 5 secrets to GitHub
- [ ] Push to main
- [ ] Watch deployment in Actions tab
- [ ] Check Google Play Console for new release

---

**Ready?** Start with: `.github/generate-secrets.sh` 🚀
