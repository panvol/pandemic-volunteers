const updateSubmitButton = () => {
  let canSubmit = true;
  let emailField = document.getElementById('hospital-email-field');
  let nameField = document.getElementById('hospital-name-field');
  let contactField = document.getElementById('hospital-contact-field');
  let countryField = document.getElementById('hospital_country');
  let stateField = document.getElementById('hospital_state');
  let cityField = document.getElementById('hospital_city');

  let regex = /[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}/;
  let isValidEmail = regex.test(emailField.value);

  if (!isValidEmail) {
    canSubmit = false;
  }

  [countryField, nameField, contactField].forEach((field) => {
    if (field.value === '' || field.value === null) {
      canSubmit = false;
    }
  });

  [stateField, cityField].forEach((field) => {
    if (!field.hidden && (field.value === '' || field.value === null)) {
      canSubmit = false;
    }
  });

  let hospitalSubmitButton = document.getElementById('hospital-submit-button');
  hospitalSubmitButton.disabled = !canSubmit;
}

let requiredFields = document.getElementsByClassName('hospital-required-field');

for (let i=0; i<requiredFields.length; i++) {
  let field = requiredFields[i];
  field.addEventListener('change', () => {
    updateSubmitButton();
  });
}
