window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const value_result = inputValue * 0.1;       
    addTaxDom.innerHTML = (Math.floor(value_result));           
    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = (Math.floor(inputValue - value_result));
  })
  });
  const inputValue = priceInput.value;
  const value_result = inputValue * 0.1;
  ProfitDom.innerHTML = (Math.floor(inputValue - value_result));