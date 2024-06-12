@echo off
setlocal

rem Check for Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
   rem Check for Python 3
   python3 --version >nul 2>&1
   if %errorlevel% neq 0 (
      echo Impossible de trouver Python sur votre ordinateur. Assurez-vous d'installer Python et de l'ajouter au PATH puis réessayez.
      exit /b
   ) else (
      set PYTHON_CMD=python3
   )
) else (
   set PYTHON_CMD=python
)

cd %~dp0
cd ..
set ABSOLUTE_PATH_TO_WORKING_FOLDER=%cd%

%PYTHON_CMD% -m venv venv
call venv\Scripts\activate
%PYTHON_CMD% -m pip install -U pip
%PYTHON_CMD% -m pip install wheel
%PYTHON_CMD% -m pip install label-studio

set LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
set LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=%ABSOLUTE_PATH_TO_WORKING_FOLDER%

label-studio
