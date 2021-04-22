export PATH=/usr/local/Cellar/openvpn/2.4.9/sbin:$PATH

# VPN
run_vpn() {
  cd /Users/dileep.reddy/udaan-vpn-client-master && sudo openvpn --config /Users/dileep.reddy/udaan-vpn-client-master/client.conf &
}
alias rvpn="run_vpn"

# Kubernetes
alias kprod='kubectl -n prod --context=sin0'
alias kdev="kubectl -n dev --context=cen0"
alias kpgrep="kubectl -n prod --context=sin0 get pods -o wide | grep"
alias kdgrep="kubectl -n dev --context=cen0 get pods -o wide | grep"
alias zcat="cat ~/.zprofile"
kpgrepe() {
 kpgrep $1 | grep -v "Evicted"
}
kpja() {
  kprod create job --from=cronjob/$1 $1-adhoc
}
kpjad() {
 kprod delete job $1-adhoc
}
login_prod() {
  kubectl -n prod --context=sin0 exec --stdin --tty $1 -- /bin/bash
}
login_dev() {
  kubectl -n dev --context=cen0 exec --stdin --tty $1 -- /bin/bash
}
alias ldev="login_dev"
alias lprod="login_prod"

# Git
gdp() {
  git commit -m "[$1] #deploy-to-prod" --allow-empty
}
alias gb="git branch | grep \"*\""
alias gs="git status"
alias gpo='git push origin "$(git symbolic-ref --short HEAD)"'
alias gpod="git push origin --delete"
alias gpro="git pull --rebase origin"
## test functions
getGitWebUrl() {
    url=$(git remote get-url origin | sed -Ee 's/\.git$//g' | tr -d '\r\n')
    [[ "$url" =~ ^git@ ]] && url=$(echo $url | sed -Ee 's/^git@([^\/]+):/https:\/\/\1\//g') || true
    echo "$url" | tr -d '\r\n'
}
# Get the git web url to point to the specified module being deployed
getGitVersionedUrl() {
    url="$(getGitWebUrl)/tree/$(git log -1 --pretty=format:'%h')"
    [ ! -z "$MODULE" ] && url="$url/$MODULE" || true
    echo -n "$url"
}
# Get the repository name of this project
getGitRepoName() {
    getGitWebUrl | sed -Ee 's/.+\/([^\/]+)(\.git)?$/\1/g' | tr -d '\r\n'
}
#git ignore apply
gia(){
  git rm -r --cached .
  git add .
}


#bash aliases
alias zs="source ~/.zprofile"
alias zv="vi ~/.zprofile"

# Android app setup
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export PATH=$PATH:$GOPATH/bin

# node version manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
