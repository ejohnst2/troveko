function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  var experienceAddress = document.getElementById('experience_address');
  experienceAddress.blur();
  experienceAddress.value = components.address;

  document.getElementById('experience_postal_code').value = components.postal_code;
  document.getElementById('experience_city').value = components.city;

  if (components.country_code) {
    var selector = '#experience_country option[value="' + components.country_code + '"]';
    document.querySelector(selector).selected = true;
  }
}

function getAddressComponents(place) {
  var street_number = null;
  var route = null;
  var postal_code = null;
  var city = null;
  var country_code = null;

  console.log(place.address_components);

  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type === 'street_number') {
        street_number = component.long_name;
      } else if (type === 'route' || type === 'premise') {
        route = component.long_name;
      } else if (type === 'postal_code') {
        postal_code = component.long_name;
      } else if (type === 'locality' || type === 'administrative_area_level_2') {
        city = component.long_name;
      } else if (type === 'postal_town' && city === null) {
        city = component.long_name;
      } else if (type === 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number === null ? route : (street_number + ' ' + route),
    postal_code: postal_code,
    city: city,
    country_code: country_code
  };
}

document.addEventListener("DOMContentLoaded", function() {
  var experienceAddress = document.getElementById('experience_address');

  if (experienceAddress) {
    var autocomplete = new google.maps.places.Autocomplete(experienceAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(experienceAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
