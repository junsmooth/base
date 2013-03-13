Ext.define('BGRM.controller.Report',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.Report'],
	refs : [ {
		ref : 'Report',
		selector : 'Report'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('Report');
		menuController.openTab(testPanel,tabid);
	}
});
