require([ "dojo/store/Memory", "dijit/tree/ObjectStoreModel", "dijit/Tree",
		"dojo/query" ], function(Memory, ObjectStoreModel, Tree, query) {
	var myStore = new Memory({
		data : [ {
			"id" : "treeRoot",
			"label" : "Root"
		}, {
			"id" : "1",
			"label" : "系统管理",
			"parent" : "treeRoot"
		}, {
			"id" : "1.1",
			"label" : "test",
			"parent" : "1",
			"leaf" : "true",
			"url" : "test/info"
		}, {
			"id" : "1.2",
			"label" : "1.2",
			"parent" : "1",
			"leaf" : "true",
			"url":"test/info"
		}, {
			"id" : "2",
			"label" : "权限管理",
			"parent" : "treeRoot"
		}, {
			"id" : "2.1",
			"label" : "2.1",
			"parent" : "2",
			"leaf" : "true"
		}, {
			"id" : "2.2",
			"label" : "2.2",
			"parent" : "2",
			"leaf" : "true"
		}, {
			"id" : "2.3",
			"label" : "2.3",
			"parent" : "2",
			"leaf" : "true"
		} ],
		getChildren : function(item) {
			return this.query({
				parent : this.getIdentity(item)
			});
		}
	});

	// Create the model
	var myModel = new ObjectStoreModel({
		store : myStore,
		labelAttr : "label",
		query : {
			id : 'treeRoot'
		},
		mayHaveChildren : function(item) {
			return !item.leaf;
		}
	});
	dojo.ready(function() {
		var openViewCache={};
		var tree = new Tree({
			model : myModel,
			showRoot : false,
			openOnClick: true,
			// childrenAttr:"children",
			getIconStyle : function(item, opened) {
				var iconStyle = item.iconStyle;
				if (opened && item.iconStyleOpen) {
					iconStyle = item.iconStyleOpen;
				}
				;
				return iconStyle;
			},
			onClick : function(item, node, evt) {
				if (item.leaf) {
					console.log('item clicked' + item);
					var eventStr = item.label;
					console.log(eventStr);
					this.addTab(item);
				}

			},
			addTab : function(item) {
				var name=item.label;
				var url=item.url;
				var tabs = dijit.registry.byId("contentTabs");
				var p=dijit.registry.byId(name);
				if(p){
					tabs.selectChild(p);
					return;
				}
				var pane = new dijit.layout.ContentPane({
					id : name,
					title : name,
					closable : true,
					href : url
				});
				// add the new pane to our contentTabs widget
				tabs.addChild(pane);
				tabs.selectChild(pane);
				
			},
			onDblClick : function(item, node, evt) {
				var eventStr = item['onDblClick'];
				if (eventStr) {
					dojo.eval(eventStr);
				}
			},
			onClose : function(item, node) {
				var eventStr = item['onClose'];
				if (eventStr) {
					dojo.eval(eventStr);
				}
			},
			onOpen : function(item, node) {
				var eventStr = item['onOpen'];
				if (eventStr) {
					dojo.eval(eventStr);
				}
			}
		});
		tree.placeAt(query("#leftTree")[0]);
		tree.startup();
	});
});