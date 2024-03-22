# pip-requirements
A programme that scans the imports of Python files in a directory and all subdirectories therein for Python modules that can be installed via pip and then writes them to a requirements.txt file.

You can choose if you want to run it with `Python`, with `Bash`, with `Shell` or in Windows with `Batch`.

## Pre-Installation

### Python (Windows or Linux)

Since `pip search` is no longer supported, PyPi is searched for pip modules using `requests`. This means that `requests` must be installed in advance via `pip` in order to execute the code.

```
pip install requests
```

### Bash / Shell (Linux)

Since `pip search` is no longer supported, PyPi is searched for pip modules using `curl`. This means that `curl` must be installed in advance via `apt` in order to execute the code.

```
sudo apt install curl
```

### Batch (Windows)

Since `pip search` is no longer supported, PyPi is searched for pip modules using `curl`. This means that `curl` must be installed manually in order to execute the code.

You can download and install curl for Windows [here](https://curl.se/windows/).

## Usage

### Python (Windows or Linux)

You can run it with:

```
python pip-requirements.py
```

### Bash (Linux)

You can run it with:

```
bash pip-requirements.bash
```

### Shell (Linux)

You can run it with:

```
sudo chmod +x pip-requirements.sh
./pip-requirements.sh
```

### Batch (Windows)

You can run it with:

```
pip-requirements.bat
```

## Customization

### Python (Windows or Linux)

You can change the path:

```
if __name__ == "__main__":
    folder = "."
    main(folder)
```

The path `.` means that the current directory is used. The current directory is the path where the `pip-requirements.py` file is located. 

### Bash (Linux)

You can change the path from


```
function get_imports {
    find /path/to/directory -name '*.py' -exec grep -E '^(import|from) [^ ]+' {} \; | sed -E 's/^(import|from) ([^ ]+).*/\2/' | sort -u > imports.txt
}
```

to

```
function get_imports {
    find /path/to/directory -name '*.py' -exec grep -E '^(import|from) [^ ]+' {} \; | sed -E 's/^(import|from) ([^ ]+).*/\2/' | sort -u > imports.txt
}
```

The path `.` means that the current directory is used. The current directory is the path where the `pip-requirements.bash` file is located. 

### Shell (Linux)

You can change the path from

```
get_imports() {
    find /path/to/directory -name '*.py' -exec grep -E '^(import|from) [^ ]+' {} \; | sed -E 's/^(import|from) ([^ ]+).*/\2/' | sort -u > imports.txt
}
```

to

```
get_imports() {
    find /path/to/directory -name '*.py' -exec grep -E '^(import|from) [^ ]+' {} \; | sed -E 's/^(import|from) ([^ ]+).*/\2/' | sort -u > imports.txt
}
```

The path `.` means that the current directory is used. The current directory is the path where the `pip-requirements.sh` file is located. 

### Batch (Windows)

You can change the path from

```
for /r %cd% %%i in (*.py) do (
```

to

```
for /r "C:\path\to\directory" %%i in (*.py) do (
```

The path `.` means that the current directory is used. The current directory is the path where the `pip-requirements.bat` file is located. 
