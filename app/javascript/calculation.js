window.addEventListener('load', function(){
  const price = document.getElementById("item-price");
  let result1 = document.getElementById("add-tax-price");
  let result2 = document.getElementById("profit");
  price.addEventListener('input',function () {
      value_price = price.value
      result1 = value_price * 0.1;
      result2 = value_price * 0.9;
      document.getElementById("add-tax-price").innerHTML = result1;
      document.getElementById("profit").innerHTML = result2;
    })
  
})