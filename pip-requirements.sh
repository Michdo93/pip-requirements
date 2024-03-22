#!/bin/sh

get_imports() {
    find . -name '*.py' -exec grep -E '^(import|from) [^ ]+' {} \; | sed -E 's/^(import|from) ([^ ]+).*/\2/' | sort -u > imports.txt
}

check_pip_installable() {
    package_name=$1
    if curl --output /dev/null --silent --head --fail "https://pypi.org/pypi/$package_name/json"; then
        return 0
    else
        return 1
    fi
}

main() {
    get_imports
    while IFS= read -r package; do
        if check_pip_installable "$package"; then
            echo "$package" >> requirements.txt
        fi
    done < imports.txt
    rm imports.txt
    echo "Requirements successfully written to requirements.txt"
}

main
