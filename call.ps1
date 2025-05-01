function Send-API {
    param (
        [string]$cmd,
        [string]$json
    )

    # Use curl.exe if on Windows and you want native curl, not Invoke-WebRequest
    curl.exe -X POST "http://127.0.0.1:8000/api/$cmd" `
        -H "Content-Type: application/json" `
        -d "$json"
}

Send-API predict '
    {
        "text": "produk berkualitas, boleh beli lagi"
    }
'