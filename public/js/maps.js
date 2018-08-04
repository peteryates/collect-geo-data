window.onload = function() {

  var map = L.map('map'); //.setView([51.505, -0.09], 13);

  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox.streets',
        accessToken: 'pk.eyJ1IjoicGV0ZXIteWF0ZXMiLCJhIjoiY2o4ZGZ3cXNkMGd0ejJ3bW9lbnF6N3IzaiJ9.Zhdx9XEdPQQia0g8BrbiuA'
  }).addTo(map);

  var x = parseFloat(document.getElementById('x').innerText);
  var y = parseFloat(document.getElementById('y').innerText);

  var marker = L.marker([x, y]).addTo(map);

  bounds = new L.LatLngBounds([[x,y]]);
  map.fitBounds(bounds);

};
