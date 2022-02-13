#!/bin/bash

bash components/$1.sh

if [ -f components/$1.sh ]; then
  bash components/$1.sh
else
  echo -e "\e[1;31mWrong Input\e[0m"
  echo -e "\e[1;33mAvailable Inputs - fronted|mongodb|catalogue|redis|user|cart|mysql|shipping|rabbitmq|payment|dispatch\e[om"
fi