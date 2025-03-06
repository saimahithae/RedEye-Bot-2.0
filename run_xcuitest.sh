#!/bin/bash

# Exit immediately if any command fails
set -e

# Navigate to the Xcode project directory
cd ~/Documents/Automated\ RedEye\ Bot || exit

# Ensure the Xcode workspace and scheme exist
if [ ! -f "RedEyeAuto.xcworkspace" ]; then
  echo "❌ Xcode workspace not found!"
  exit 1
fi

echo "🚀 Starting UI Tests on iPhone Simulator..."

# Run XCTest UI Tests
xcodebuild test \
  -workspace "RedEyeAuto.xcworkspace" \
  -scheme "RedEyeAutoUITests" \
  -destination "platform=iOS Simulator,name=iPhone 14,OS=latest" \
  -derivedDataPath ./DerivedData \
  | xcpretty --color

# Check if tests passed
if [ $? -eq 0 ]; then
  echo "✅ RedEye Bot UI Tests Passed!"
else
  echo "❌ RedEye Bot UI Tests Failed!"
  exit 1
fi

