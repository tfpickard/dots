#!/bin/bash
df -h | grep nvme0n1p3 | awk '{print $4}'
