## Open the current branch in browser
## ====================================
## Open the current repo & branch from the command line
## Use flags to navigate to other areas of the repo such as
## commits, branches, pull requests or issues.
## ====================================
## This is an adaptation of @jasonneylon's script.
## Source: http://jasonneylon.wordpress.com/2011/04/22/opening-github-in-your-browser-from-the-terminal/
## ====================================
## @usage: gh
## @usage: gh c
## @usage: gh pr branch-name
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
 
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
 
  if [ "$1" = "" ]; then ## default => code
    giturl=${giturl/\.git/\/tree/}
    giturl=$giturl$branch
    open $giturl
  elif [ "$1" = "h" ]; then ## h => help
    echo ""
    echo "========================================"
    echo "Did you know that 'gh' can be used as is?"
    echo "There are also some other options, listed below:"
    echo "    [h]                      => View help"
    echo "    [c]                      => View commits"
    echo "    [c {SHA}]                => View specific commit from commit SHA"
    echo "    [b]                      => View branches"
    echo "    [pr]                     => View current branch compared to master"
    echo "    [pr branch]              => View current branch compared to specified branch"
    echo "    [i]                      => View issues"
    echo "    [a]                      => View assigned issues (in dev)"
    echo "    [w]                      => View wiki"
    echo "    [s]                      => View settings"
    echo "    [p]                      => View pulse"
    echo "    [g]                      => View graphs"
    echo "    [n]                      => View network"
    echo "    [<filename.ext>]         => Open a file in it's current state in the current branch"
    echo "========================================"
    echo ""
  elif [ "$1" = "c" ]; then ## c => commits
    if [ "$2" ]; then
      giturl=${giturl/\.git/\/commit/$2}
    else
      giturl=${giturl/\.git/\/commits/}
      giturl=$giturl$branch
    fi
    open $giturl
  elif [ "$1" = "b" ]; then ## b => branches
    giturl=${giturl/\.git/\/branches}
    open $giturl
  elif [ "$1" = "pr" ]; then ## pr => pull requests
    if [[ -z "$2" ]]; then
      # if a branch has not been specified, compare with master
      giturl=${giturl/\.git/\/compare/$branch?expand=1}
    else
      # if a branch has been specified, compare with current branch
      giturl=${giturl/\.git/\/compare/$2...$branch?expand=1}
    fi
    open $giturl
  elif [ "$1" = "i" ]; then ## i => issues
    giturl=${giturl/\.git/\/issues}
    open $giturl
  # This would be incredibly useful when I have the time
  # elif [ "$1" = "a" ]; then ## a => assigned issues
  #   giturl=${giturl/\.git/\/issues/assigned/$github_user}
  #   open $giturl
  elif [ "$1" = "w" ]; then ## w => wiki
    giturl=${giturl/\.git/\/wiki}
    open $giturl
  elif [ "$1" = "s" ]; then ## w => settings
    giturl=${giturl/\.git/\/settings}
    open $giturl
  elif [ "$1" = "p" ]; then ## w => pulse
    giturl=${giturl/\.git/\/pulse}
    open $giturl
  elif [ "$1" = "g" ]; then ## w => graphs
    giturl=${giturl/\.git/\/graphs}
    open $giturl
  elif [ "$1" = "n" ]; then ## w => network
    giturl=${giturl/\.git/\/network}
    open $giturl
  elif [ -f "$1" ]; then ## w => <filename.ext>
    giturl=${giturl/\.git/\/blob/$branch/$1}
    open $giturl
  # elif [ "$1" = "files" ]; then ## w => files
  #   giturl=${giturl/\.git/\/network}
  #   open $giturl
  else
    echo ""
    echo "========================================"
    echo "That option is invalid."
    echo "Did you mean:"
    echo "    [h]                      => View help"
    echo "    [c]                      => View commits"
    echo "    [c {SHA}]                => View specific commit from commit SHA"
    echo "    [b]                      => View branches"
    echo "    [pr]                     => View current branch compared to master"
    echo "    [pr branch]              => View current branch compared to specified branch"
    echo "    [i]                      => View issues"
    echo "    [a]                      => View assigned issues (in dev)"
    echo "    [w]                      => View wiki"
    echo "    [s]                      => View settings"
    echo "    [p]                      => View pulse"
    echo "    [g]                      => View graphs"
    echo "    [n]                      => View network"
    echo "    [<filename.ext>]         => Open a file in it's current state in the current branch"
    echo "========================================"
    echo ""
  fi
}
