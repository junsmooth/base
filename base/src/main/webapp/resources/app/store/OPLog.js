Ext.define('BGRM.store.OPLog', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.OPLog',
	model : 'BGRM.model.OPLog',
	data : [ {
		id : '1',
		user : 'admin',
		op : 'admin进行了用户修改操作'

	} ]
});