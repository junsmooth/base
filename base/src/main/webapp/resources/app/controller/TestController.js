Ext.define('BGRM.controller.TestController',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.TestPanel'],
	refs : [ {
		ref : 'testPanel',
		selector : 'testPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('testPanel');
		menuController.openTab(testPanel,tabid);
	}
});
