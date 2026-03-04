#!/bin/bash

# To use it:
#   chmod +x setup.sh
#   ./setup.sh

echo "Please upload .pdf file(s) to the current working directory:"
echo "  $(pwd)"
echo ""

read -p "When you uploaded the file(s), press Enter: "

# Find all PDF files in the current directory
pdf_files=(*.pdf)

# Check if any PDF files exist
if [[ ! -e "${pdf_files[0]}" ]]; then
    echo "Error: No .pdf files found in $(pwd)"
    exit 1
fi

pdf_count=${#pdf_files[@]}
echo "Found $pdf_count PDF file(s):"
for f in "${pdf_files[@]}"; do
    echo "  - $f"
done
echo ""

# Create chunks directory if it doesn't exist
mkdir -p ./chunks

# Process each PDF file
for filename in "${pdf_files[@]}"; do
    # Extract base filename without .pdf extension
    basename="${filename%.pdf}"

    echo "Processing '$filename'..."

    # Convert PDF to text
    echo "  Converting PDF to text..."
    pdftotext -layout "./$filename" "./${basename}.txt"

    if [[ $? -ne 0 ]]; then
        echo "  Error: pdftotext failed for $filename"
        continue
    fi

    # Split the text file into chunks of 2000 lines
    echo "  Splitting text file into chunks..."
    split -l 1000 -d -a 3 -e --verbose "./${basename}.txt" "./chunks/${basename}_"

    if [[ $? -ne 0 ]]; then
        echo "  Error: split failed for $filename"
        continue
    fi

    echo "  Done: ./${basename}.txt -> ./chunks/${basename}_*"
    echo ""
done

echo "All files processed."

# Install the ocp skill locally
if [[ -f "./skill-repo-detector-ocp.skill" ]]; then
    echo "Installing ocp skill..."
    gemini skills install ./skill-repo-detector-ocp.skill --scope workspace --consent
    echo "Skill installed. Please remember to run '/skills reload' in your Gemini CLI session."
else
    echo "Warning: skill-repo-detector-ocp.skill not found. Skipping skill installation."
fi
