function Send-API {
    param (
        [string]$cmd,
        [string]$json
    )

    curl.exe -X POST "http://127.0.0.1:8000/api/$cmd" `
        -H "Content-Type: application/json" `
        -d "$json"
}

function Send-Texts {
    param (
        [string[]]$texts
    )

    $json = @{ texts = $texts } | ConvertTo-Json -Depth 2

    curl.exe -X POST "http://127.0.0.1:8000/api/predict-mass" `
        -H "Content-Type: application/json" `
        -d $json

}


Send-Texts `
"Gokil banget barangnya, bener2 nggak nyesel beli!",
"Asli kecewa, kiriman telat parah bro!",
"Mantul sih ini, kualitasnya di atas ekspektasi.",
"Barangnya zonk, beda jauh ama foto!",
"Top markotop, seller ramah dan fast respon!",
"Parah sih ini, baru dipake sehari udah rusak.",
"Worth it lah buat harga segini.",
"Ngarep dapet bagus, eh malah dapet cacat.",
"Udah murah, dapet bonus lagi. Cinta bgt!",
"Ngga rekomen deh, mending cari yg lain.",
"Keren abis! Fix langganan di toko ini.",
"Casing-nya ringkih banget, kaya mainan.",
"Sesuai deskripsi, ngga ada drama. Sip!",
"Asli zonk, packing-nya ampas banget.",
"Fast shipping, barang oke punya!",
"Udah nunggu lama, datengnya malah salah barang.",
"Pokoknya puas banget! Thank you seller~",
"Barang second kali ini mah, padahal katanya baru.",
"Mevvah banget, cocok buat hadiah!",
"Layar retak pas nyampe, sedih akutu",
"Pelayanannya juara, sabar ngadepin customer cerewet.",
"Jelek bgt sumpah, ngga bakal beli lagi.",
"Kualitas premium, padahal harga kaki lima!",
"Mau nangis liat barangnya, busuk bgt.",
"Udah repeat order berkali2, ngga pernah zonk.",
"Barang ngga sesuai, seller-nya slow respon pula.",
"Hoki dapet yang bagus, padahal banyak review jelek.",
"Cocok banget buat daily use, tahan banting!",
"Masa iya sih barang kayak gini dijual? LOL.",
"Love it! Design-nya lucu bgt.",
"Nyesel sumpah, duit ilang percuma.",
"Best buy bulan ini sih ini!",
"Pecah pas nyampe, pengemasan asal2an.",
"Enak dipake, nyaman, ga bikin ribet.",
"Ga bisa dipake sama sekali, nyesel pol.",
"Barang ori, bukan kaleng-kaleng!",
"Fake product! Padahal katanya ori.",
"Fix deh ini favorit baru gue.",
"Harga mahal, kualitas receh.",
"Tiap hari dipake terus, ga bosen.",
"Udah rusak padahal baru seminggu.",
"Ternyata warnanya lebih cakep aslinya.",
"Nggak worth it sama sekali, sumpah dah.",
"Simple, elegan, sesuai sama style gue.",
"Datengnya lama, padahal udah bayar ekspedisi cepat.",
"Barang mantap, bonusnya banyak!",
"Kecewa berat, ukuran ngga sesuai.",
"Produknya wangi, nyaman banget dipake!",
"Baru buka udah copot bagian-bagiannya.",
"Langsung jatuh cinta pas unboxing.",
"Nggak bakal beli lagi, kapok!"