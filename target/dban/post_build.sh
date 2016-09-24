#!/bin/sh
TARGET_DIR="$1"

# We don't want to use "predictable" interface names
rm -f "$TARGET_DIR/lib/udev/rules.d/80-net-name-slot.rules"

if [ -n "$WORKSPACE" ]; then
	GIT_TAG=$(git -C "$WORKSPACE/git" describe --tags --exact-match 2>/dev/null)
	if [ -z "$GIT_TAG" -o "${GIT_TAG%/*}" = "nightly" ]; then
		GIT_VERSION=$(git -C "$WORKSPACE/git" log -1 --date=format:"%Y%m%d" --pretty=format:"%cd-g%h")
		sed -i -e 's/^DBAN_VERSION=.*/DBAN_VERSION="'"$GIT_VERSION"'"/' "$TARGET_DIR/etc/version"
	fi
fi
