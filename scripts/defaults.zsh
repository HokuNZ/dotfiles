# Sets macOS defaults

# # Kill apps that are updateds
# osascript -e 'quit app "Safari"'

# # Apply defaults
# # Note: Safari settings require "Full Disk Access" for Terminal in
# # System Settings > Privacy & Security > Full Disk Access
# echo "ℹ️  If Safari settings fail, grant Terminal 'Full Disk Access' in System Settings"
# if ! apply-user-defaults apps/system/user-defaults.yaml --verbose; then
#   echo ""
#   echo "⚠️  Some defaults failed to apply."
#   echo "   Safari settings require 'Full Disk Access' for Terminal:"
#   echo "   System Settings > Privacy & Security > Full Disk Access"
#   echo "   Add Terminal.app, then re-run 'dot'"
#   echo ""
# fi

# Populate dock
# Adds apps if not already present (preserves user's manual additions)

add_dock_app() {
  local app_path="$1"
  [[ ! -d "$app_path" ]] && return  # Skip if app not installed

  local current=$(defaults read com.apple.dock persistent-apps 2>/dev/null)
  [[ "$current" == *"$app_path"* ]] && return  # Skip if already in dock

  defaults write com.apple.dock persistent-apps -array-add \
    "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app_path</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# add_dock_app "/Applications/Safari.app"
# add_dock_app "/Applications/Google Chrome.app"
add_dock_app "/Applications/Slack.app"
add_dock_app "/Applications/Notion.app"
add_dock_app "/Applications/Claude.app"
add_dock_app "/Applications/Canva.app"
# add_dock_app "/Applications/1Password.app"
# add_dock_app "/System/Applications/Utilities/Terminal.app"
# add_dock_app "/System/Applications/Utilities/Activity Monitor.app"
# add_dock_app "/System/Applications/System Settings.app"

# Reset
killall Dock
killall Finder
# killall Calendar 2>/dev/null || true

# open -a Safari