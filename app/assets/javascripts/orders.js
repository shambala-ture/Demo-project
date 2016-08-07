$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Orders shared July, 2016 to Aug, 2016'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            name: 'Orders',
            colorByPoint: true,
            data: [{
                name: 'Completed Orders',
                y: 50.00
            }, {
                name: 'Shipped Orders',
                y: 30.00            
            }, {
                name: 'Pending Orders',
                y: 15.00
            }, {
                name: 'Cancelled Orders',
                y: 5.00
            }]
        }]
    });
});