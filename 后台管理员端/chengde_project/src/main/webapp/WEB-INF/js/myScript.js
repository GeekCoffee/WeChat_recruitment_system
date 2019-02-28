$(document).ready(init);
function init(){
    changeiframe2('http://localhost/blouseShop_system/info/toMerchantInfoShowPage');
}

function changeiframe2(src) {
    var myiframe_merchant = document.getElementById('myiframe_merchant');
    myiframe_merchant.src = src;
}
