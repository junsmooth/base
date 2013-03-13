Ext.define('BGRM.controller.Auth',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.AuthPanel'],
	refs : [ {
		ref : 'authPanel',
		selector : 'authPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('authPanel');
		menuController.openTab(testPanel,tabid);
	}
});
