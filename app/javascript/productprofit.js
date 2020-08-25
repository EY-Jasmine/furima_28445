$(document).on('turbolinks:load', function() { 

$(function(){
  $('#item-price').on('input', function(){ 
    const data = $('#item-price').val(); 
    const productProfit = Math.round(data * 0.9)  
    const fee = (data - productProfit) 
    $('#add-tax-price').html(fee) 
    $('#profit').html(productProfit)
    $('#profit').val(productProfit) 
    if(productProfit == '') {  
    $('#profit').html('');
    $('#add-tax-price').html('');
    }
  })
})

});