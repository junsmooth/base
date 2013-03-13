Ext.define('BGRM.view.OPLog', {
	extend : 'Ext.grid.Panel',
	title : '操作日志',
	closable : true,
	alias : 'widget.oplogpanel',
	store : Ext.create('BGRM.store.OPLog'),
	columns : [ {
		text : '编号',
		width : 100,
		sortable : false,
		hideable : false,
		dataIndex : 'id'
	}, {
		text : '操作员',
		width : 150,
		dataIndex : 'user',
		hidden : false
	},{
		text : '操作内容',
		width : 150,
		dataIndex : 'op',
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