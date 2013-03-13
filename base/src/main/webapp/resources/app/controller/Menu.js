Ext.define('BGRM.controller.Menu', {
	extend : 'Ext.app.Controller',
	refs : [ {
		ref : 'systemmenu',
		selector : 'sytablepanel'
	}, {
		ref : 'tabPanel',
		selector : 'sytablepanel'
	} ],
	// stores : [ 'bastore' ],
	// models : [ 'beianlistmodel' ],
	init : function() {
		this.control({
			'systemmenu' : {
				itemmousedown : this.loadMenu
			}
		});
	},
	loadMenu : function(selModel, record) {
		 var self = this;
		 
		if (record.get('leaf')) {
			var panel = Ext.getCmp(record.get('id'));
			var controllerStr='BGRM.controller.'+record.get('controller');
			// controllerStr='BGRM.controller.'+'TestController';
			if (!panel) {
				console.log('Start '+controllerStr);
				Ext.require(controllerStr,function(){
					
					var userController = self.getController(controllerStr);
					 userController.init(self,controllerStr);
				},self);
			} else {
				var main = Ext.getCmp("content_panel");
				main.setActiveTab(panel);
			}
		}

	},
	openTab : function(panel, id) {
		var o = (typeof panel == "string" ? panel : id || panel.id);
		var main = Ext.getCmp("content_panel");
		var tab = main.getComponent(o);
		if (tab) {
			main.setActiveTab(tab);
		} else if (typeof panel != "string") {
			panel.id = o;
			var p = main.add(panel);
			main.setActiveTab(p);
		}
	}

});
