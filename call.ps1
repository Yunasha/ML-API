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

function Send-Texts {
    param (
        [string[]]$texts
    )

    $json = @{ texts = $texts } | ConvertTo-Json -Depth 2

    # Use curl.exe if on Windows and you want native curl, not Invoke-WebRequest
    curl.exe -X POST "http://127.0.0.1:8000/api/predict-mass" `
        -H "Content-Type: application/json" `
        -d $json

    # Write-Output $json
}


Send-Texts "Barang yg kualitasnya bagus banget", "knp yg datang pecah semua???", "gimana sih ni yg jual, barang kok gk lengkap???", "makasih banget bang, barang dah dateng tepat waktu!", "10 jam barang baru sampai... pdhl hrusnya 5 jam", "mas kurirnya ternyata dtng lebih cepet"