@echo off

REM Funktion, um Importe aus Python-Dateien zu extrahieren
:get_imports
for /r %cd% %%i in (*.py) do (
    findstr /R /C:"^import [a-zA-Z0-9_.]*" /C:"^from [a-zA-Z0-9_.]* import [a-zA-Z0-9_]*" "%%i" | findstr /R /C:"[a-zA-Z0-9_.]*" >> imports.txt
)
sort /unique imports.txt > imports_sorted.txt
del imports.txt
move imports_sorted.txt imports.txt

REM Funktion, um zu überprüfen, ob ein Paket über pip installierbar ist
:check_pip_installable
set package_name=%1
curl -s --head --fail "https://pypi.org/pypi/%package_name%/json"
if %errorlevel% == 0 (
    exit /b 0
) else (
    exit /b 1
)

REM Hauptfunktion
:main
call :get_imports

REM Überprüfe jedes Paket und schreibe installierbare in requirements.txt
(for /f "tokens=*" %%p in (imports.txt) do (
    call :check_pip_installable %%p
    if not errorlevel 1 (
        echo %%p>>requirements.txt
    )
))

echo Requirements successfully written to requirements.txt
