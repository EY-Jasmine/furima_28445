function calc() {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const proFit = document.getElementById("profit");

  itemPrice.addEventListener("keydown", () => {
    const str = this.value;
    this.value = num;
      const price = (num / 10);
      addTaxPrice.value = price;
      const productProfit = (num - price);
  });

}
// console.log(e.target)

window.addEventListener("turbolinks:load", calc);

// loadではなく…？ 発展カリキュラムを参照
// ①addEventListenerを使用して、キーが押された時に発火する関数を設定 console.log()を使って関数が動いているか確認
// ②数値（価格）が入力されている要素を指定して取得する 
// ③取得した要素から入力されている値を取得する methodを検索
// ④取得した値を用いて計算させる
// ⑤計算結果をビューに挿入する innerHTML textContent


const addTaxPrice = document.getElementById("add-tax-price");
addTaxPrice.innerHTML = price;


const profit = document.getElementById("profit");
profit.innerHTML = productProfit;
