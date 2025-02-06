#!/bin/bash
LOG_FILE="NexusInfinityAI/data/self_check.log"
echo "🛠 Running AI self-repair..." | tee -a $LOG_FILE

# Run self-check
bash setup_structure.sh | tee -a $LOG_FILE

# If errors found, attempt to correct
if grep -q "❌ ERROR" "$LOG_FILE"; then
    echo "⚠️ Errors detected! Auto-repairing..."
    bash setup_structure.sh | tee -a $LOG_FILE
fi

echo "✅ AI system is stable." | tee -a $LOG_FILE
