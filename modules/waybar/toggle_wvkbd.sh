#!/usr/bin/env bash

kbpid=$(pgrep "wvkbd")

echo $kbpid
# Ensure wvkbd is running; if not, start it
if [ -z "${kbpid}" ]; then
    echo not running
    wvkbd-mobintl &
else
    echo killing
    pkill wvkbd
fi


