const curtain = () => {
  const test = document.querySelector('.checkbox');
  
  test.addEventListener('click', () => {
    document.querySelector('.home-btns').className += '--on';
    document.querySelector('.invitation').className += '__off';
    document.querySelector('.checkbox').className += '__off';
    // document.querySelector('.curtain__panel').className += '--on';
  });
}

export { curtain };