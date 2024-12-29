#!/bin/bash

# steamfix:
#    976730-linux-2
#    Game Error on Co-op

# Tested:
# stohgee - 2024-12-28
#    OS: Debian 12 / Freedesktop SDK 24.08 (Flatpak runtime)
#    KERNEL: 6.11.10+bpo-amd64
#    CPU: Intel Core i7-4790K @ 4.00GHz
#    GPU: NVIDIA GeForce GTX 1080 Ti
#    GPU DRIVER: NVIDIA 565.77RAM: 31 GB

# Requires:
#    cabextract wget

# Issue:
#    Proton (as of 2024-12-28) does not include the right ucrtbase.dll? This gets the right
#    one so Steam Linux and Steam Windows players can play Co-op together without the "GAME ERROR" issue
#    after launching.

# Fix:
#    Prepare a working directory at /tmp/ucrtbase
#    Download Microsft VC Redist Setup from Microsoft themselves.
#    Extract ucrtbase.dll from a package inside the setup file.
#    Unlink the original and copy the DLL file to /976730/pfx/drive_c/windows/system32/ucrtbase.dll
#    Remove working directory /tmp/ucrtbase

# More Information:
#    https://www.protondb.com/app/976730#SB4mUQAelE
#    https://github.com/ValveSoftware/Proton/issues/2907#issuecomment-1851096232

# Change this to Steam App compatdata folder where game is installed (Default Steam-Flatpak)
compatdata=~/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/compatdata

mkdir /tmp/ucrtbase && pushd /tmp/ucrtbase
wget --quiet --show-progress https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe
cabextract vc_redist.x64.exe && cabextract a10
unlink          $compatdata/976730/pfx/drive_c/windows/system32/ucrtbase.dll
cp ucrtbase.dll $compatdata/976730/pfx/drive_c/windows/system32
chmod u+w       $compatdata/976730/pfx/drive_c/windows/system32/ucrtbase.dll
popd && rm -rf /tmp/ucrtbase
echo steamfix-976730-linux-2 finished.
