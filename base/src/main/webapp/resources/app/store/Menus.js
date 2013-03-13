Ext.define('BGRM.store.Menus',{
	extend: 'Ext.data.TreeStore',
	requires: 'BGRM.model.Menu',
	model: 'BGRM.model.Menu',
	proxy: { 
		type: 'ajax', 
		url: 'menu/mainMenu' 
	} 
});