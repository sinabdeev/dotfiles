asdf-version() {
  if ! command asdf 2>/dev/null; then
    return
  fi
  asdf current $1 | awk '{print $1}' | sed "s/^/ ${1}-/"
}
ruby-version() {
  asdf-version ruby
}
node-version() {
  asdf-version nodejs
}
git-change-summary() {
  if ! command git rev-parse 2>/dev/null; then
    return
  fi
  changes=$(git status --porcelain | head -1 2>/dev/null)
  if [[ ! -z "$changes" ]]; then
    echo " %F{red}✗%f"
  else
    echo " %F{green}✔%f"
  fi
}
git-info() {
  if ! command git rev-parse 2> /dev/null; then
    return
  fi
  ref=$(command git symbolic-ref HEAD 2>/dev/null)
  if [[ -n "$ref" ]]; then
    echo " on %F{magenta}${ref#refs/heads/}%f$(git-change-summary)"
  fi
}
setopt PROMPT_SUBST
PROMPT='%F{blue}%M%f in %F{green}%~%f$(git-info)
%F{yellow}$%f '
RPROMPT='%F{red}$(node-version),$(ruby-version)'
