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
//= require jquery_ujs
//= require turbolinks
// require highcharts
// to get the new features in 2.3.0:
// require highcharts/highcharts-more
//= require_tree .

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

                  console.log(counter);
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

  // var options = {
  //   chart: {
  //     renderTo: 'annual',
  //     type: 'column'
  //   },
  //   title: {
  //     text: 'Annual RainFall Data'
  //   },
  //   subtitle: {
  //     text: 'Last 64 years data for - ANDAMAN & NICOBAR ISLANDS'
  //   },
  //   xAxis: {
  //           title: {
  //             text: 'Year'
  //           }
  //         },
  //   yAxis: {
  //     min: 0,
  //     title: {
  //       text: 'Rainfall (mm)'
  //     }
  //   },
  //   legend: {
  //     align: 'right',
  //     x: -30,
  //     verticalAlign: 'top',
  //     y: 25,
  //     floating: true,
  //     backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
  //     borderColor: '#CCC',
  //     borderWidth: 1,
  //     shadow: false
  //   },
  //   series: [{}]
  // };

  $.getJSON('/?q=annual', function(data) {
      globalData = data;
      plotChartMap(data[0])
      // $.each(data, function(d){
      //   setTimeout( function(){ plotChartMap(d); }, 2000)
      // })
    // var deficit = [], surplus = [];

    // data.forEach(function(d,index){
    //   $('body').append($("<div id='annual-" + index + "'>"));
    //   $('body').append($("<div id='annual-more-info-" + index + "'>"));

    //   options.chart = {
    //     renderTo: 'annual-' + index,
    //     type: 'column'
    //   }
    //   options.subtitle = {
    //     text: 'Last 64 years data for - ' + data[index].name
    //   },
    //   options.series[0].data = data[index].data;
    //   options.series[0].name = "Annual Data"
    //   options.series[0].dataLabels = {
    //     enabled: true,
    //     rotation: -90,
    //     color: '#FFFFFF',
    //     align: 'right',
    //     format: '{point.y:.1f}', // one decimal
    //     y: 10, // 10 pixels down from the top
    //     style: {
    //       fontSize: '13px',
    //       fontFamily: 'Verdana, sans-serif'
    //     }
    //   }
    //   var rainFallData = data[index].data.map(function(dd){ return dd[1]});
    //   var Last50YearsRainFallData = rainFallData.splice(0,50)
    //   var max = Math.max.apply(Math,rainFallData)
    //   var min = Math.min.apply(Math,rainFallData)
    //   var sum = 0; Last50YearsRainFallData.forEach(function(val){ sum += val });
    //   var average = sum / Last50YearsRainFallData.length;
    //   var lastFiveYearsData = rainFallData.splice(rainFallData.length - 5,5);

    //   sum = 0; lastFiveYearsData.forEach(function(val){ sum += val });
    //   var lastFiveYearsAverage = sum / lastFiveYearsData.length;
    //   console.log(data[index].name, lastFiveYearsData, sum)
    //   var lastFiveYearsVariationHtml = "",
    //       lastFiveYearsVariation = ((lastFiveYearsAverage / average) * 100) - 100

    //   if(lastFiveYearsVariation < 0){
    //     lastFiveYearsVariationHtml = lastFiveYearsVariation.toFixed(2) + "% Deficit"
    //     deficit.push({name: data[index].name, variation: lastFiveYearsVariation})
    //   }else{
    //     lastFiveYearsVariationHtml = lastFiveYearsVariation.toFixed(2) + "% Surplus"
    //     surplus.push({name: data[index].name, variation: lastFiveYearsVariation})
    //   }

    //   options.legend.labelFormatter = function(){
    //     text = "Max - " + max + "mm";
    //     text += "<br />Min - " + min + "mm";
    //     text += "<br />Normal - " + average.toFixed(2) + "mm";
    //     text += "<br />last 5 years Avg - " + lastFiveYearsAverage.toFixed(2) + "mm<em>(" + lastFiveYearsVariationHtml + ")</em>";
    //     return text;

    //   }
      // var chart = new Highcharts.Chart(options);


      // var min = chart.series[0].dataMin;
      // var max = chart.series[0].dataMax;

      // for(var i = 0; i < chart.series[0].points.length; i++) {
      //   if (chart.series[0].points[i].y === max) {
      //     chart.series[0].points[i].update({
      //       color: 'green',
      //       name: 'max value'
      //     });
      //   }
      //   if (chart.series[0].points[i].y === min) {
      //     chart.series[0].points[i].update({
      //       color: 'red',
      //       name: 'min value'
      //     });
      //   }
      // }

      // html =  "<p>Normal Monsoon(avaerage of 1951-2000) - <strong>" + average.toFixed(2) + "</strong></p>"
      // html += "<p>Last 5 Years average Monsoon - <strong>" + lastFiveYearsAverage.toFixed(2) + "</strong><em>(" + lastFiveYearsVariationHtml + ")</em></p>"
      // html += "<p>Ideal monsoon can vary from <strong>+4% to -4%</strong> of normal monsoon</p>"

      // $("#annual-more-info-" + index).html(html)

    // })

    // html = ""
    // deficit.sort(function(v1, v2){return v1.variation-v2.variation}).forEach(function(val){ html += "<li class='list-group-item'>" + val.name + " : " + val.variation + "</li>" });
    // $("ul#deficit").html(html);
    // $("#deficit-count").html("(" + deficit.length + ")")
    // html = ""
    // surplus.sort(function(v1, v2){return v2.variation-v1.variation}).forEach(function(val){ html += "<li class='list-group-item'>" + val.name + " : +" + val.variation + "</li>" });
    // $("ul#surplus").html(html);
    // $("#surplus-count").html("(" + surplus.length + ")")

  });

  // var data = [
  //       {
  //           "hc-key": "in-5390",
  //           "value": 0
  //       },
  //       {
  //           "hc-key": "in-py",
  //           "value": 1
  //       },
  //       {
  //           "hc-key": "in-ld",
  //           "value": 2
  //       },
  //       {
  //           "hc-key": "in-an",
  //           "value": 3
  //       },
  //       {
  //           "hc-key": "in-wb",
  //           "value": 4
  //       },
  //       {
  //           "hc-key": "in-or",
  //           "value": 5
  //       },
  //       {
  //           "hc-key": "in-br",
  //           "value": 6
  //       },
  //       {
  //           "hc-key": "in-sk",
  //           "value": 7
  //       },
  //       {
  //           "hc-key": "in-ct",
  //           "value": 8
  //       },
  //       {
  //           "hc-key": "in-tn",
  //           "value": 9
  //       },
  //       {
  //           "hc-key": "in-mp",
  //           "value": 10
  //       },
  //       {
  //           "hc-key": "in-2984",
  //           "value": 11
  //       },
  //       {
  //           "hc-key": "in-ga",
  //           "value": 12
  //       },
  //       {
  //           "hc-key": "in-nl",
  //           "value": 13
  //       },
  //       {
  //           "hc-key": "in-mn",
  //           "value": 14
  //       },
  //       {
  //           "hc-key": "in-ar",
  //           "value": 15
  //       },
  //       {
  //           "hc-key": "in-mz",
  //           "value": 16
  //       },
  //       {
  //           "hc-key": "in-tr",
  //           "value": 17
  //       },
  //       {
  //           "hc-key": "in-3464",
  //           "value": 18
  //       },
  //       {
  //           "hc-key": "in-dl",
  //           "value": 19
  //       },
  //       {
  //           "hc-key": "in-hr",
  //           "value": 20
  //       },
  //       {
  //           "hc-key": "in-ch",
  //           "value": 21
  //       },
  //       {
  //           "hc-key": "in-hp",
  //           "value": 22
  //       },
  //       {
  //           "hc-key": "in-jk",
  //           "value": 23
  //       },
  //       {
  //           "hc-key": "in-kl",
  //           "value": 24
  //       },
  //       {
  //           "hc-key": "in-ka",
  //           "value": 25
  //       },
  //       {
  //           "hc-key": "in-dn",
  //           "value": 26
  //       },
  //       {
  //           "hc-key": "in-mh",
  //           "value": 27
  //       },
  //       {
  //           "hc-key": "in-as",
  //           "value": 28
  //       },
  //       {
  //           "hc-key": "in-ap",
  //           "value": 29
  //       },
  //       {
  //           "hc-key": "in-ml",
  //           "value": 30
  //       },
  //       {
  //           "hc-key": "in-pb",
  //           "value": 31
  //       },
  //       {
  //           "hc-key": "in-rj",
  //           "value": 32
  //       },
  //       {
  //           "hc-key": "in-up",
  //           "value": 33
  //       },
  //       {
  //           "hc-key": "in-ut",
  //           "value": 34
  //       },
  //       {
  //           "hc-key": "in-jh",
  //           "value": 35
  //       }
  //   ];


});

