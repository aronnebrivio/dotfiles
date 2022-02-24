function dedup_paths --description "Removes duplicate entries from \$PATH and \$fish_user_paths"
  set -x fish_user_paths (printf '%s\n' $fish_user_paths | sort -u)
  set -x PATH (printf '%s\n' $PATH | sort -u)
end
