#!/bin/bash
sensors | grep Tdie | awk '{print $2}' | cut -c 2-7
