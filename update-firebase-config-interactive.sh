#!/bin/bash

echo "🔥 Firebase Configuration Updater 🔥"
echo "====================================="
echo ""

# Check if .env file exists
if [ ! -f "client/.env" ]; then
    echo "❌ client/.env file not found!"
    echo "Creating from template..."
    cp client/env.example client/.env
fi

echo "📋 Current Firebase configuration:"
echo "--------------------------------"
cat client/.env | grep FIREBASE
echo ""

echo "🔧 Please enter your Firebase configuration values:"
echo ""

# Get Firebase config values
read -p "Enter Firebase API Key: " api_key
read -p "Enter Firebase Auth Domain: " auth_domain
read -p "Enter Firebase Project ID: " project_id
read -p "Enter Firebase Storage Bucket: " storage_bucket
read -p "Enter Firebase Messaging Sender ID: " messaging_sender_id
read -p "Enter Firebase App ID: " app_id

echo ""
echo "📝 Updating client/.env file..."

# Create backup
cp client/.env client/.env.backup

# Update the .env file
sed -i "s/REACT_APP_FIREBASE_API_KEY=.*/REACT_APP_FIREBASE_API_KEY=$api_key/" client/.env
sed -i "s/REACT_APP_FIREBASE_AUTH_DOMAIN=.*/REACT_APP_FIREBASE_AUTH_DOMAIN=$auth_domain/" client/.env
sed -i "s/REACT_APP_FIREBASE_PROJECT_ID=.*/REACT_APP_FIREBASE_PROJECT_ID=$project_id/" client/.env
sed -i "s/REACT_APP_FIREBASE_STORAGE_BUCKET=.*/REACT_APP_FIREBASE_STORAGE_BUCKET=$storage_bucket/" client/.env
sed -i "s/REACT_APP_FIREBASE_MESSAGING_SENDER_ID=.*/REACT_APP_FIREBASE_MESSAGING_SENDER_ID=$messaging_sender_id/" client/.env
sed -i "s/REACT_APP_FIREBASE_APP_ID=.*/REACT_APP_FIREBASE_APP_ID=$app_id/" client/.env

echo "✅ Firebase configuration updated!"
echo ""
echo "📋 Updated configuration:"
echo "------------------------"
cat client/.env | grep FIREBASE
echo ""
echo "🔄 You need to restart your React development server for changes to take effect."
echo "   Run: cd client && npm start"
echo ""
echo "💾 Backup saved as: client/.env.backup" 