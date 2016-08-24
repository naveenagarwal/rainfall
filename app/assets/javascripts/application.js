// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require jquery_ujs
// require turbolinks
// require highcharts
// to get the new features in 2.3.0:
// require highcharts/highcharts-more
// require_tree .

globalData = null;
counter = 0;
that = null
countryChart = null
plotChartMap = function(d){
  var year, values;
  for(var i in d){
    year = i;
    values = d[i]
  }
  countryChart =  $('#container').highcharts('Map', {
        chart : {
          events : {
            load : function () {
                that = this;
                // set up the updating of the chart each second

                var intevalID = setInterval(function () {
                  counter++;
                  if(counter >= globalData.length){
                    clearInterval(intevalID);
                    return
                  }
                  for(var ii in globalData[counter]){
                    year = ii;
                    vals = globalData[counter][ii];
                  }
                  that.setTitle({text: 'India\'s Railfall Stats - ' + year});
                  that.series[0].setData(vals, true);

                }, 1000);
            }
          }
        },
        title : {
            text : 'India\'s Railfall Stats - ' + year
        },

        subtitle : {
            text : 'Source map: <a href="https://code.highcharts.com/mapdata/countries/in/custom/in-all-andaman-and-nicobar.js">India with Andaman and Nicobar</a>'
        },

        mapNavigation: {
            enabled: true,
            buttonOptions: {
                verticalAlign: 'bottom'
            }
        },

        colorAxis: {
            min: 0
        },

        series : [{
            data : values,
            mapData: Highcharts.maps['countries/in/custom/in-all-andaman-and-nicobar'],
            joinBy: 'hc-key',
            name: 'Year on Year',
            states: {
                hover: {
                    color: '#BADA55'
                }
            },
            dataLabels: {
                enabled: true,
                format: '{point.name}'
            }
        }]
    });
  }

$(document).ready(function() {

  $.getJSON('/?q=annual', function(data) {
      globalData = data;
      plotChartMap(data[0]);
  });

});

