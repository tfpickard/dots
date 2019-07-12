#!/bin/bash
df -h | grep scratch | awk '{print $4}'
