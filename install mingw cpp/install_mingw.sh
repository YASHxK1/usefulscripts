#!/bin/bash

# === MinGW-w64 Installer for Linux ===
# This script installs MinGW-w64 cross compiler to build Windows executables from Linux

set -e  # Exit if any command fails

echo "=== Updating system packages ==="
sudo apt update -y
sudo apt upgrade -y

echo "=== Installing MinGW-w64 toolchain ==="
sudo apt install -y mingw-w64

echo "=== Configuring default MinGW target ==="
# You can choose between posix/seh or win32/dwarf versions depending on your target
# Here we configure x86_64 for 64-bit Windows builds
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
sudo update-alternatives --set x86_64-w64-mingw32-gcc /usr/bin/x86_64-w64-mingw32-gcc-posix

echo "=== Verifying Installation ==="
x86_64-w64-mingw32-g++ --version || { echo "Installation failed!"; exit 1; }

echo "=== MinGW-w64 Installation Complete ==="
echo "You can now compile Windows executables like this:"
echo "x86_64-w64-mingw32-g++ -o hello.exe hello.cpp"
