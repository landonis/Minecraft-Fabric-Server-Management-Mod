#!/bin/bash

set -e

echo "🔍 Checking system dependencies..."

# Check and install Java 17
if ! java -version 2>&1 | grep '17'; then
  echo "⚙️ Installing Java 17..."
  sudo apt update
  sudo apt install -y openjdk-17-jdk
else
  echo "✅ Java 17 is already installed."
fi

# Check and install Gradle
if ! command -v gradle &> /dev/null; then
  echo "⚙️ Installing Gradle..."
  sudo apt install -y gradle
else
  echo "✅ Gradle is already installed."
fi

# Set destination directory for mods
DEST_MODS_DIR="/home/ubuntu/Minecraft/mods"
mkdir -p "$DEST_MODS_DIR"

# Build the mod
echo "📁 Building FabricPlayerViewerMod..."
cd "$(dirname "$0")"
gradle build --no-daemon

MOD_JAR=$(find build/libs -name "fabricplayerviewer-*.jar" | head -n 1)

if [ ! -f "$MOD_JAR" ]; then
  echo "❌ Build failed. Mod JAR not found."
  exit 1
fi

echo "📦 Installing mod to Minecraft mods directory: $DEST_MODS_DIR"
sudo cp "$MOD_JAR" "$DEST_MODS_DIR"

echo "✅ Mod deployed successfully!"
