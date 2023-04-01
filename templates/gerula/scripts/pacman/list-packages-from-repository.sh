#!/bin/bash
# List packages from a particular repostiroy. Usage: command repo_name

comm -1 -2 <(pacman -Q|awk '{print $1}'|sort) \
   <(pacman -Sl $1 | awk '{print $2}'|sort)
