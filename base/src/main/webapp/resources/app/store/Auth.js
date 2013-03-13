Ext.define('BGRM.store.Auth', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.Auth',
	model : 'BGRM.model.Auth',
	// proxy: {
	// type: 'ajax',
	// url: 'user/users',
	// reader: {
	// type: 'json',
	// root: 'data'
	// }
	// },
	data : [ {
		id : '1',
		role : '系统管理员',
		auth : '系统管理'

	}, {
		id : '2',
		role : '车间主任',
		auth : '查看、操作'

	} ]
});