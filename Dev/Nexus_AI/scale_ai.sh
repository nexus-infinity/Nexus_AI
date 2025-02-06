#!/bin/bash

# AI Scaling & Deployment Script for Nexus Infiniti
LOG_FILE="ai_scaling.log"

echo "🚀 Starting AI Scaling..." | tee -a $LOG_FILE
echo "-----------------------------------" | tee -a $LOG_FILE

# Define AI Model Directory & Deployment Location
AI_MODELS_DIR="models"
DEPLOYMENT_MODE="local"  # Change to "cloud" for remote deployment

# Ensure AI Model Directory Exists
if [ ! -d "$AI_MODELS_DIR" ]; then
    echo "❌ AI Models Directory Not Found: $AI_MODELS_DIR" | tee -a $LOG_FILE
    exit 1
fi

# Detect Available Models
AVAILABLE_MODELS=$(ls -A $AI_MODELS_DIR 2>/dev/null)
if [ -z "$AVAILABLE_MODELS" ]; then
    echo "⚠️ No AI Models Found in $AI_MODELS_DIR. Exiting AI Scaling." | tee -a $LOG_FILE
    exit 0
else
    echo "✅ AI Models Found: $AVAILABLE_MODELS" | tee -a $LOG_FILE
fi

# Deploy Locally or in Cloud
if [ "$DEPLOYMENT_MODE" = "local" ]; then
    echo "🖥 Deploying AI Models Locally..." | tee -a $LOG_FILE
    python3 -m venv ai_env
    source ai_env/bin/activate
    pip install -r requirements.txt  # Ensure dependencies are installed
    python3 deploy_ai.py  # Calls AI model initialization
    deactivate
    echo "✅ AI Models Successfully Deployed Locally!" | tee -a $LOG_FILE
else
    echo "☁️ Deploying AI Models to Cloud (Vercel + ao.dev)..." | tee -a $LOG_FILE
    vercel deploy --prod  # Vercel Deployment
    echo "✅ AI Deployment to Cloud Completed!" | tee -a $LOG_FILE
fi

echo "🎉 AI Scaling Process Completed!" | tee -a $LOG_FILE
exit 0
