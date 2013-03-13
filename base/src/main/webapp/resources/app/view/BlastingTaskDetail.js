Ext.define('BGRM.view.BlastingDetail', {
	extend : 'Ext.grid.Panel',
	alias : 'widget.bookdetail',
	startingMarkup : 'details',
	// override initComponent to create and compile the template
	// apply styles to the body of the panel and initialize
	// html to startingMarkup
	initComponent : function() {
		this.columns = [ {
			text : "排号",
			flex : 1,
			dataIndex : 'row',
			sortable : true
		}, {
			text : "孔号",
			flex : 1,
			dataIndex : 'holeNo',
			sortable : true
		},{
			text : "孔深",
			flex : 1,
			dataIndex : 'holeDepth',
			sortable : true
		},{
			text : "堵塞位置(m)",
			flex : 1,
			dataIndex : 'blockPosition',
			sortable : true
		}, /*,{
			text : "填砂量",
			flex : 1,
			dataIndex : 'sand',
			sortable : true
		},{
			text : "砂面高",
			flex : 1,
			dataIndex : 'sandHeight',
			sortable : true
		},*/{
			text : '药包个数',
			columns : [ {
				text : '10KG',
				width : 75,
				sortable : true,
				dataIndex : 'ten'
			}, {
				text : '5KG',
				width : 75,
				sortable : true,
				dataIndex : 'five'
			} ]
		},{
			text : "雷管段别",
			flex : 1,
			dataIndex : 'detonatorstage',
			sortable : true
		},{
			text : "药面高",
			flex : 1,
			dataIndex : 'powderHeight',
			sortable : true
		},{
			text : "填砂量",
			flex : 1,
			dataIndex : 'sand2',
			sortable : true
		},{
			text : "最终砂面",
			flex : 1,
			dataIndex : 'finalSandHeight',
			sortable : true
		},{
			text : "最后孔深",
			flex : 1,
			dataIndex : 'finalHoleDepth',
			sortable : true
		},{
			text : "爆高",
			flex : 1,
			dataIndex : 'blastingHeight',
			sortable : true
		}];
		this.store = Ext.create('BGRM.store.BlastingTaskDetail'),
		// finally call the superclasses implementation
		this.callParent();
	}
});