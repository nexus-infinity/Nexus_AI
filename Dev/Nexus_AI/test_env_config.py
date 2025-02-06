#!/bin/bash

echo "🔍 Testing Environment Configuration..."

# ✅ Check if ~/.env exists
if [[ -f "$HOME/.env" ]]; then
    echo "✅ ~/.env Found"
else
    echo "⚠️ ~/.env Missing! Some configurations may not load."
fi

# ✅ Check if ~/.zshrc exists
if [[ -f "$HOME/.zshrc" ]]; then
    echo "✅ ~/.zshrc Found"
else
    echo "⚠️ ~/.zshrc Missing! Shell may not be configured properly."
fi

# 🛠 Validate ~/.env (Ensure all variables have correct format)
echo "🔎 Validating ~/.env syntax..."
INVALID_LINES=$(grep -Ev "^[A-Za-z_][A-Za-z0-9_]*=[^ ]+" "$HOME/.env" | grep -v '^#')

if [[ -n "$INVALID_LINES" ]]; then
    echo "❌ Syntax Errors in ~/.env:"
    echo "$INVALID_LINES"
    exit 1
else
    echo "✅ ~/.env syntax is valid."
fi

# 🏗️ Load ~/.env into the current shell
echo "🔄 Loading ~/.env..."
set -o allexport
source "$HOME/.env"
set +o allexport
echo "✅ Environment variables loaded successfully."

# 🏗️ Load ~/.zshrc (without restarting the shell)
echo "🔄 Sourcing ~/.zshrc..."
source "$HOME/.zshrc"
echo "✅ ~/.zshrc loaded successfully."

# 🛠 Test if critical environment variables are set
REQUIRED_VARS=("APP_NAME" "DB_CONNECTION" "DB_HOST" "DB_PORT" "DB_DATABASE" "DB_USERNAME" "DB_PASSWORD")
MISSING_VARS=()

for VAR in "${REQUIRED_VARS[@]}"; do
    if [[ -z "${!VAR}" ]]; then
        MISSING_VARS+=("$VAR")
    fi
done

if [[ ${#MISSING_VARS[@]} -gt 0 ]]; then
    echo "⚠️ Missing Required Environment Variables:"
    printf " - %s\n" "${MISSING_VARS[@]}"
    exit 1
else
    echo "✅ All required environment variables are set."
fi

# 🚀 Test Database Connection (if MongoDB is being used)
if [[ "$DB_CONNECTION" == "mongodb" ]]; then
    echo "🔎 Testing MongoDB Connection..."
    mongosh "$MONGODB_URI" --eval 'db.runCommand({ connectionStatus: 1 })' &>/dev/null
    if [[ $? -eq 0 ]]; then
        echo "✅ MongoDB Connection Successful!"
    else
        echo "❌ MongoDB Connection Failed!"
    fi
fi

echo "✅ Environment check complete!"
