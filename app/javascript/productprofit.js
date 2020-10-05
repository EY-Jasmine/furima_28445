window.addEventListener('load', function() {
  const price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  price.addEventListener('input',function(){
    add_tax_price.innerHTML = (price.value * 0.1).toLocaleString();
    profit.innerHTML = (price.value - (price.value * 0.1)).toString().replace(/(\d)(?=(\d{3})+$)/g , '$1,');
  })
})