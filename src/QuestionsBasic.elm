module QuestionsBasic exposing (questions)

import Question exposing (Answer, Question)


questions =
    [ Question
        "how to initialize a Git repository (in an existing directory)?"
        "$ >"
        [ "git init" ]
    , Question
        "how to track file.txt?"
        "$ >"
        [ "git add file.txt" ]
    , Question
        "how to check files status?"
        "staged and unstaged"
        [ "git status" ]
    , Question
        "how to stage file.txt?"
        "$ >"
        [ "git add file.txt" ]
    , Question
        "how to get compact files status?"
        "staged and unstaged, compact i.e short"
        [ "git status -s"
        , "git status --short"
        ]
    , Question
        "in which file are declared untracked file pattern?"
        "things you want to ignore"
        [ ".gitignore" ]
    , Question
        "how to ignore all files with 'a' extention"
        "like in my-file.a"
        [ "*.a" ]
    , Question
        "how to not ignore lib.a if .gitignore already has *.a"
        "logical not in Python"
        [ "!lib.a" ]
    , Question
        "how to ignore the TODO file in the project root?"
        "and nothing else"
        [ "/TODO" ]
    , Question
        "how to ignore all files in any directory named build?"
        "$ >"
        [ "build/" ]
    , Question
        "how to ignore txt files in the doc/ folder but not in its subfolder"
        "$ >"
        [ "doc/*.txt" ]
    , Question
        "how to ignore all pdf files in the doc/ directory and any of its subdirectories"
        "$ >"
        [ "doc/**/*.pdf" ]
    , Question
        "how to know what has been staged and will go in the next commit?"
        "think different"
        [ "git diff --staged"
        , "git diff --cached"
        ]
    , Question
        "how to know what you have changed but not yet staged?"
        "think different"
        [ "git diff" ]
    , Question
        "how to commit your changes?"
        "$ >"
        [ "git commit" ]
    , Question
        "how to stage and commit tracked files?"
        "think automatic"
        [ "git commit -a" ]
    , Question
        "how to untrack file.txt while keeping it in your working directory?"
        "remove it from the index"
        [ "git rm --cached file.txt" ]
    , Question
        "how to rename an already tracked file.from to file.to?"
        "$ >"
        [ "git mv file.from file.to" ]
    , Question
        "how to view the commit history?"
        "$ >"
        [ "git log" ]
    , Question
        "how to view the commit history as well as the change introduced by each commit?"
        "a change is a patch"
        [ "git log -p"
        , "git log --patch"
        ]
    , Question
        "how to view commit history and limit logs entries to 3?"
        "$ >"
        [ "git log -3" ]
    , Question
        "how to view files modified by each commit in the history?"
        "some statistics"
        [ "git log --stat" ]
    , Question
        "how many occurrence of the string my-string in the commit history?"
        "$ >"
        [ "git log -S my-string" ]
    , Question
        "how to view commit history only for path/file.txt ?"
        "$ >"
        [ "git log -- path/file.txt" ]
    , Question
        "how to change the last commit?"
        "i.e. update commit message, stage files"
        [ "git commit --amend" ]
    , Question
        "how to unstage file.txt?"
        "reset to current commit"
        [ "git reset HEAD file.txt"
        , "git reset --mixed HEAD file.txt"
        ]
    , Question
        "how to undo unstage modifications to file.txt?"
        "dangerous"
        [ "git checkout file.txt" ]
    , Question
        "how to unstage file.txt?"
        "using restore"
        [ "git restore --staged file.txt" ]
    , Question
        "how to list the remotes?"
        "$ >"
        [ "git remote"
        , "git remote -v"
        ]
    , Question
        "how to list the remotes, ?"
        "with more details"
        [ "git remote -v" ]
    , Question
        "how to add a new remote repo named abc located at https://abc.git?"
        "$ >"
        [ "git remote add abc https://abc.git" ]
    , Question
        "how to fetch all informations from the remote called origin?"
        "$ >"
        [ "git fetch origin" ]
    , Question
        "what does git pull do?"
        "think a && b"
        [ "git fetch && git merge" ]
    , Question
        "how to push to the master branch of the remote origin?"
        "$ >"
        [ "git push origin master" ]
    , Question
        "how to see information of your remote called origin?"
        "show me the data"
        [ "git remote show origin" ]
    , Question
        "how to rename a remote called paul to mike?"
        "literally"
        [ "git remote rename paul mike" ]
    , Question
        "how to list tags?"
        "$ >"
        [ "git tag"
        , "git tag -l"
        , "git tag --list"
        ]
    , Question
        "how to list tags starting with v1?"
        "v1.0, v1.1, v1dev"
        [ "git tag -l v1*"
        , "git tag --list v1*"
        ]
    , Question
        "Name one type of tag?"
        "$ >"
        [ "lighweight"
        , "annotated"
        ]
    , Question
        "how to create the annotated tag v1.4 with the message 'hey'"
        "$ >"
        [ "git tag -a v1.4 -m 'hey'" ]
    , Question
        "how to create lighweight tag v1.4?"
        "$ >"
        [ "git tag v1.4" ]
    , Question
        "how to show information about the tag v1.4?"
        "$ >"
        [ "git tag show v1.4" ]
    , Question
        "how to tag the commit c12 to v1.4?"
        "annotated"
        [ "git tag -a v1.4 c12" ]
    , Question
        "how to push the tag v1.4 to origin?"
        "$ >"
        [ "git push origin v1.4" ]
    , Question
        "how to push all tags to origin?"
        "$ >"
        [ "git push origin --tags" ]
    , Question
        "how to delete tag v1.4?"
        "$ >"
        [ "git tag -d v1.4" ]
    , Question
        "how to delete the tag v1.4 on the remote origin?"
        "use refs"
        [ "git push origin :refs/tags/v1.4" ]
    , Question
        "how to delete the tag v1.4 on the remote origin?"
        "use delete"
        [ "git push origin --delete v1.4" ]
    , Question
        "how to check the code of v1.4?"
        "literally"
        [ "git checkout v1.4" ]
    , Question
        "how to create a branch abc from v1.4?"
        "use switch"
        [ "git switch -c abc v1.4" ]
    , Question
        "how to create a branch abc from v1.4?"
        "use checkout"
        [ "git checkout -b abc v1.4" ]
    , Question
        "how to create new branch my-branch?"
        "checkout won't cut it"
        [ "git branch my-branch" ]
    , Question
        "what the default name of the branch you are currently on?"
        "handy for merge conflicts"
        [ "HEAD" ]
    , Question
        "how to switch to branch abc?"
        "use checkout"
        [ "git checkout abc" ]
    , Question
        "how to switch to branch abc?"
        "use switch"
        [ "git switch abc" ]
    , Question
        "how to create branch abc and switch to it?"
        "use checkout"
        [ "git checkout -b abc" ]
    , Question
        "how to create branch abc and switch to it?"
        "use switch"
        [ "git switch -c abc"
        , "git switch --create abc"
        ]
    , Question
        "how to merge branch hotfix in your current?"
        "$ >"
        [ "git merge hotfix" ]
    , Question
        "how to delete the branch hotfix?"
        "locally"
        [ "git branch -d hotfix" ]
    , Question
        "how to list your local branches?"
        "$ >"
        [ "git branch" ]
    , Question
        "how to list branches and with last commits?"
        "$ >"
        [ "git branch -v" ]
    , Question
        "how to list merged branches?"
        "$ >"
        [ "git branch --merged" ]
    , Question
        "how to list not merged branches?"
        "$ >"
        [ "git branch --no-merged" ]
    , Question
        "how to rename branch asd to jkl?"
        "$ >"
        [ "git branch --move asd jkl" ]
    , Question
        "how to publish the branch abc to remote origin?"
        "... and track"
        [ "git push origin --set-upstream my-branch"
        , "git push origin -u abc"
        ]
    , Question
        "how to delete the branch abc on the remote origin?"
        "$ >"
        [ "git push origin --delete abc" ]
    , Question
        "how to list all branches local and remote?"
        "$ >"
        [ "git branch --all" ]
    , Question
        "how to get information of remote branches on the origin remote?"
        "show the data"
        [ "git remote show origin" ]
    , Question
        "how to push branch abc to remote origin?"
        "$ >"
        [ "git push origin abc" ]
    , Question
        "how to push from branch abc to jkl on remote origin?"
        "$ >"
        [ "git push origin abc:jkl" ]
    , Question
        "how to push from abc to jkl on remote origin and track?"
        "$ >"
        [ "git push origin -u abc:jkl" ]
    , Question
        "how to create branch abc from jkl on remote origin?"
        "$ >"
        [ "git checkout -b abc origin/jkl" ]
    , Question
        "how to make your current branch track orign/jkl?"
        "$ >"
        [ "git branch -u origin/jkl"
        , "git branch --set-upstream origin/jkl"
        ]
    , Question
        "how to see branches tracking data?"
        "$ >"
        [ "git branch -vv" ]
    , Question
        "how to rebase your current branch on master?"
        "$ >"
        [ "git rebase master" ]
    , Question
        "how to check for whitespaces error before commit?"
        "$ >"
        [ "git diff --check" ]
    , Question
        "how to partially stage changes in the same file?"
        "$ >"
        [ "git add --patch"
        , "git add -p"
        ]
    , Question
        "how to display the commits in origin/develop that are not in my-branch?"
        "$ >"
        [ "git log my-branch..origin/develop" ]
    , Question
        "how te see commit history excluding merge?"
        "$ >"
        [ "git log --no-merges" ]
    , Question
        "how to compare commits between my-branch(behind) and origin/develop(ahead) excluding merges?"
        "$ >"
        [ "git log --no-merges my-branch..origin/develop" ]
    , Question
        "how to merge my-branch squashing all commits into one?"
        "$ >"
        [ "git merge --squash my-branch" ]
    , Question
        "how to check the work my-branch has introduced since its common ancestor with master?"
        "$ >"
        [ "git diff master...my-branch" ]
    , Question
        "how to pull a single commit e43a6 into your current branch?"
        "$ >"
        [ "git cherry-pick e43a6" ]
    , Question
        "how to generate a build number from master?"
        "$ >"
        [ "git describe master" ]
    , Question
        "how to inspect commit 2bdf86"
        "$ >"
        [ "git show 2bdf86" ]
    , Question
        "how to inspect branch my-branch?"
        "$ >"
        [ "git show my-branch" ]
    , Question
        "how to see a logs of HEAD history?"
        "$ >"
        [ "git reflog" ]
    ]
