#!/bin/bash

echo "🔍 Detecting Deployment Environment..."

# 🛠 Detect OS, Architecture, Kernel
OS_NAME=$(uname -s)
ARCHITECTURE=$(uname -m)
KERNEL_VERSION=$(uname -r)

# ☁️ Detect Cloud Provider (AWS, GCP, Azure, DigitalOcean, etc.)
if grep -q "Amazon EC2" /sys/class/dmi/id/product_name 2>/dev/null; then
    CLOUD_PROVIDER="AWS"
elif [ -f "/sys/class/dmi/id/chassis_vendor" ] && grep -qi "Microsoft" /sys/class/dmi/id/chassis_vendor 2>/dev/null; then
    CLOUD_PROVIDER="Azure"
elif curl -s -m 2 http://metadata.google.internal/computeMetadata/v1/ -H "Metadata-Flavor: Google" &>/dev/null; then
    CLOUD_PROVIDER="GCP"
elif curl -s -m 2 http://169.254.169.254/metadata/v1/ &>/dev/null; then
    CLOUD_PROVIDER="DigitalOcean"
else
    CLOUD_PROVIDER="Unknown/Local"
fi

# 🚀 Detect Deployment Mode
if [[ "$OS_NAME" == "Darwin" ]]; then
    DEPLOYMENT_MODE="macOS"
elif [[ "$OS_NAME" == "Linux" ]]; then
    DEPLOYMENT_MODE="Linux"
elif [[ "$OS_NAME" == "Windows_NT" ]]; then
    DEPLOYMENT_MODE="Windows"
else
    DEPLOYMENT_MODE="Unknown"
fi

# 🐳 Check Docker Installation & Running Status
DOCKER_VERSION=$(docker --version 2>/dev/null)
if [[ -n "$DOCKER_VERSION" ]]; then
    DOCKER_STATUS="Installed"
    if docker info &>/dev/null; then
        DOCKER_RUNNING="Running"
    else
        DOCKER_RUNNING="Not Running"
    fi
else
    DOCKER_STATUS="Not Installed"
    DOCKER_RUNNING="N/A"
fi

# 📁 Detect External HDDs (USB, Thunderbolt, Network Drives)
EXTERNAL_HDD=$(ls /Volumes 2>/dev/null | grep -v "Macintosh HD" | tr '\n' ', ')
if [[ -n "$EXTERNAL_HDD" ]]; then
    HDD_STATUS="Attached: ${EXTERNAL_HDD%, }"
else
    HDD_STATUS="Not Found"
fi

# 🔥 AI Self-Balancing (Bear Algorithm Style)
CPU_USAGE=$(top -l 1 | grep "CPU usage" | awk '{print $3}' | sed 's/%//')
MEMORY_FREE=$(vm_stat | awk '/Pages free/ {print $3}' | sed 's/\.//')

if [[ -z "$MEMORY_FREE" ]]; then
    MEMORY_FREE=0  # Default to 0 if not detected
fi

if (( CPU_USAGE > 80 )); then
    AI_SCALING="⚠️ High CPU Load - Auto-scaling triggered!"
elif (( MEMORY_FREE < 100000 )); then  # Adjusted threshold
    AI_SCALING="⚠️ Low Memory - Optimizing AI workflows"
else
    AI_SCALING="✅ Balanced"
fi

# 🏗️ Check MongoDB Storage Usage (Only if Data Directory Exists)
MONGO_STORAGE="N/A"
if [ -d ~/mongodb-data ]; then
    MONGO_STORAGE=$(du -sh ~/mongodb-data | awk '{print $1}')
else
    MONGO_STORAGE="Not Found"
fi

# 📂 Check Project Space
PROJECT_DIR=$(pwd)
PROJECT_USAGE=$(du -sh "$PROJECT_DIR" | awk '{print $1}')

# 🛠 Check Dependencies
NODE_VERSION=$(node -v 2>/dev/null)
NPM_VERSION=$(npm -v 2>/dev/null)
PYTHON_VERSION=$(python3 --version 2>/dev/null)
PRISMA_VERSION=$(npx prisma --version 2>/dev/null)
MONGO_STATUS=$(mongod --version 2>/dev/null)

# 🔍 Check Environment Files
ENV_FILES=()
for file in ".env" ".zshrc" ".bashrc" ".profile" "config/config.ini"; do
    if [[ -f "$HOME/$file" || -f "$PROJECT_DIR/$file" ]]; then
        ENV_FILES+=("$file ✅ Found")
    else
        ENV_FILES+=("$file ❌ Missing")
    fi
done

# 🛠 Auto-create Missing Config File
CONFIG_PATH="config/config.ini"
if [[ ! -f "$CONFIG_PATH" ]]; then
    echo "⚠️ Missing config.ini - Creating default file..."
    mkdir -p config
    echo "[Deployment]" > "$CONFIG_PATH"
    echo "os=$OS_NAME" >> "$CONFIG_PATH"
    echo "architecture=$ARCHITECTURE" >> "$CONFIG_PATH"
    echo "kernel_version=$KERNEL_VERSION" >> "$CONFIG_PATH"
    echo "cloud_provider=$CLOUD_PROVIDER" >> "$CONFIG_PATH"
    echo "mode=$DEPLOYMENT_MODE" >> "$CONFIG_PATH"
    echo "docker_status=$DOCKER_STATUS" >> "$CONFIG_PATH"
    echo "docker_running=$DOCKER_RUNNING" >> "$CONFIG_PATH"
    echo "external_hdd=$HDD_STATUS" >> "$CONFIG_PATH"
    echo "ai_scaling=$AI_SCALING" >> "$CONFIG_PATH"
    echo "node_version=$NODE_VERSION" >> "$CONFIG_PATH"
    echo "npm_version=$NPM_VERSION" >> "$CONFIG_PATH"
    echo "python_version=$PYTHON_VERSION" >> "$CONFIG_PATH"
    echo "prisma_version=$PRISMA_VERSION" >> "$CONFIG_PATH"
    echo "mongo_status=$MONGO_STATUS" >> "$CONFIG_PATH"
    echo "mongo_storage=$MONGO_STORAGE" >> "$CONFIG_PATH"
    echo "project_space=$PROJECT_USAGE" >> "$CONFIG_PATH"
fi

# 📜 Display Results
echo -e "\n📂 **Project Space Analysis**"
echo "Project Directory: $PROJECT_DIR"
echo "Total Space Used: $PROJECT_USAGE"
echo "Docker: $DOCKER_STATUS ($DOCKER_RUNNING)"
echo "External HDD: $HDD_STATUS"
echo "AI Scaling Status: $AI_SCALING"

echo -e "\n📜 **System Details**"
echo "OS: $OS_NAME"
echo "Architecture: $ARCHITECTURE"
echo "Kernel Version: $KERNEL_VERSION"
echo "Cloud Provider: $CLOUD_PROVIDER"
echo "Deployment Mode: $DEPLOYMENT_MODE"

echo -e "\n🔍 **Environment Files Check**"
for env_file in "${ENV_FILES[@]}"; do
    echo "$env_file"
done

echo -e "\n✅ **System Check Complete! Configuration saved in $CONFIG_PATH**"
