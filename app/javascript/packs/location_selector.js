var country = document.getElementById("volunteer_country");
if (country) {
  country.addEventListener("change", function(){
    $.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })
}

var state = document.getElementById("volunteer_state");
if (state) {
  state.addEventListener("change", function(){
    $.ajax({
      url: "/cities?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
}