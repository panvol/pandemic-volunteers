  var country = document.getElementById("abc_country");
  var state = document.getElementById("abc_state");

  country.addEventListener("change", function(){
    $.ajax({
      url: "/states?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function(){
    $.ajax({
      url: "/cities?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
