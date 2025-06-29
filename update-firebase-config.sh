#!/bin/bash

echo "🔥 Firebase Configuration Setup for unWalleted"
echo "=============================================="
echo ""

echo "📋 Please follow these steps:"
echo "1. Go to https://console.firebase.google.com/"
echo "2. Select your project (or create a new one)"
echo "3. Go to Project Settings (gear icon)"
echo "4. Add a web app if you haven't already"
echo "5. Copy the configuration values"
echo ""

echo "🔧 Now let's update your configuration:"
echo ""

# Get Firebase API Key
read -p "Enter your Firebase API Key: " FIREBASE_API_KEY
read -p "Enter your Firebase Auth Domain: " FIREBASE_AUTH_DOMAIN
read -p "Enter your Firebase Project ID: " FIREBASE_PROJECT_ID
read -p "Enter your Firebase Storage Bucket: " FIREBASE_STORAGE_BUCKET
read -p "Enter your Firebase Messaging Sender ID: " FIREBASE_MESSAGING_SENDER_ID
read -p "Enter your Firebase App ID: " FIREBASE_APP_ID

echo ""
echo "📝 Updating client/.env file..."

# Create the .env file with the provided values
cat > client/.env << EOF
# API Configuration
REACT_APP_API_URL=http://localhost:3001

# Firebase Configuration
REACT_APP_FIREBASE_API_KEY=$FIREBASE_API_KEY
REACT_APP_FIREBASE_AUTH_DOMAIN=$FIREBASE_AUTH_DOMAIN
REACT_APP_FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID
REACT_APP_FIREBASE_STORAGE_BUCKET=$FIREBASE_STORAGE_BUCKET
REACT_APP_FIREBASE_MESSAGING_SENDER_ID=$FIREBASE_MESSAGING_SENDER_ID
REACT_APP_FIREBASE_APP_ID=$FIREBASE_APP_ID
EOF

echo "✅ Firebase configuration updated!"
echo ""
echo "🔄 Restarting the frontend server..."
echo "   (You may need to stop and restart manually if it's running)"
echo ""
echo "🎉 Your unWalleted app should now work with Firebase authentication!"
echo ""
echo "📖 Don't forget to:"
echo "   - Enable Google Authentication in Firebase Console"
echo "   - Add 'localhost' to authorized domains for development"
echo ""
echo "🌐 Open http://localhost:3000 to test your app" 