Ext.define('BGRM.controller.OPLog',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.OPLog'],
	refs : [ {
		ref : 'oplogpanel',
		selector : 'oplogpanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('oplogpanel');
		menuController.openTab(testPanel,tabid);
	}
});
