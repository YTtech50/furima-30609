function profitTax (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const Tax = inputValue * 0.1
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(Tax)
    const Profit = document.getElementById("profit")
    Profit.innerHTML = Math.floor(inputValue - Tax)
  });
}
  
window.addEventListener('load', profitTax);