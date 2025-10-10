# GitHub Secrets Setup for Android Release

This document describes how to set up the required GitHub secrets for automatic Android app bundle builds and Google Play uploads.

## Required GitHub Secrets

Navigate to your repository: **Settings → Secrets and variables → Actions → New repository secret**

### 1. Android Keystore Secrets

#### `KEYSTORE_BASE64`
Your Android signing keystore encoded in base64.

**How to create:**
```bash
# Convert your keystore to base64
base64 -i android/app/upload-keystore.jks | tr -d '\n' > keystore.txt
# Copy the contents of keystore.txt to this secret
```

**Or if you don't have a keystore yet:**
```bash
# Generate a new keystore
keytool -genkey -v -keystore android/app/upload-keystore.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload -storepass YOUR_STORE_PASSWORD \
  -keypass YOUR_KEY_PASSWORD

# Then convert to base64
base64 -i android/app/upload-keystore.jks | tr -d '\n'
```

#### `KEYSTORE_PASSWORD`
The password for your keystore file.

**Example:** `myStorePassword123`

#### `KEY_PASSWORD`
The password for your key within the keystore.

**Example:** `myKeyPassword456`

#### `KEY_ALIAS`
The alias of your key in the keystore.

**Example:** `upload`

---

### 2. Google Play Console Secrets

#### `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`
The JSON key file for your Google Play Console service account.

**How to create:**

1. Go to [Google Play Console](https://play.google.com/console)
2. Navigate to **Setup → API access**
3. Create a new service account or use existing one
4. Download the JSON key file
5. Copy the **entire contents** of the JSON file to this secret

**Example format:**
```json
{
  "type": "service_account",
  "project_id": "your-project-id",
  "private_key_id": "...",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "your-service-account@your-project.iam.gserviceaccount.com",
  "client_id": "...",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "..."
}
```

**Important:** Make sure the service account has the following permissions in Google Play Console:
- Release apps to production
- Manage production releases

---

## Verification

Once all secrets are added:

1. Push to the `main` branch
2. Go to **Actions** tab in your repository
3. Watch the "Android Release Build" workflow
4. If successful, the app bundle will be uploaded to Google Play production track

## Troubleshooting

### Keystore decode fails
- Make sure there are no newlines in `KEYSTORE_BASE64`
- Verify the base64 encoding: `echo "$KEYSTORE_BASE64" | base64 --decode > test.jks && file test.jks`

### Google Play upload fails
- Verify service account has correct permissions
- Check that the package name matches: `com.pixeloid.eventapp`
- Ensure the version code in `android/app/build.gradle.kts` is higher than the current production version

### Build fails with signing error
- Double-check all passwords are correct
- Verify the key alias matches the one in your keystore

---

## Security Notes

⚠️ **Never commit these values to git!**
- Keystore files should be in `.gitignore`
- `key.properties` should be in `.gitignore`
- Only store secrets in GitHub Secrets (encrypted at rest)

✅ The workflow creates `key.properties` temporarily during build and it's never committed.
