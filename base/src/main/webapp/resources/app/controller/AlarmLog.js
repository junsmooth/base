Ext.define('BGRM.controller.AlarmLog',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.AlarmLogPanel'],
	refs : [ {
		ref : 'alarmPanel',
		selector : 'alarmPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		console.log('init auth controller');
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('alarmPanel');
		menuController.openTab(testPanel,tabid);
	}
});
