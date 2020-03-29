function dedup_paths --description "Removes duplicate entries from \$PATH and \$fish_user_paths"
  set -l NEWPATH
  for p in $fish_user_paths
    if not contains $NEWPATH $p
      set NEWPATH $NEWPATH $p
    end
  end
  set fish_user_paths $NEWPATH

  set -l NEWPATH
  for p in $PATH
    if not contains $NEWPATH $p
      set NEWPATH $NEWPATH $p
    end
  end
  set PATH $NEWPATH
end
