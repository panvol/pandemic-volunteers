var volunteer_country = document.getElementById("volunteer_country");
var volunteer_state = document.getElementById("volunteer_state");
let hospital_country = document.getElementById('hospital_country');
let hospital_state = document.getElementById('hospital_state');
let partner_country = document.getElementById('partner_country');
let partner_state = document.getElementById('partner_state');

const addCountryListener = (country) => {
  if (country) {
    country.addEventListener("change", function(){
      $.ajax({
        url: "/states?country=" + country.value,
        type: "GET"
      })
    })
  }
}

const addStateListener = (state, country) => {
  if (state) {
    state.addEventListener("change", function(){
      $.ajax({
        url: "/cities?country=" + country.value + "&state=" + state.value,
        type: "GET"
      })
    })
  }
}

[volunteer_country, hospital_country, partner_country].forEach((country) => {
  addCountryListener(country);
});

[[volunteer_state, volunteer_country], [hospital_state, hospital_country], [partner_state, partner_country]].forEach((pair) => {
  let state = pair[0];
  let country = pair[1];
  addStateListener(state, country);
});
