#!/bin/sh
# Post-checkout git hook to copy environment files and run package manager install
# https://mskelton.dev/bytes/using-git-hooks-when-creating-worktrees

# Get the repository root
repo_root="$(git rev-parse --show-toplevel)"

# Only run when checking out a new worktree (indicated by null SHA)
if [[ "$1" == "0000000000000000000000000000000000000000" ]]; then
	echo "🔄 Copying environment files to new worktree..."

	# Find the original worktree (main checkout)
	main_worktree=$(git worktree list | head -n 1 | awk '{print $1}')

	# Copy .env.* and *.keystore files (preserving directory structure)
	find "$main_worktree" \( -path "*/node_modules/*" -o -path "*/dist/*" -o -path "*/.yarn/*" -o -path "*/.build/*" \) -prune -o \( -name ".env*" -o -name "*.keystore" \) -type f -print0 | while IFS= read -r -d '' file; do
		rel_path="${file#$main_worktree/}"
		mkdir -p "$repo_root/$(dirname "$rel_path")"
		cp -v "$file" "$repo_root/$rel_path" 2>/dev/null || true
	done

	# Copy .idea directory (excluding shelf folder)
	if [[ -d "$main_worktree/.idea" ]]; then
		rsync -av --exclude='shelf' "$main_worktree/.idea" "$repo_root/" 2>/dev/null || true
	fi

	echo "✅ Environment files copied"
fi
