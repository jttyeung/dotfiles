#!/bin/bash

# Target the macOS Terminal preference plist file
TERMINAL_PLIST="$HOME/Library/Preferences/com.apple.Terminal.plist"

# 1. Read the user's active/default Terminal profile name
DEFAULT_PROFILE=$(defaults read com.apple.Terminal "Default Window Settings" 2>/dev/null || echo "Basic")

echo "Configuring macOS Terminal profile '$DEFAULT_PROFILE' to use Option as Meta..."

# 2. Inject the 'useOptionAsMetaKey' boolean key directly into the active dictionary block
/usr/libexec/PlistBuddy -c "Set :'Window Settings':'$DEFAULT_PROFILE':useOptionAsMetaKey true" "$TERMINAL_PLIST" 2>/dev/null || \
/usr/libexec/PlistBuddy -c "Add :'Window Settings':'$DEFAULT_PROFILE':useOptionAsMetaKey bool true" "$TERMINAL_PLIST"

# 3. Safely do the same for standard backup defaults so they stick across theme profiles
for profile in "Basic" "Pro" "New Girl" "Homebrew"; do
    /usr/libexec/PlistBuddy -c "Set :'Window Settings':'$profile':useOptionAsMetaKey true" "$TERMINAL_PLIST" 2>/dev/null || \
    /usr/libexec/PlistBuddy -c "Add :'Window Settings':'$profile':useOptionAsMetaKey bool true" "$TERMINAL_PLIST"
done

# 4. Clear the macOS cached preference daemon so changes take place immediately
killall cfprefsd

# Nerd Font so sessionx / lsd icons render in Terminal.app
osascript -e 'tell application "Terminal" to set font name of settings set "'"$DEFAULT_PROFILE"'" to "HackNFM-Regular"' \
          -e 'tell application "Terminal" to set font size of settings set "'"$DEFAULT_PROFILE"'" to 13' 2>/dev/null
