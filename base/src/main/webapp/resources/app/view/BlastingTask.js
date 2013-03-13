Ext.require('BGRM.view.BlastingTaskGrid');
Ext.require('BGRM.view.BlastingTaskDetail');
Ext.define('BGRM.view.BlastingTask', {
	extend : 'Ext.Panel',
	title : '爆破任务',
	closable : true,
	alias : 'widget.blastingTaskPanel',
	//store : Ext.create('BGRM.store.BlastingTask'),
	frame : true,
	layout : 'border',
	initComponent : function() {
		console.log('init blastingTask');
		this.items = [ {
			xtype : 'blastinggrid',
			itemId : 'gridPanel',
			region : 'north',
			height : 210,
			split : true
		}, {
			xtype : 'bookdetail',
			itemId : 'detailPanel',
			region : 'center'
		} ];
		// call the superclass's initComponent implementation
		this.callParent();
	}
});