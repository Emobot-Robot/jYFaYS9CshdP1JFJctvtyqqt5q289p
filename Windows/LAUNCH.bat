@echo off
setlocal

cd %~dp0
cd ..
set ABSOLUTE_PATH_TO_WORKING_FOLDER=%cd%

call venv\Scripts\activate

set LABEL_STUDIO_LOCAL_FILES_SERVING_ENABLED=true
set LABEL_STUDIO_LOCAL_FILES_DOCUMENT_ROOT=%ABSOLUTE_PATH_TO_WORKING_FOLDER%

label-studio
