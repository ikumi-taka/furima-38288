window.addEventListener("load", () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;  //value属性を指定し、input要素から実際に入力した金額の値を取得
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfitDom = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  addProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});