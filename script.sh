URL="https://guvi.in"
HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
    echo "Success! HTTP Status Code: $HTTP_CODE"
else
    echo "Failure! HTTP Status Code: $HTTP_CODE"
fi

FILE_PATH="input.txt" # Replace with your file path
TEMP_FILE="temp_file.txt"

awk 'NR<5 || /welcome/ && NR>=5 {if (/welcome/) gsub(/give/, "learning"); print}' "$FILE_PATH" > "$TEMP_FILE"
mv "$TEMP_FILE" "$FILE_PATH"

echo "Text replacement completed in the file."
