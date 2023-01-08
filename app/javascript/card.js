const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY); //PAY.JPテスト公開鍵
  const elements = payjp.elements();//elementsインスタンスを生成

  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  //入力欄をブラウザ上に表示
  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  //入力フォームの要素を取得
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
    });
  })
}

window.addEventListener("load", pay);