Ext.require('BGRM.view.BlastingTaskDetail');
Ext.define('BGRM.view.BlastingMon', {
			extend : 'Ext.chart.Chart',
			store : Ext.create('BGRM.store.BlastingMon'),
			alias : 'widget.BlastingMonPanel',
			title : '爆破监控',
			theme : 'Green',
			closable : true,
			animate : true,
			axes : [{
						type : 'Numeric',
						position : 'left',
						fields : ['depth'],
						title : '孔深',
						grid : true,
						minimum : 0
					}, {
						type : 'Category',
						position : 'bottom',
						fields : ['hole'],
						label : {
							renderer : Ext.util.Format.numberRenderer('0,0')
						},
						title : ' 爆孔'
					}],
			series : [{
						type : 'column',
						axis : 'left',
						highlight : true,
						tips : {
							//trackMouse : true,
							width : 800,
							title:'当前状态',
							height : 120,
							layout:'fit',
							items : {
//								width:600,
								xtype : 'bookdetail',
								itemId : 'detailsPanel'
							}
						},
						xField : 'hole',
						yField : 'depth'
					}]

		});