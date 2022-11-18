const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //PAY.JPテスト公開鍵
  const submit = document.getElementById("button"); //buttonというidを指定している
  submit.addEventListener("click", (e) => {   //購入ボタンをクリックするとイベント発火
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_address[number]"),    //クレカ情報を取得して変数cardに代入
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        //トークンの値をフォームに含める
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;  //トークンの値を非表示にするためhidden追記
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      //フォームに存在するクレカ情報を削除する
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();  //フォームの情報をサーバーサイドに送信
    });
  });
};

window.addEventListener("load", pay);