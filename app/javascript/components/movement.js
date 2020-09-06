const movement = () => {
  const fields = document.querySelectorAll('.btn-shape');
  console.log(fields);
  const submit = document.querySelector('#movement__submit');


  fields.forEach(field => {
    field.addEventListener('click', () => {
      console.log(field);
      const data = field.getAttribute('data-id');
      console.log(data);
      document.querySelector('#movement_shape').value = data;
      const img = field.src;
      console.log(img);
      document.querySelector('#shape_choice').className += '--on';
      document.querySelector('#shape_choice').src = img;      
    });
  });

  submit.addEventListener('click', () => {
    // console.log("submit click");
    // console.log(document.querySelector('#shape_choice').src);
    // event.preventDefault();
    if (document.querySelector('#shape_choice').src === "http://localhost:3000/movements/new") {
      console.log('shape field is empty');
      document.querySelector('.shape__empty').className += '--on'
      event.preventDefault();
    }
  })

}

export { movement };