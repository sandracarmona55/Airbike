import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('bike_address')
  //grabbing the element of the dom(my input field for address) where i want to insert the autocomplete
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
