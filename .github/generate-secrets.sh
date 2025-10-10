#!/bin/bash

# Script to generate GitHub Secrets from your keystore
# This script helps you extract all necessary values for GitHub Actions

set -e

echo "🔐 GitHub Secrets Generator for Android Deployment"
echo "=================================================="
echo ""

KEYSTORE_PATH="/Users/pixeloid/upload-keystore.jks"

# Check if keystore exists
if [ ! -f "$KEYSTORE_PATH" ]; then
    echo "❌ Error: Keystore not found at $KEYSTORE_PATH"
    exit 1
fi

echo "✅ Found keystore at: $KEYSTORE_PATH"
echo ""

# 1. Generate KEYSTORE_BASE64
echo "1️⃣  KEYSTORE_BASE64"
echo "==================="
echo "Converting keystore to base64..."
KEYSTORE_BASE64=$(base64 -i "$KEYSTORE_PATH" | tr -d '\n')
echo "✅ Generated (length: ${#KEYSTORE_BASE64} chars)"
echo ""
echo "Copy this value to GitHub Secret 'KEYSTORE_BASE64':"
echo "---"
echo "$KEYSTORE_BASE64"
echo "---"
echo ""

# 2. KEY_ALIAS
echo "2️⃣  KEY_ALIAS"
echo "============="
echo "From keystore analysis, the alias is: upload"
echo ""
echo "Copy this value to GitHub Secret 'KEY_ALIAS':"
echo "---"
echo "upload"
echo "---"
echo ""

# 3. Prompt for passwords
echo "3️⃣  KEYSTORE_PASSWORD"
echo "====================="
echo "This is the password you used when creating the keystore."
echo "If you don't remember it, you'll need to create a new keystore."
echo ""
read -sp "Enter keystore password (will not be displayed): " KEYSTORE_PASSWORD
echo ""
echo ""
echo "Copy this value to GitHub Secret 'KEYSTORE_PASSWORD':"
echo "---"
echo "$KEYSTORE_PASSWORD"
echo "---"
echo ""

echo "4️⃣  KEY_PASSWORD"
echo "================"
echo "This is the password for the 'upload' key within the keystore."
echo "Often it's the same as the keystore password."
echo ""
read -sp "Enter key password (press Enter if same as keystore password): " KEY_PASSWORD
echo ""

if [ -z "$KEY_PASSWORD" ]; then
    KEY_PASSWORD="$KEYSTORE_PASSWORD"
    echo "Using same password as keystore password."
fi

echo ""
echo "Copy this value to GitHub Secret 'KEY_PASSWORD':"
echo "---"
echo "$KEY_PASSWORD"
echo "---"
echo ""

# Verify the keystore with provided password
echo "🔍 Verifying keystore with provided password..."
if keytool -list -keystore "$KEYSTORE_PATH" -storepass "$KEYSTORE_PASSWORD" -alias upload > /dev/null 2>&1; then
    echo "✅ Keystore verification successful!"
else
    echo "⚠️  Warning: Could not verify keystore. Please check your passwords."
fi
echo ""

# 5. Google Play Service Account
echo "5️⃣  GOOGLE_PLAY_SERVICE_ACCOUNT_JSON"
echo "====================================="
echo "This is the service account JSON from Google Play Console."
echo ""
echo "To get this:"
echo "1. Go to https://play.google.com/console"
echo "2. Navigate to: Setup → API access"
echo "3. Create or use existing service account"
echo "4. Download the JSON key file"
echo "5. Copy the ENTIRE contents of that JSON file"
echo ""
echo "The JSON should look like:"
echo '{'
echo '  "type": "service_account",'
echo '  "project_id": "...",'
echo '  "private_key_id": "...",'
echo '  ...'
echo '}'
echo ""

# Summary
echo "📋 SUMMARY - Add these 5 secrets to GitHub"
echo "=========================================="
echo ""
echo "Go to: https://github.com/YOUR_USERNAME/YOUR_REPO/settings/secrets/actions"
echo ""
echo "Add these secrets:"
echo "1. KEYSTORE_BASE64          (${#KEYSTORE_BASE64} chars)"
echo "2. KEY_ALIAS                (value: upload)"
echo "3. KEYSTORE_PASSWORD        (your keystore password)"
echo "4. KEY_PASSWORD             (your key password)"
echo "5. GOOGLE_PLAY_SERVICE_ACCOUNT_JSON (from Google Play Console)"
echo ""
echo "✅ Once all 5 secrets are added, push to main branch to trigger deployment!"
echo ""

# Save to temporary file for easy copying
TEMP_FILE="/tmp/github-secrets-$(date +%s).txt"
cat > "$TEMP_FILE" << EOF
GitHub Secrets for Ementin App
Generated: $(date)

1. KEYSTORE_BASE64:
$KEYSTORE_BASE64

2. KEY_ALIAS:
upload

3. KEYSTORE_PASSWORD:
$KEYSTORE_PASSWORD

4. KEY_PASSWORD:
$KEY_PASSWORD

5. GOOGLE_PLAY_SERVICE_ACCOUNT_JSON:
(Copy from Google Play Console JSON file)

EOF

echo "💾 All values saved to: $TEMP_FILE"
echo "⚠️  Delete this file after copying secrets to GitHub!"
echo ""
