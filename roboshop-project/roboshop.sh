#!/bin/bash

# Individual scripts for each modules
# Individual scripts for all components wrapped in MakeFile

if [ -f components/$1.sh ]; then
  bash components/$1.sh
else
  echo -e "\e[1;31mInvalid Input\e[0m"
  echo -e "\e[1;33mValid inputs are -
            frontend|mongodb|catalogue|redis|user|cart|mysql|shipping|payment|rabbitmq|dispatch\e[0m"
fi

