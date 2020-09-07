const movement = () => {
  const fields = document.querySelectorAll('.btn-shape');


  fields.forEach(field => {
    field.addEventListener('click', () => {
      const data = field.getAttribute('data-id');
      console.log(data[0]);
      document.querySelector('#movement_shape').value = data;
    });
   });
}

export { movement };