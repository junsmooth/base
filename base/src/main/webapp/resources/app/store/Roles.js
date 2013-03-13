Ext.define('BGRM.store.Roles', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.Role',
	model : 'Role',
	proxy: {
         type: 'ajax',
         url: 'user/roles',
         reader: {
             type: 'json',
             root: 'data'
         }
     },
     autoLoad: true
//,
//	data : [ {
//		id : '1',
//		display : '系统管理员'
//
//	}, {
//		id : '2',
//		display : '矿长'
//
//	} ]
});