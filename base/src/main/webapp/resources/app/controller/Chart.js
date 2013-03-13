Ext.define('BGRM.controller.Chart',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.ChartPanel'],
	refs : [ {
		ref : 'chartPanel',
		selector : 'chartPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('chartPanel');
		menuController.openTab(testPanel,tabid);
	}
});
