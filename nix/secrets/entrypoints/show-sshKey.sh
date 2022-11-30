#!/usr/bin/env bash
if [[ $1 == *"@"* ]]; then
  HOST="$(cut -d '@' -f 2 <<<"$1")"
  USER="$(cut -d '@' -f 1 <<<"$1")"
else
  HOST="${1:-$HOST}"
  USER="${2:-$USER}"
fi

if [[ $USER == "root" ]]; then
  cmd="cat /etc/ssh/ssh_host_ed25519_key.pub"
else
  cmd="cat ~/.ssh/id_ed25519.pub"
fi
# shellcheck disable=all
ssh "$USER@$HOST" $cmd
