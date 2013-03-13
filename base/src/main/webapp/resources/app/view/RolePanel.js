Ext.define('BGRM.view.RolePanel', {
	extend : 'Ext.grid.Panel',
	title : '角色管理',
	closable : true,
	alias : 'widget.rolePanel',
	store : Ext.create('BGRM.store.Roles'),
	columns : [ {
		text : '编号',
		width : 100,
		sortable : false,
		hideable : false,
		dataIndex : 'id'
	}, {
		text : '名称',
		width : 150,
		dataIndex : 'display',
		hidden : false
	} ],
	tbar: [
	       { xtype: 'button', text: '增加' },'-',
	       { xtype: 'button', text: '删除' }
	     ]

});