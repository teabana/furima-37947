const pay = () => {
  Payjp.setPublickey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const forResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_destination[number]"),
      exp_month: formData.get("purchase_destination[exp_month]"),
      exp_year: formData.get("purchase_destination[exp_year]"),
      cvc: `s0${formData.get("purchase_destination[cvc]")}`
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token type="hidden">`;
        renderDom.insertAdjacentHTML("afterbegin", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);