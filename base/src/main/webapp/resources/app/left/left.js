require(
		[ "dojo/ready", "dojo/_base/window", "dojo/store/Memory",
				"dijit/tree/ObjectStoreModel", "dijit/Tree", "dojo/query" ],
		function(ready, win, Memory, ObjectStoreModel, Tree, query) {
			var myStore = new Memory({
				data : [ {
					id : 'world',
					name : 'The earth',
					type : 'planet',
					population : '6 billion',
					directory : true

				}, {
					id : 'AF',
					name : 'Africa',
					type : 'continent',
					population : '900 million',
					area : '30,221,532 sq km',
					timezone : '-1 UTC to +4 UTC',
					parent : 'world'
				}, {
					id : 'AS',
					name : 'Asia',
					type : 'continent',
					parent : 'world'
				}, {
					id : 'EU',
					name : 'Europe',
					type : 'continent',
					parent : 'AS',
					leaf:true
				}, {
					id : 'NA',
					name : 'North America',
					type : 'continent',
					parent : 'world'
				}, {
					id : 'SA',
					name : 'South America',
					parent : 'NA',
					leaf : true
				} ],
				getChildren : function(object) {
					return this.query({
						parent : object.id
					});
				}
			});

			// Create the model
			var myModel = new ObjectStoreModel({
				store : myStore,
				query : {
					id : 'world'
				}

			});

			// Create the Tree. Note that all widget creation should be inside a
			// dojo.ready().
			ready(function() {
				var tree = new Tree(
						{
							model : myModel,
							showRoot : false,

							getIconClass : function(/* dojo.store.Item */item, /* Boolean */
									opened) {
								if(item.leaf){ return "dijitLeaf";}else{
									if(opened){
										return "dijitFolderOpend";
									}else{
										return "dijitFolderClosed";
									}
								}
								
//								return myStore.getValue(item, 'directory') ? (opened ? "dijitFolderOpened"
//										: "dijitFolderClosed")
//										: "dijitLeaf";
								
								
							},

						});
				tree.placeAt(query("#leftTree")[0]);
				tree.startup();
			});
		});