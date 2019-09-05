#!/usr/bin/env bash

alias artisan="php artisan"
alias migrate="php artisan migrate"

alias phpunit="vendor/bin/phpunit"
alias pf="vendor/bin/phpunit --filter "

alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias wip="git add . && git commit -m '** Work in progress **'"
#alias nah="git reset --hard && git clean -df"
#alias p="phpunit"
