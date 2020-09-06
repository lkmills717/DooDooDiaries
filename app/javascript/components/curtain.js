const curtain = () => {
  const test = document.querySelector('.curtain');
  
  test.addEventListener('click', () => {
    document.querySelector('.home-btns').className += '--on';
    document.querySelector('.curtain__panel--left').className += '--on';
    document.querySelector('.curtain__panel--right').className += '--on';
    document.querySelector('.invitation').className += '__off';
    document.querySelector('.invitation').className += '__off';
    // document.querySelector('.checkbox').className += '__off';
    // document.querySelector('.curtain__panel').className += '--on';
  });
}

export { curtain };