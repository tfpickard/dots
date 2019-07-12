#!/bin/bash
df -h | grep main | awk '{print $4}'
