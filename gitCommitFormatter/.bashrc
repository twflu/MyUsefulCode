#!/bin/bash
alias cdc='cd /Users/twer/Documents/Code/DjangoCode/'
alias cdo='cd /Users/twer/Documents/Code/NeighborhoodAssistant/'
alias gpr='git pull --rebase'
alias cdo='cd /Users/twer/Documents/Code/NeighborhoodAssistant/'
alias ll='ls -l'
alias l='ls'
alias gl='git log --oneline'
alias c='clear'
alias st='git status'
alias gs='git status'
alias pt='cd /Users/twer/WebstormProjects/PairTimer'
alias sf='cd /Users/twer/Documents/ShunFeng/shunfeng'
export PATH=/usr/local/mysql/bin/:$PATH
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/ 

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s '/Users/twer/.gvm/bin/gvm-init.sh' ]] && source '/Users/twer/.gvm/bin/gvm-init.sh'


pairName=""
storyId=""
commitMsg=""

function ci()
{
    if [ -n "$pairName" ] 
    then 
        echo -e "Please enter your pair(or press enter to use \x1b[00;32m"$pairName"\x1b[00m):"  
        read tmpPairName
        if [ -n "$tmpPairName" ]
        then 
            pairName=$tmpPairName
        fi
    else
        echo -e "Please enter your name:" 
        read pairName 
    fi 

    if [ -n "$storyId" ]
    then
        echo -e "Please enter your story id(or press enter to use \x1b[00;32m"$storyId"\x1b[00m):"
        read tmpStoryId
        if [ -n "$tmpStoryId" ]
        then
            storyId=$tmpStoryId
        fi
    else
        echo -e "Please enter your story id:"
        read storyId
    fi
    
    echo -e "Please enter your commit message:" 
    read commitMsg

    local finalCommitMsg="[#$storyId][$pairName] - $commitMsg" 
    echo -e "Commit message is:\x1b[00;32m"$finalCommitMsg"\x1b[00m"
    git commit -m "$finalCommitMsg"
}
