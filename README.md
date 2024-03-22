# pip-requirements
A programme that scans the imports of Python files in a directory and all subdirectories therein for Python modules that can be installed via pip and then writes them to a requirements.txt file.

## Pre-Installation

Since `pip search` is no longer supported, PyPi is searched for pip modules using request. This means that requests must be installed in advance via `pip` in order to execute the code.

```
pip install requests
```

## Usage

You can run it with:

```
python pip-requirements.py
```

## Customization

You can change the path:

```
if __name__ == "__main__":
    folder = "."
    main(folder)
```

The path `.` means that the current directory is used. The current directory is the path where the `pip-requirements.py` file is located. 
