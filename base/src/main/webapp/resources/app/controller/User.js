Ext.define('BGRM.controller.User',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.UserPanel'],
	refs : [ {
		ref : 'userPanel',
		selector : 'userPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('userPanel');
		menuController.openTab(testPanel,tabid);
	}
});
