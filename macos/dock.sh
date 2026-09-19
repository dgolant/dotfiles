#!/bin/sh

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/System/Applications/System Settings.app"
dockutil --no-restart --add "/Applications/Music.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Obsidian.app"

killall Dock
