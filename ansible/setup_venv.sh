#!/bin/bash

# Check if virtual environment already exists
if [ ! -d ".venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv .venv
else
    echo "Virtual environment already exists"
fi

# Activate virtual environment
echo "Activating virtual environment..."
source .venv/bin/activate

# Print confirmation message
echo "Virtual environment is now active"
echo "You can now install packages using pip" 