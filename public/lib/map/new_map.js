$(function(){
    // On va remplacer dynamiquement la latitude et longitude
    // <% @etablissement.latitude %>,<% @etablissement.longitude %>,
    var latlng = new google.maps.LatLng(43.57317363820925, 3.863909667968759)

    var map = new google.maps.Map(document.getElementById('map'),{
        zoom : 10,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    // Initialisation du marker
    var marker = new google.maps.Marker({
        position : latlng,
        map : map,
        title : 'Bougez ce curseur',
        draggable : true
    });

    // Initialisation du geocoder
    var geocoder = new google.maps.Geocoder();

    google.maps.event.addListener(marker, 'drag', function(){
        setPosition(marker);
    });

    $('#adresse').keypress(function(e){
        if(e.keyCode == 13){
            var request = {
                address : $(this).val()
            }
            geocoder.geocode(request, function(results, status){
                if(status == google.maps.GeocoderStatus.OK){
                    map.setCenter(results[0].geometry.location);
                }
            });
            return false;
        }
    });

});

function setPosition(marker){
    var pos = marker.getPosition();
    $('#lat').val(pos.lat());
    $('#lng').val(pos.lng());
};