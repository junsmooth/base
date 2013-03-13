Ext.define('BGRM.controller.BlastingMon',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.BlastingMon'],
	refs : [ {
		ref : 'BlastingMonPanel',
		selector : 'BlastingMonPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('BlastingMonPanel');
		menuController.openTab(testPanel,tabid);
	}
});
