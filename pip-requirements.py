import os
import ast
import requests

def get_imports(file_path):
    try:
        with open(file_path, 'r') as file:
            tree = ast.parse(file.read(), filename=file_path)
            imports = set()
            for node in ast.walk(tree):
                if isinstance(node, ast.Import):
                    for alias in node.names:
                        imports.add(alias.name)
                elif isinstance(node, ast.ImportFrom):
                    imports.add(node.module)
            return imports
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
        return set()

def find_python_files(folder):
    python_files = []
    for root, dirs, files in os.walk(folder):
        for file in files:
            if file.endswith('.py'):
                python_files.append(os.path.join(root, file))
    return python_files

def check_pip_installable(package_name):
    try:
        response = requests.get(f"https://pypi.org/pypi/{package_name}/json")
        response.raise_for_status()
        return True
    except requests.HTTPError:
        return False

def main(folder):
    python_files = find_python_files(folder)
    all_imports = set()
    for file in python_files:
        imports = get_imports(file)
        all_imports.update(imports)
    
    installable_imports = set()
    for package in all_imports:
        if check_pip_installable(package):
            installable_imports.add(package)
    
    with open('requirements.txt', 'w') as req_file:
        for package in installable_imports:
            req_file.write(f"{package}\n")

    print("Requirements successfully written to requirements.txt")

if __name__ == "__main__":
    folder = "."
    main(folder)
