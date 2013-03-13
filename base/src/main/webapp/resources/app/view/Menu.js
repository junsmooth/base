Ext.define('BGRM.view.Menu',{
	extend: 'Ext.tree.Panel',
	alias: 'widget.systemmenu',
	requires:['BGRM.store.Menus'],
	initComponent : function(){
		Ext.apply(this,{
			id: 'SystemMenus',
			title: '系统菜单',
			iconCls:'icon-menu',
			margins : '0 0 -1 1',
			useArrows:true,
			region:'west',
			border : false,
			enableDD : false,
			split: true,
			width : 212,
			minSize : 130,
			maxSize : 300,
			rootVisible: false,
			containerScroll : true,
			collapsible : true,
			autoScroll: false,
			store:Ext.create('BGRM.store.Menus')
		});
		this.callParent(arguments);
	}
});