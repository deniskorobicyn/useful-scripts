#!/bin/bash

for pid in $(ps -ef | awk '{print $2}'); do
    if [ -f /proc/$pid/smaps ]; then
            echo "* Mem usage for PID $pid"
            echo "-- Size:"
            cat /proc/$pid/smaps | grep -m 1 -e ^Size: | awk '{print $2}'
            echo "-- Rss:"
            cat /proc/$pid/smaps | grep -m 1 -e ^Rss: | awk '{print $2}'
            echo "-- Pss:"
            cat /proc/$pid/smaps | grep -m 1 -e ^Pss: | awk '{print $2}'
            echo "Shared Clean"
            cat /proc/$pid/smaps | grep -m 1 -e '^Shared_Clean:' | awk '{print $2}'
            echo "Shared Dirty"
            cat /proc/$pid/smaps | grep -m 1 -e '^Shared Dirty:' | awk '{print $2}'
    fi
done 
