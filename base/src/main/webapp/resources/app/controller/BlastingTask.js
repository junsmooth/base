Ext.define('BGRM.controller.BlastingTask',{
	extend: 'Ext.app.Controller',
	requires:['BGRM.view.BlastingTask'],
	refs : [ {
		ref : 'blastingTaskPanel',
		selector : 'blastingTaskPanel'
	}],
	onLaunch : function(){
		
	},
	init: function(app,tabid) {
		var menuController=this.getController('Menu');
		var testPanel=Ext.widget('blastingTaskPanel');
		menuController.openTab(testPanel,tabid);
	}
});
