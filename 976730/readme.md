# Halo: The Master Chief Collection

### 976730-linux-1 `No Sign-In Screen`
- Force the use of a specific Steam Play compatability tool `Proton 8.0-5`
- Launch game, sign-in with your preferred Microsoft account.
- Once signed in, exit the game. Switch to a higher version of compatability tool.

### 976730-linux-2 `Game Error on Co-op windows/Linux`
- Triggers when Linux and Windows clients play together
- Cause is reportedly due to `/pfx/drive_c/windows/system32/ucrtbase.dll` being wrong version?
- Fix: [Bash Script](./steamfix-976730-linux-2.sh) Download library from Microsoft place it in app compatdata
