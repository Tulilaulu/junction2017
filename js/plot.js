$(function() {
  google.charts.load('current', {packages: ['corechart', 'line']});
  google.charts.setOnLoadCallback(make_plot);

  function drawLineColors(own_data, region_data) {

/*
    data.addColumn('date', 'X');
    data.addColumn('number', 'Oma');
    data.addColumn('number', 'Lähiseutu');
    data.addColumn('number', 'Kerava');

    data.addRows([
      [new Date(2017, 1, 1), 0, 2, 0],
      [new Date(2017, 1, 2), 10, 5, 7],
      [new Date(2017, 1, 3), 23, 15, 44],
      [new Date(2017, 1, 4), 17, 9, 3],
      [new Date(2017, 1, 5), 18, 10, 11],
      [new Date(2017, 1, 6), 9, 5, 8],
      [new Date(2017, 1, 7), 11, 3, 4]
    ]);
*/
    console.log(region_data.data);

    function zip_energy(a, b) {
      return a.map(function(e, i) {
        return [e[0], e[1], b[i][1]];
      });
    }

    function to_googlechart_fmt(a) {
      return a.map(x => {
        return { "c" : x.map(val => {
          return { "v" : val }
        }
      )}});
    }

    var zipped = zip_energy(own_data.data, region_data.data);

    //console.log(zipped);

    var rows = to_googlechart_fmt(zipped).slice(-7);



    //console.log(rows);

    var cols = [ {label: "X", type: "date"}, {label: "My usage", type: "number"}, {label: "ESPOO", type: "number"}]


/*

    // GOOGLE JSON FORMAT EXAMPLE

    var json_data = {
      "cols": [
            {"label":"X",         "type":"date"},
            {"label":"Oma",       "type":"number"},
            {"label":"Lähiseutu", "type":"number"},
            {"label":"Kerava",    "type":"number"}
          ],
      "rows": [
            {"c": [{"v": "Date(2017, 1, 1)"}, {"v": 0}, {"v": 2}, {"v": 0}]},
            {"c": [{"v": "Date(2017, 1, 2)"}, {"v": 10}, {"v": 5}, {"v": 7}]},
            {"c": [{"v": "Date(2017, 1, 3)"}, {"v": 23}, {"v": 15}, {"v": 44}]},
            {"c": [{"v": "Date(2017, 1, 4)"}, {"v": 17}, {"v": 9}, {"v": 3}]},
            {"c": [{"v": "Date(2017, 1, 5)"}, {"v": 17}, {"v": 10}, {"v": 11}]},
            {"c": [{"v": "Date(2017, 1, 6)"}, {"v": 9}, {"v": 6}, {"v": 8}]},
            {"c": [{"v": "Date(2017, 1, 7)"}, {"v": 11}, {"v": 3}, {"v": 4}]}
          ]
    };
*/

    var json_data = {
      "cols" : cols,
      "rows" : rows
    };

    var data = new google.visualization.DataTable(json_data);

    var options = {
      hAxis: {
        title: 'Date'
      },
      vAxis: {
        title: 'Power consumption'
      },
      colors: ['#00FF00', '#0000FF', '#FF0000'],
      'width':800,
      'height':600
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  };

  function make_plot() {
    $.ajax({
      url: "data/10",
      context: document.body
    }).done(function(own_data) {
      $.ajax({
        url: "avg/ESPOO",
        context: document.body
      }).done(function(espoo_data) {
        drawLineColors(own_data, espoo_data);
      });
    });
  };

});