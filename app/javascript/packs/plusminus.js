const plusminus = () => {
  const plus = document.querySelector(".plus");
  const minus = document.querySelector(".minus");
  const counter = document.querySelector("#counter");
  const price = document.querySelector("#price");
  const totalPrice = document.querySelector("#total-price");
  const participantsNumber = document.querySelector(".participants");
  minus.addEventListener('click', (event) => {
  if (Number.parseInt(counter.innerText, 10) > 1) {
  const number = parseInt(counter.innerText, 10) + parseInt(minus.dataset.offset, 10);
  counter.innerText = number;
  totalPrice.innerText = `Total price: ${number * parseInt(price.innerText, 10)}€`;
  }
  });
  plus.addEventListener('click', (event) => {
  const number = parseInt(counter.innerText, 10) + parseInt(plus.dataset.offset, 10);
  counter.innerText = number;
  totalPrice.innerText = `${number * parseInt(price.innerText, 10)}€`;
  });
  const form = document.querySelector('#new_booking').addEventListener('submit', (event) =>{
  // event.preventDefault();
  const hiddenParticipants = document.querySelector('#booking_participants_number');
  hiddenParticipants.value = counter.innerText;
  });
}

plusminus();

