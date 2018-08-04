function getLocation() {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition(function(position) {

      // update the form with the coordinates
      var x = document.getElementById("x");
      var y = document.getElementById("y");

      x.value = position.coords.latitude;
      y.value = position.coords.longitude;

    });
  } else {
    // abort!
    console.error("Geolocation not available 😩");
  }
};
