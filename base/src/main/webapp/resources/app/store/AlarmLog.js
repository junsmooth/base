Ext.define('BGRM.store.AlarmLog', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.AlarmLog',
	model : 'BGRM.model.AlarmLog',
	data : [ {
		id : '1',
		cause : '2-1#孔药面高度超过设计值',
		user : '张三',
		level:'红色报警'

	} ]
});