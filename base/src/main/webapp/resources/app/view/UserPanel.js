Ext.define('BGRM.view.UserPanel', {
	extend : 'Ext.grid.Panel',
	title : '用户管理',
	closable : true,
	alias : 'widget.userPanel',
	store : Ext.create('BGRM.store.Users'),
	columns : [ {
		text : '编号',
		width : 100,
		sortable : false,
		hideable : false,
		dataIndex : 'id'
	}, {
		text : '姓名',
		width : 150,
		dataIndex : 'name',
		hidden : false
	} , {
		text : '电子邮件',
		width : 150,
		dataIndex : 'email',
		hidden : false
	}, {
		text : '电话',
		width : 150,
		dataIndex : 'telephone',
		hidden : false
	} , {
		text : '地址',
		width : 150,
		dataIndex : 'address',
		hidden : false
	}, {
		text : '角色',
		width : 150,
		dataIndex : 'role',
		hidden : false
	}   ],
	tbar: [
	       { xtype: 'button', text: '增加' },'-',
	       { xtype: 'button', text: '删除' }
	     ]

});