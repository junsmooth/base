Ext.define('BGRM.view.AlarmLogPanel', {
	extend : 'Ext.grid.Panel',
	title : '报警记录',
	closable : true,
	alias : 'widget.alarmPanel',
	store : Ext.create('BGRM.store.AlarmLog'),
	columns : [ {
		text : '编号',
		width : 100,
		sortable : false,
		hideable : false,
		dataIndex : 'id'
	}, {
		text : '报警原因',
		width : 150,
		dataIndex : 'cause',
		hidden : false
	},{
		text : '操作员',
		width : 150,
		dataIndex : 'user',
		hidden : false
	},{
		text : '报警级别',
		width : 150,
		dataIndex : 'level',
		hidden : false
	} ],
	tbar: [
	       { xtype: 'button', text: '增加' },'-',
	       { xtype: 'button', text: '删除' }
	     ]

});