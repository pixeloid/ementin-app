# 🚀 Quick Guide: Your Keystore Information

## What You Have

✅ **Keystore file:** `/Users/pixeloid/upload-keystore.jks`
✅ **Alias:** `upload` (found in the keystore)

## What You Need to Find

### 1. 🔐 KEYSTORE_BASE64 ✅ (Auto-generated)
Run this script to generate it automatically:

```bash
cd /Users/pixeloid/FlutterProjects/eventapp
.github/generate-secrets.sh
```

This script will:
- Generate the base64-encoded keystore
- Ask for your passwords
- Give you all 5 secrets ready to copy

### 2. 🔑 Passwords (You Need to Remember/Find These)

**KEYSTORE_PASSWORD:**
- This is the password you entered when you created the keystore in Sep 2023
- It's the "keystore password" or "store password"
- If you used Android Studio, it might be saved in your IDE settings

**KEY_PASSWORD:**
- This is the password for the "upload" key
- Often it's the **same** as the keystore password
- Try the keystore password first

**Where to look for passwords:**
1. Check your password manager (1Password, LastPass, etc.)
2. Check `android/key.properties` (if you have it locally - it's gitignored)
3. Check your notes/documents from September 2023
4. If you used Android Studio: Preferences → Build, Execution, Deployment → Signing configs

### 3. 🔑 KEY_ALIAS ✅ (Already Found)
```
upload
```

### 4. 📱 GOOGLE_PLAY_SERVICE_ACCOUNT_JSON

**Where to get it:**

1. Go to [Google Play Console](https://play.google.com/console)
2. Select your app: **Ementin** (`com.pixeloid.eventapp`)
3. Navigate to: **Setup → API access**
4. Under "Service Accounts" section:
   - If you already have one: Click on it → Create key → Download JSON
   - If you don't have one: Click "Create new service account" → Follow the prompts

5. **Grant permissions** to the service account:
   - Go back to API access page
   - Click on the service account email
   - Under "App permissions", click "Grant access"
   - Select your app
   - Grant these permissions:
     - ✅ View app information and download bulk reports
     - ✅ Release to production
     - ✅ Release to testing tracks
   - Click "Invite user" / "Apply"

6. Download the JSON key file

## 🎯 Quick Steps

1. **Run the script:**
   ```bash
   cd /Users/pixeloid/FlutterProjects/eventapp
   .github/generate-secrets.sh
   ```

2. **Find your passwords** (check password manager, notes, or key.properties)

3. **Get Google Play JSON:**
   - [Google Play Console](https://play.google.com/console) → Setup → API access

4. **Add secrets to GitHub:**
   ```
   https://github.com/YOUR_USERNAME/ementin-app/settings/secrets/actions
   ```

   Click "New repository secret" for each:
   - `KEYSTORE_BASE64`
   - `KEYSTORE_PASSWORD`
   - `KEY_PASSWORD`
   - `KEY_ALIAS`
   - `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`

5. **Push to main:**
   ```bash
   git push origin main
   ```

6. **Watch it deploy!** 🚀
   Go to: Actions tab → "Android Release Build"

## ⚠️ If You Forgot the Passwords

If you can't remember the keystore passwords:

**Option A: Find them**
- Check `android/key.properties` locally
- Check your password manager
- Check backup files

**Option B: Create new keystore** (only if you haven't published yet, or use Play App Signing)
```bash
keytool -genkey -v -keystore upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload
```

**Option C: Use Google Play App Signing** (recommended)
- Upload your app bundle to Google Play
- Let Google manage the signing key
- You only need the upload key (which is this keystore)

## 📞 Need Help?

- Check: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
- Check: [SECRETS_SETUP.md](./SECRETS_SETUP.md)
- Or just run: `.github/generate-secrets.sh` - it will guide you through!
