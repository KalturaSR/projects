#!/bin/bash
echo "Starting local server at http://localhost:8080"
echo "Open: http://localhost:8080/chapters-slides-editor.html"
cd "$(dirname "$0")"
python3 -m http.server 8080
