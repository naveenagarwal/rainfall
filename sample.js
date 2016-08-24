var GeoJSON = require('/usr/lib/node_modules/geojson/geojson');
var data = [
  { name: 'Location A', category: 'Store', street: 'Market', lat: 26.3302, lng: -92.99290000000001 }
      ];

x = GeoJSON.parse(data, {Point: ['lat', 'lng']});
x.features[0]
