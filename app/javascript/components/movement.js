const movement = () => {
  const fields = document.querySelectorAll('.btn-shape');
  console.log(fields);


  fields.forEach(field => {
    field.addEventListener('click', () => {
      console.log(field);
      const data = field.getAttribute('data-id');
      console.log(data);
      document.querySelector('#movement_shape').value = data;
      const img = field.src;
      console.log(img);
      document.querySelector('#shape_choice').className += '--on';
      document.querySelector('#shape_choice').className += 'center';
      document.querySelector('#shape_choice').src = img;
    });
   });
}

export { movement };