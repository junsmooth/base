require([ "dojo/domReady!", "dojo/query", "dojo/on","dojo/dom", "dojo/parser",
		"dijit/layout/ContentPane", "dijit/registry",
		"dijit/layout/BorderContainer", "dijit/layout/TabContainer",
		"dijit/Toolbar", "dijit/form/Button", "dojo/data/ItemFileReadStore" ],
		function(ready, query, on,dom) {
	var alink=dom.byId("#testa");
	alert(alink);
	on(alink,"click",function(evt){
		
	});
	
});

