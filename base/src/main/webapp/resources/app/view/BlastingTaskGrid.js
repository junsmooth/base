Ext.define('BGRM.view.BlastingTaskGrid', {
	extend : 'Ext.grid.Panel',
	alias : 'widget.blastinggrid',
	// override
	initComponent : function() {
		this.columns = [{
			text : "任务编号",
			flex : 1,
			dataIndex : 'id',
			sortable : true
		}, {
			text : '采场',
			columns : [ {
				text : '中段',
				width : 75,
				sortable : true,
				dataIndex : 'height'
			}, {
				text : '采场号',
				width : 75,
				sortable : true,
				dataIndex : 'colno'
			} ]
		}, {
			text : "爆破次数",
			flex : 1,
			dataIndex : 'blastingtimes',
			sortable : true
		}, {
			text : "日期",
			flex : 1,
			dataIndex : 'blastingdate',
			sortable : true
		} ];
		this.store = Ext.create('BGRM.store.BlastingTask'),
		// finally call the superclasses implementation
		this.callParent();
	}
});
