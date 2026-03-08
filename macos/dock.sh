#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/System/Applications/Photos.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Obsidian.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Discord.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Apple Music.app"

killall Dock
