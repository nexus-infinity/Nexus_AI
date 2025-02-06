#!/bin/bash

# Unified Execution Script for Nexus Infiniti
# Ensures step-by-step execution of all components

LOG_FILE="nexus_execution.log"

echo "🚀 Starting Nexus Infiniti Execution..." | tee -a $LOG_FILE
echo "-----------------------------------------" | tee -a $LOG_FILE

# Step 1: Detect Environment
echo "🔍 Detecting Environment..." | tee -a $LOG_FILE
bash detect_environment.sh >> $LOG_FILE 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Environment Detection Failed! Exiting." | tee -a $LOG_FILE
    exit 1
fi
echo "✅ Environment Detected Successfully!" | tee -a $LOG_FILE

# Step 2: Set Up Project Structure
echo "🛠 Setting Up Project Structure..." | tee -a $LOG_FILE
bash setup_project.sh >> $LOG_FILE 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Project Setup Failed! Attempting Self-Healing..." | tee -a $LOG_FILE
    bash self_healing.sh >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "❌ Self-Healing Failed. Manual Intervention Required!" | tee -a $LOG_FILE
        exit 1
    fi
fi
echo "✅ Project Setup Completed!" | tee -a $LOG_FILE

# Step 3: Configure System Structure
echo "📂 Configuring File System & Structure..." | tee -a $LOG_FILE
bash setup_structure.sh >> $LOG_FILE 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Structure Setup Failed! Exiting." | tee -a $LOG_FILE
    exit 1
fi
echo "✅ Structure Configured Successfully!" | tee -a $LOG_FILE

# Step 4: Scale AI Systems
echo "📡 Checking AI Models Before Scaling..." | tee -a $LOG_FILE

AI_MODELS_DIR="path/to/ai_models"  # <-- Update with correct path
if [ -d "$AI_MODELS_DIR" ] && [ "$(ls -A $AI_MODELS_DIR 2>/dev/null)" ]; then
    echo "✅ AI Models Detected. Scaling AI..." | tee -a $LOG_FILE
    bash scale_ai.sh >> $LOG_FILE 2>&1
    if [ $? -ne 0 ]; then
        echo "❌ AI Scaling Failed! Attempting Self-Healing..." | tee -a $LOG_FILE
        bash self_healing.sh >> $LOG_FILE 2>&1
        if [ $? -ne 0 ]; then
            echo "❌ Self-Healing Failed. AI Deployment Needs Manual Fix!" | tee -a $LOG_FILE
            exit 1
        fi
    fi
    echo "✅ AI Scaling Completed!" | tee -a $LOG_FILE
else
    echo "⚠️ No AI Models Found. Skipping AI Scaling." | tee -a $LOG_FILE
fi

# Step 5: Run Self-Healing Mechanism
echo "🩺 Running Self-Healing Checks..." | tee -a $LOG_FILE
bash self_healing.sh >> $LOG_FILE 2>&1
if [ $? -ne 0 ]; then
    echo "⚠️ Self-Healing Encountered Errors. Check Logs!" | tee -a $LOG_FILE
fi
echo "✅ Self-Healing Process Completed!" | tee -a $LOG_FILE

# Step 6: Test Environment Configuration
echo "🔎 Testing System Configuration..." | tee -a $LOG_FILE
python3 test_env_config.py >> $LOG_FILE 2>&1
bash test_env_config.sh >> $LOG_FILE 2>&1
if [ $? -ne 0 ]; then
    echo "❌ Configuration Tests Failed! Exiting." | tee -a $LOG_FILE
    exit 1
fi
echo "✅ System Configuration Validated!" | tee -a $LOG_FILE

echo "🎉 Nexus Infiniti Execution Completed Successfully!" | tee -a $LOG_FILE
exit 0
