Ext.define('BGRM.store.BlastingMon', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.BlastingMon',
	model : 'BGRM.model.BlastingMon',
	data : [ {
		depth : 70,
		hole : 1
	}, {
		depth : 58,
		hole : 3
	}, {
		depth : 63,
		hole : 5
	}, {
		depth : 73,
		hole : 7
	}, {
		depth : 78,
		hole : 9
	} ]
});