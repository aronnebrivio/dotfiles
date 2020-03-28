function gflowpublish
	git checkout develop
    git push --tags
    git push
    git checkout master
    git push
    git checkout develop
end
