Ext.define('BGRM.store.Chart', {
	extend : 'Ext.data.Store',
	requires : 'BGRM.model.Chart',
	model : 'BGRM.model.Chart',
	data : [{
		temperature : 70,
		date : new Date(2011, 1, 1, 01)
	}, {
		temperature : 58,
		date : new Date(2011, 1, 1, 8)
	}, {
		temperature : 63,
		date : new Date(2011, 1, 1, 9)
	}, {
		temperature : 73,
		date : new Date(2011, 1, 1, 10)
	}, {
		temperature : 78,
		date : new Date(2011, 1, 1, 11)
	}, {
		temperature : 81,
		date : new Date(2011, 1, 1, 12)
	}, {
		temperature : 76,
		date : new Date(2011, 1, 1, 13)
	}, {
		temperature : 70,
		date : new Date(2011, 1, 1, 14)
	} ,{
		temperature : 60,
		date : new Date(2011, 1, 1, 21)
	}]
});