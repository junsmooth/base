Ext.define('BGRM.controller.Role',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.RolePanel'],
	refs : [ {
		ref : 'rolePanel',
		selector : 'rolePanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('rolePanel');
		menuController.openTab(testPanel,tabid);
	}
});
