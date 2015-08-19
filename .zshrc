source ~/.antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git

antigen theme kphoen

antigen apply

# export PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"

# Monkey patch oh-my-zsh#git_prompt_info so we get the branch
# name but don't call `git status` to see if our working tree
# is dirty. `git status` is slow in large repos
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2>/dev/null)
    #echo "$ref"
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# You may need to manually set your language environment
export TERM=xterm-256color
export LANG=en_US.UTF-8

export EDITOR='vim'

# Aliases
if [[ -a ~/.zshrc-aliases ]]; then
    source ~/.zshrc-aliases
fi

# Settings for work
if [[ -a ~/.zshrc-work ]]; then
    source ~/.zshrc-work
fi

# Tokens and things like that
if [[ -a ~/.zshrc-secrets ]]; then
    source ~/.zshrc-secrets
fi

function git-sync_()
{
    emulate ksh
    usage="git-sync branch"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    echo "pushd `git rev-parse --show-toplevel`";
    pushd `git rev-parse --show-toplevel`;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git remote prune origin";
    git remote prune origin;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git checkout $1";
    git checkout "$1";
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git pull";
    git pull;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git submodule init";
    git submodule init;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git submodule update";
    git submodule update;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "popd"; popd;
}
alias gits=git-sync_
