Ext.define('BGRM.view.ChartPanel', {
			extend : 'Ext.chart.Chart',
			store : Ext.create('BGRM.store.Chart'),
			alias : 'widget.chartPanel',
			title : '图表分析',
			theme : 'Green',
			closable : true,
			animate: true,
			axes : [{
						title : '爆破XX',
						type : 'Numeric',
						position : 'left',
						fields : ['temperature'],
						minimum : 0,
						grid : true,
						maximum : 100
					}, {
						title : '时间',
						type : 'Time',
						position : 'bottom',
						fields : ['date'],
						dateFormat : 'ga'
					}],

			series : [{
						type : 'line',
						xField : 'date',
						yField : 'temperature',
						style : {
							fill : '#38B8BF',
							stroke : '#38B8BF',
							'stroke-width' : 3
						}
						
					}]

		});