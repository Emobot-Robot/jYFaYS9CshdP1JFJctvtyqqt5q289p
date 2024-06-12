#!/bin/bash

# Check for Python
if ! command -v python &> /dev/null
then
   # Check for Python 3
   if ! command -v python3 &> /dev/null
   then
      echo "Impossible de trouver Python sur votre ordinateur. Assurez-vous d'installer Python et de l'ajouter au PATH puis réessayez."
      exit 1
   else
      PYTHON_CMD=python3
   fi
else
   PYTHON_CMD=python
fi

ABSOLUTE_PATH_TO_WORKING_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

cd "$ABSOLUTE_PATH_TO_WORKING_FOLDER"

$PYTHON_CMD -m venv venv
source venv/bin/activate
$PYTHON_CMD -m pip install -U pip
$PYTHON_CMD -m pip install wheel
$PYTHON_CMD -m pip install label-studio

export LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
export LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT="$ABSOLUTE_PATH_TO_WORKING_FOLDER"

label-studio
