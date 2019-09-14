const changeSessionMethod = () => {
const changeSession = document.querySelector('.change-session');
changeSession.addEventListener('click', (event) => {
  if (changeSession.classList.contains('changed')) {
    event.currentTarget.innerText = "Seller session";
    changeSession.classList.remove('changed');
  } else {
    event.currentTarget.innerText = "Customer session";
    changeSession.classList.add('changed');
  }

});
};

// export { changeSessionMethod };
