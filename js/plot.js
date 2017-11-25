$(function() {
  google.charts.load('current', {packages: ['corechart', 'line']});
  google.charts.setOnLoadCallback(make_plot);

  function drawLineColors(own_data, region_data, other_region_data) {

    function to_map(a, i, n, init) {
      return a.reduce(function(map, obj) {
        if ( ! (obj[0] in map) ) {
          map[obj[0]] = new Array(n);
        }
        map[obj[0]][i] = obj[1];
        return map;
      }, init);
    }

    var time_data_map = to_map(own_data.data, 0, 3, {});
    time_data_map = to_map(region_data.data, 1, 3, time_data_map);
    time_data_map = to_map(other_region_data.data, 2, 3, time_data_map);

    //console.log(time_data_map);

    //console.log(Object.keys(time_data_map));

    function flatten(map) {
      return Object.keys(map).map(key => {
        map[key].unshift(key);
        return map[key];
      });
    }

    time_data_array = flatten(time_data_map);

    //console.log(flatten(time_data_map));
/*
    function zip_energy(a, b, c) {
      return a.map(function(e, i) {
        var bv = i < b.length ? b[i][1] : "";
        var cv = i < c.length ? c[i][1] : "";
        return [e[0], e[1], bv, cv];
      });
    }
*/
    function to_googlechart_fmt(a) {
      return a.map(x => {
        return { "c" : x.map(val => {
          return { "v" : val }
        }
      )}});
    }

    //var zipped = zip_energy(own_data.data, region_data.data, other_region_data.data);
    //console.log(zipped);

    var rows = to_googlechart_fmt(time_data_array).slice(-7);
    //console.log(rows);

    var cols = [
      {label: "X", type: "date"},
      {label: "My usage", type: "number"},
      {label: "Espoo avg", type: "number"},
      {label: "Vantaa avg", type: "number"}
    ];

    var data = new google.visualization.DataTable({
      "cols" : cols,
      "rows" : rows
    });

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

    var data = new google.visualization.DataTable(json_data);
*/

    var options = {
      hAxis: { format: 'd/M/yy', title: 'Date' },
      vAxis: { title: 'Power consumption' },
      colors: ['#00FF00', '#0000FF', '#FF0000'],
      width :800,
      height :600
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
        $.ajax({
        url: "avg/VANTAA",
        context: document.body
        }).done(function(vantaa_data) {
          drawLineColors(own_data, espoo_data, vantaa_data);
        });
      });
    });
  };

});