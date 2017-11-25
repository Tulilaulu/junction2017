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

    // gather all data into a map
    var time_data_map = to_map(own_data.data, 0, 3, {});
    time_data_map = to_map(region_data.data, 1, 3, time_data_map);
    time_data_map = to_map(other_region_data.data, 2, 3, time_data_map);

    //console.log(time_data_map);

    //console.log(Object.keys(time_data_map));

    // flatten { a : [1, 2, 3], ... } to { [a, 1, 2, 3], ... }
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
    // label columns and values
    function to_googlechart_fmt(a) {
      return a.map(x => {
        return { "c" : x.map(val => {
          return { "v" : val }
        }
      )}});
    }

    //var zipped = zip_energy(own_data.data, region_data.data, other_region_data.data);
    //console.log(zipped);

    start_idx = window.dateIndex - 7;
    end_idx = window.dateIndex;

    window.maxIndex = time_data_array.length - 1;

    // get previous 7 days from window.dateIndex
    var rows = to_googlechart_fmt(time_data_array).slice(start_idx+1, end_idx+1);

    if (time_data_array[end_idx][1] <= time_data_array[end_idx - 7][1]) {
      window.onBetter();
    } else {
      window.onWorse();
    }

    var prev_day_comparison = 100 * (1 - time_data_array[end_idx][1] / time_data_array[end_idx - 1][1]);

    console.log(prev_day_comparison);


    // assemble data to gchart json format
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

    // find maximum power consumption value
    maxPower = time_data_array.map(x => Math.max(x[1], x[2], x[3])).reduce((a,b) => Math.max(a, b));
    maxPower = 1000 * (((maxPower / 1000) | 0) + 1) // round up thousands

    var options = {
      hAxis: { format: 'd/M/yy', title: 'Date' },
      vAxis: { title: 'Power consumption',
                viewWindow: {min: 0, max: maxPower}},
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

  window.refresh_plot = make_plot;

});