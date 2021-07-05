function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const fee = priceInput.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const SalesProfit = priceInput.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${SalesProfit}`;
  });
};

window.addEventListener('load', price);
