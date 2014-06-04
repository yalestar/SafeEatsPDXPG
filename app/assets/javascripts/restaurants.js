var key = 'yalestar.i3904h2l';

var positionopts = {
    enableHighAccuracy: true,
    timeout: 10000
};

    // add a marker in the given location, attach some popup content to it and open the popup
    // L.marker([51.5, -0.09]).addTo(map)
    //     .bindPopup('A pretty CSS3 popup. <br> Easily customizable.')
    //     .openPopup();

var ourPositionLat;
var ourPositionLong;
// var layer = L.mapbox.map('map', key);
// var layer = L.mapbox.tileLayer(key);
var map;
$(document).ready(function () {
  var map = L.map('map').setView([45, -122.09], 13);

  // add an OpenStreetMap tile layer
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  $("#getLocation").click(function () {
      if (typeof group !== 'undefined') {
          group.clearLayers();
      }
      map.locate();
  });


    $("#clear").click(function () {
      if (typeof group !== 'undefined') {
          $("#results_block").text("");
          group.clearLayers();
      }
        // map.locate(12);
    });
    map.on('locationerror', function (e) {
        alert(e.message);
    });

    map.on('locationfound', function (e) {

      ourPositionLat = e.latitude;
      ourPositionLong = e.longitude;

      map.setView(e.latlng, 14);
      console.log("lat: " + ourPositionLat);
      console.log("long: " + ourPositionLong);
      var marker = new L.Marker(new L.LatLng(ourPositionLat, ourPositionLong));
      map.addLayer(marker);
    });

    map.on("dragend", function () {
        var newLocation = map.getCenter();
        ourPositionLong = newLocation.lng;
        ourPositionLat = newLocation.lat;
        // console.log("lat: " + ourPositionLat);
        // console.log("long: " + ourPositionLong);
        // map.clearLayers();
        getItems();
    });

    map.locate();
    // map.addLayer(cloudmade);
    $("#find").click(function () {
        getItems();
    });
});


function getItems() {
    if (typeof group !== 'undefined') {
        group.clearLayers();
    }

    var group = new L.LayerGroup();
    // $.ajax({
    //     type: "GET",
    //     url: "/find_nearest",
    //     data: "lat=" + ourPositionLat + "&long=" + ourPositionLong,
    //     success: function (data) {

    //       var json = $.parseJSON(data);
    //       var items = $.each(json, function (i, v) {

    //         var ll = v.loc.reverse();
    //         var name = v.name;
    //         var street = v.street;
    //         var latest = "";
    //         // console.log(v.inspections.length);
    //         if (v.inspections.length > 0) {
    //             latest = v.inspections[0].score
    //         }

    //         var pc = name + "<br/>" + street + "<br/>Most Recent Inspection: ";
    //         pc += "<b><a href='#'>" + latest + "</a></b>";
    //         var marker = new L.Marker(new L.LatLng(ll[0], ll[1]));
    //         marker.bindPopup(pc);
    //         group.addLayer(marker);
    //         var cls;
    //         if (latest >= 90) {
    //           cls = "green";
    //         } else if (latest < 90 && latest >= 80) {
    //           cls = "yellow";
    //         } else if (latest == undefined) {
    //           cls = "orange"
    //         } else {
    //           cls = "red";
    //         }
    //         var results_txt = "";

    //             results_txt += v.name + "<br/>";
    //             results_txt += v.street + "&nbsp;<a href='#' class='zoomTo'>z</a><br/>";
    //             results_txt += v.city + "<br/>";
    //             results_txt += "<span class=" + cls + ">";
    //             results_txt += "<b>Most Recent Score: " + latest + "</b><br/></span>";
    //             results_txt += "<hr/>";
    //             $("#results_block").append(results_txt);
    //             // TODO: put this in the mongo query
    //             // return (i != 15);
    //         });
    //         map.addLayer(group);
    //     }
    // });
}
