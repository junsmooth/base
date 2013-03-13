Ext.define('BGRM.view.AuthPanel', {
	extend : 'Ext.grid.Panel',
	title : '权限管理',
	closable : true,
	alias : 'widget.authPanel',
	store : Ext.create('BGRM.store.Auth'),
	columns : [ {
		text : '编号',
		width : 100,
		sortable : false,
		hideable : false,
		dataIndex : 'id'
	}, {
		text : '角色',
		width : 150,
		dataIndex : 'role',
		hidden : false
	}, {
		text : '权限',
		width : 150,
		dataIndex : 'auth',
		hidden : false
	} ],
	tbar : [ {
		xtype : 'button',
		text : '增加'
	}, '-', {
		xtype : 'button',
		text : '删除'
	} ]

});