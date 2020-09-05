const movement = () => {
  const fields = document.querySelectorAll('.btn-shape');


  fields.forEach(field => {
    field.addEventListener('click', () => {
      const data = field.getAttribute('data-id');
      const img = field.src;
      // console.log(data[0]);
      console.log(img);
      document.querySelector('#movement_shape').value = data;
      // document.querySelector('#shape_choice').src = img;
    });
   });
}

export { movement };