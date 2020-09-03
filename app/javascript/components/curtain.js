const curtain = () => {
  const test = document.querySelector('.invitation');
  
  test.addEventListener('click', () => {
    document.querySelector('.home-btns').className += '--on';
    document.querySelector('.invitation').className += '__off';
  });
}

export { curtain };