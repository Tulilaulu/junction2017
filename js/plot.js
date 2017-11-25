$(function() {
  google.charts.load('current', {packages: ['corechart', 'line']});
  google.charts.setOnLoadCallback(make_plot);

  function drawLineColors(api_json) {
    var data = new google.visualization.DataTable();
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
    console.log(api_json.data);

    var rows = api_json.data.map(x => {
        return { "c" : x.map(v => {
          return { "v" : v }
        }
      )}
    });

    var cols = [ {label: "X", type: "date"}, {label: "Oma", type: "number"}]
/*
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
      colors: ['#000099', '#0000FF', '#BB0000'],
      'width':800,
      'height':600
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  };

  function make_plot() {
    $.ajax({
      url: "data/1",
      context: document.body
    }).done(function(res) {
      drawLineColors(res);
    });
  };

});