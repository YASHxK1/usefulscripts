#!/bin/bash
echo "=== Installing Eclipse IDE for Java ==="

# Update system
sudo apt update

# Install Snap if not installed
sudo apt install snapd -y

# Install Eclipse
sudo snap install eclipse --classic

echo "=== Eclipse installation complete! ==="
echo "You can launch Eclipse by typing 'eclipse' in the terminal."
