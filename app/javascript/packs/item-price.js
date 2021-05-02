window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const fee = inputValue*0.1
    addTaxDom.innerHTML = Math.floor(fee)

    const addProfitDom = document.getElementById("profit");
    const profit = inputValue-fee
    addProfitDom.innerHTML = Math.floor(profit)
  })
});
