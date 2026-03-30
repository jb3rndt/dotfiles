#!/bin/sh
# Detect and run package manager install
repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"

# Detect package manager and run install if lock file exists
if [[ -f "yarn.lock" ]]; then
	echo "📦 Running yarn install..."
	yarn install
elif [[ -f "pnpm-lock.yaml" ]]; then
	echo "📦 Running pnpm install..."
	pnpm install
elif [[ -f "bun.lockb" ]]; then
	echo "📦 Running bun install..."
	bun install
elif [[ -f "package-lock.json" ]]; then
	echo "📦 Running npm install..."
	npm install
elif [[ -f "package.json" ]]; then
	echo "📦 Running npm install (no lock file found)..."
	npm install
fi
