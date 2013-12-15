require([ "dojo/query", "dojo/on", "dojo/dom", "dijit/registry",
		"dijit/layout/ContentPane", "dojo/domReady!" ], function(query, on,
		dom, registry, ContentPane) {
	var nodes = query("#menu a");
	nodes.on("click", function(e) {
		var url = e.target.getAttribute("url");
		var title = e.target.innerHTML;
		var lastTab = registry.byId(url);
		var tabs = registry.byId("contentTabs");
		var index = tabs.getIndexOfChild(lastTab);
		console.log(index);
		if (index == -1) {
			var cp1 = new ContentPane({
				id : url,
				title : title,
				href : url,
				closable : true
			});

			tabs.addChild(cp1);
			tabs.selectChild(cp1);
		}else{
			tabs.selectChild(lastTab);
		}

	});
});
require(['dojo/_base/lang', 'dojox/grid/DataGrid', 'dojo/data/ItemFileWriteStore', 'dojo/dom']);
