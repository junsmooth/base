Ext.define('BGRM.store.bastore', {
    extend: 'Ext.data.Store',
    requires: 'BGRM.model.beianlistmodel',
    model: 'BGRM.model.beianlistmodel',
	pageSize: 20,
	remoteSort: true,
	autoLoad:true,
	proxy: {
		type: 'ajax',
		url: '/server/getbeian.asp',
		reader: {
			root: 'items',
			totalProperty  : 'total'
		},
		simpleSortMode: true
	},
	listeners:{
		update:function(store,record){
			var currPage = store.currentPage;
			//alert(record.get("ID"))
			Ext.Ajax.request({
				url:'/server/getbeian.asp?action=save',
				params:{
					id : record.get("ID"),
					kehu_name:record.get("kehu_name"),
					beianhao:record.get("beianhao"),
					beianpass:record.get("beianpass"),
					beianemail:record.get("beianemail"),
					emailpass:record.get("emailpass"),
					beianzh:record.get("beianzh"),
					beianzhpa:record.get("beianzhpa"),
				},
				success:function(response){
					store.removeAll();
					store.load(currPage);
				}
			});
		},
		remove:function(store,record){
			var currPage = store.currentPage;
			//alert(record.get("ID"))
			Ext.Ajax.request({
				url:'/server/getbeian.asp?action=del',
				params:{
					id : record.get("ID")
				},
				success:function(response){
					store.removeAll();
					store.load(currPage);
				}
			});
		}
	},
	sorters: [{
		property: 'ID',
		direction: 'DESC'
	}]
});