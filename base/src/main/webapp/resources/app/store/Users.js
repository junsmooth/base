Ext.define('BGRM.store.Users', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.User',
	model : 'User',
	data : [ {
		id : '1',
		name : 'admin',
		email : 'admin@bgrimm.com',
		telephone : '13910011911',
		address : '北京市丰台区总部基地',
		role : '系统管理员'

	}, {
		id : '2',
		name : 'zhangsan',
		email : 'admin@bgrimm.com',
		telephone : '13110011911',
		address : '北京市大兴区总部基地',
		role : '矿长'

	} ]
});