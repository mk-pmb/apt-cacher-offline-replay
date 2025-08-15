#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-
set -o pipefail -o errexit
ORIG_FD="$(ls -l -- /proc/$$/fd)"
LOGDIR='/tmp/apt-intercept'
mkdir --parents -- "$LOGDIR"
MTHD="$(basename -- "$0")"
DUMP="$LOGDIR/$MTHD.$(printf '%(%y%m%d-%H%M%S)T' -1).$$.log"
exec 5>"$DUMP"
chown :adm -- "$LOGDIR" "$DUMP"
chmod g+rw -- "$LOGDIR" "$DUMP"
( echo "Invoked as '$0' in '$PWD'"
  echo -n "with $# arguments"
  [ "$#" == 0 ] || printf -- ' ‹%s›' "$@"
  echo
  echo 'with file descriptors:'
  echo "$ORIG_FD"
  echo
) >&5
TEE='stdbuf -i0 -o0 -e0 tee --'
$TEE >(sed -ure 's~^~i|~' >&5) |
  "$0".orig 2> >($TEE >(sed -ure 's~^~e|~' >&5) >&2) |
  $TEE >(sed -ure 's~^~o|~' >&5)
