<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="NewCISProject._new" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Location Modal</title>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    <style>
        /* Your styles remain unchanged */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #mapModal {
            display: none;
            position: fixed;
            z-index: 9999;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        #mapContainer {
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            max-width: 700px;
            height: 500px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px #00000088;
            display: flex;
            flex-direction: column;
        }
        #map {
            flex-grow: 1;
            border-bottom: 1px solid #ccc;
        }
        #mapControls {
            padding: 10px;
            text-align: right;
            background: #f9f9f9;
            border-top: 1px solid #ccc;
        }
        #txtLocation {
            width: 350px;
            font-size: 1.1em;
            padding: 5px 8px;
        }
        #btnSelectLocation, #btnConfirmLocation {
            padding: 8px 16px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            border: 1px solid #007BFF;
            background-color: #007BFF;
            color: white;
        }
        #btnSelectLocation:hover, #btnConfirmLocation:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtLocation" runat="server" ReadOnly="true" placeholder="Selected location will appear here"></asp:TextBox>
        <asp:Button ID="btnSubmit" runat="server" Text="Confirm Location" CssClass="btn" OnClick="btnSubmit_Click" />

        <asp:Label ID="lblSelectedLocation" runat="server" CssClass="info"></asp:Label>

        <asp:HiddenField ID="hfLatitude" runat="server" />
        <asp:HiddenField ID="hfLongitude" runat="server" />

        <!-- This is a normal HTML button, NOT ASP.NET button -->
        <button type="button" id="btnSelectLocation" onclick="openMapModal()">Select Location</button>

        <!-- Map Modal -->
        <div id="mapModal">
            <div id="mapContainer">
                <div id="map"></div>
                <div id="mapControls">
                    <button type="button" id="btnConfirmLocation" onclick="confirmLocation()">Confirm Selection</button>
                </div>
            </div>
        </div>

        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
        <script>
            var mapModal = document.getElementById('mapModal');
            var txtLocation = document.getElementById('<%= txtLocation.ClientID %>');
            var hfLatitude = document.getElementById('<%= hfLatitude.ClientID %>');
            var hfLongitude = document.getElementById('<%= hfLongitude.ClientID %>');
            var map, marker;

            function initMap() {
                if (!map) {
                    var startLat = hfLatitude.value ? parseFloat(hfLatitude.value) : 20.5937;
                    var startLng = hfLongitude.value ? parseFloat(hfLongitude.value) : 78.9629;
                    var zoomLevel = hfLatitude.value ? 13 : 5;

                    map = L.map('map').setView([startLat, startLng], zoomLevel);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        maxZoom: 19,
                        attribution: '© OpenStreetMap contributors'
                    }).addTo(map);

                    if (hfLatitude.value && hfLongitude.value) {
                        marker = L.marker([startLat, startLng], { draggable: true }).addTo(map);
                        marker.on('dragend', onMarkerMoved);
                    }

                    map.on('click', onMapClick);
                } else {
                    map.invalidateSize();
                }
            }

            function openMapModal() {
                mapModal.style.display = 'block';
                setTimeout(initMap, 100);
            }

            function closeMapModal() {
                mapModal.style.display = 'none';
            }

          
            function onMapClick(e) {
                var lat = e.latlng.lat.toFixed(6);
                var lng = e.latlng.lng.toFixed(6);

                if (marker) {
                    marker.setLatLng(e.latlng);
                } else {
                    marker = L.marker(e.latlng, { draggable: true }).addTo(map);
                    marker.on('dragend', onMarkerMoved);
                }

                hfLatitude.value = lat;
                hfLongitude.value = lng;

                // Call reverse geocode to get address
                fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.display_name) {
                            txtLocation.value = data.display_name;  // Show address in textbox
                        } else {
                            txtLocation.value = "Lat: " + lat + ", Lng: " + lng; // fallback
                        }
                    })
                    .catch(() => {
                        txtLocation.value = "Lat: " + lat + ", Lng: " + lng; // fallback on error
                    });
            }

            function onMarkerMoved(e) {
                var position = e.target.getLatLng();
                var lat = position.lat.toFixed(6);
                var lng = position.lng.toFixed(6);

                hfLatitude.value = lat;
                hfLongitude.value = lng;

                // Same reverse geocode on dragend
                fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.display_name) {
                            txtLocation.value = data.display_name;
                        } else {
                            txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                        }
                    })
                    .catch(() => {
                        txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                    });
            }

            function onMarkerMoved(e) {
                var position = e.target.getLatLng();
                var lat = position.lat.toFixed(6);
                var lng = position.lng.toFixed(6);

                hfLatitude.value = lat;
                hfLongitude.value = lng;

                // Same reverse geocode on dragend
                fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.display_name) {
                            txtLocation.value = data.display_name;
                        } else {
                            txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                        }
                    })
                    .catch(() => {
                        txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                    });
            }

            function confirmLocation() {
                if (hfLatitude.value && hfLongitude.value) {
                    closeMapModal();  // just close, no overwriting
                } else {
                    alert("Please select a location by clicking on the map.");
                }
            }


          

            mapModal.addEventListener('click', function (e) {
                if (e.target === mapModal) {
                    closeMapModal();
                }
            });
        </script>
    </form>
</body>
</html>--%>


<!-- Replace the content inside your .aspx page with this updated version -->
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new.aspx.cs" Inherits="NewCISProject._new" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Location Modal</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        #mapModal {
            display: none;
            position: fixed;
            z-index: 9999;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        #mapContainer {
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            max-width: 700px;
            height: 500px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px #00000088;
            display: flex;
            flex-direction: column;
        }
        #map {
            flex-grow: 1;
            border-bottom: 1px solid #ccc;
        }
        #txtLocation {
            width: 350px;
            font-size: 1.1em;
            padding: 5px 8px;
        }
        #btnSelectLocation {
            padding: 8px 16px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            border: 1px solid #007BFF;
            background-color: #007BFF;
            color: white;
        }
        #btnSelectLocation:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
   <%-- <form id="form2" runat="server">
        <asp:TextBox ID="txtLocation" runat="server" ReadOnly="true" placeholder="Selected location will appear here"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Confirm Location" CssClass="btn" OnClick="btnSubmit_Click" />
        <asp:Label ID="Label1" runat="server" CssClass="info"></asp:Label>
       <asp:HiddenField ID="hfLatitude" runat="server" />
        <asp:HiddenField ID="hfLongitude" runat="server" />


        <button type="button" id="btnSelectLocation" onclick="openMapModal()">Select Location</button>

        <!-- Map Modal -->
        <div id="mapModal">
            <div id="mapContainer">
                <div id="map"></div>
            </div>
        </div>

        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
        <script>
            var mapModal = document.getElementById('mapModal');
            var txtLocation = document.getElementById('<%= txtLocation.ClientID %>');
            var hfLatitude = document.getElementById('<%= hfLatitude.ClientID %>');
            var hfLongitude = document.getElementById('<%= hfLongitude.ClientID %>');
            var map, marker;

            function initMap() {
                if (!map) {
                    var startLat = hfLatitude.value ? parseFloat(hfLatitude.value) : 20.5937;
                    var startLng = hfLongitude.value ? parseFloat(hfLongitude.value) : 78.9629;
                    var zoomLevel = hfLatitude.value ? 13 : 5;

                    map = L.map('map').setView([startLat, startLng], zoomLevel);

                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                        maxZoom: 19,
                        attribution: '© OpenStreetMap contributors'
                    }).addTo(map);

                    if (hfLatitude.value && hfLongitude.value) {
                        marker = L.marker([startLat, startLng], { draggable: true }).addTo(map);
                        marker.on('dragend', onMarkerMoved);
                    }

                    map.on('click', onMapClick);
                } else {
                    map.invalidateSize();
                }
            }

            function openMapModal() {
                mapModal.style.display = 'block';
                setTimeout(initMap, 100);
            }

            function closeMapModal() {
                mapModal.style.display = 'none';
            }

            function onMapClick(e) {
                var lat = e.latlng.lat.toFixed(6);
                var lng = e.latlng.lng.toFixed(6);

                if (marker) {
                    marker.setLatLng(e.latlng);
                } else {
                    marker = L.marker(e.latlng, { draggable: true }).addTo(map);
                    marker.on('dragend', onMarkerMoved);
                }

                updateLocation(lat, lng);
            }

            function onMarkerMoved(e) {
                var position = e.target.getLatLng();
                var lat = position.lat.toFixed(6);
                var lng = position.lng.toFixed(6);

                updateLocation(lat, lng);
            }

            function updateLocation(lat, lng) {
                hfLatitude.value = lat;
                hfLongitude.value = lng;

                fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
                    .then(response => response.json())
                    .then(data => {
                        if (data && data.display_name) {
                            txtLocation.value = data.display_name;
                        } else {
                            txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                        }
                        closeMapModal();  // Auto-close the modal after setting location
                    })
                    .catch(() => {
                        txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                        closeMapModal();
                    });
            }

            mapModal.addEventListener('click', function (e) {
                if (e.target === mapModal) {
                    closeMapModal();
                }
            });
        </script>
    </form>--%>

    <form id="form1" runat="server">
    <asp:TextBox ID="txtLocation" runat="server" ReadOnly="true" placeholder="Selected location will appear here"></asp:TextBox>
    <asp:Label ID="Label1" runat="server" CssClass="info"></asp:Label>

    <asp:HiddenField ID="hfLatitude" runat="server" />
    <asp:HiddenField ID="hfLongitude" runat="server" />

    <button type="button" id="btnSelectLocation" onclick="openMapModal()">Select Location</button>

    <!-- Map Modal -->
    <div id="mapModal">
        <div id="mapContainer">
            <div id="map"></div>
        </div>
    </div>
          <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
  <script>
      var mapModal = document.getElementById('mapModal');
      var txtLocation = document.getElementById('<%= txtLocation.ClientID %>');
      var hfLatitude = document.getElementById('<%= hfLatitude.ClientID %>');
      var hfLongitude = document.getElementById('<%= hfLongitude.ClientID %>');
      var map, marker;

      function initMap() {
          if (!map) {
              var startLat = hfLatitude.value ? parseFloat(hfLatitude.value) : 20.5937;
              var startLng = hfLongitude.value ? parseFloat(hfLongitude.value) : 78.9629;
              var zoomLevel = hfLatitude.value ? 13 : 5;

              map = L.map('map').setView([startLat, startLng], zoomLevel);

              L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                  maxZoom: 19,
                  attribution: '© OpenStreetMap contributors'
              }).addTo(map);

              if (hfLatitude.value && hfLongitude.value) {
                  marker = L.marker([startLat, startLng], { draggable: true }).addTo(map);
                  marker.on('dragend', onMarkerMoved);
              }

              map.on('click', onMapClick);
          } else {
              map.invalidateSize();
          }
      }

      function openMapModal() {
          mapModal.style.display = 'block';
          setTimeout(initMap, 100);
      }

      function closeMapModal() {
          mapModal.style.display = 'none';
      }

      function onMapClick(e) {
          var lat = e.latlng.lat.toFixed(6);
          var lng = e.latlng.lng.toFixed(6);

          if (marker) {
              marker.setLatLng(e.latlng);
          } else {
              marker = L.marker(e.latlng, { draggable: true }).addTo(map);
              marker.on('dragend', onMarkerMoved);
          }

          updateLocation(lat, lng);
      }

      function onMarkerMoved(e) {
          var position = e.target.getLatLng();
          var lat = position.lat.toFixed(6);
          var lng = position.lng.toFixed(6);

          updateLocation(lat, lng);
      }

      function updateLocation(lat, lng) {
          hfLatitude.value = lat;
          hfLongitude.value = lng;

          fetch(`https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`)
              .then(response => response.json())
              .then(data => {
                  if (data && data.display_name) {
                      txtLocation.value = data.display_name;
                  } else {
                      txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                  }
                  closeMapModal();  // Auto-close the modal after setting location
              })
              .catch(() => {
                  txtLocation.value = "Lat: " + lat + ", Lng: " + lng;
                  closeMapModal();
              });
      }

      mapModal.addEventListener('click', function (e) {
          if (e.target === mapModal) {
              closeMapModal();
          }
      });
  </script>
</form>

</body>
</html>
