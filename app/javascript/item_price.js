window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
if (!priceInput){ return false;}
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;  //value属性を指定し、input要素から実際に入力した金額の値を取得
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1));
  })
});