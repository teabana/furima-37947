window.addEventListener('load', () => {
  const inputPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profitPrice = document.getElementById("profit");

  inputPrice.addEventListener("input", () => {
    // 入力値の10%を算出
    const commission = Math.round(inputPrice.value * 0.1);
    // 販売手数料金、販売利益にカンマを加える    
    taxPrice.innerHTML = new Intl.NumberFormat().format(commission);
    profitPrice.innerHTML = new Intl.NumberFormat().format(inputPrice.value - commission);
  });
});