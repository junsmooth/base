Ext.define('SMS.view.GridView',{
	extend:'Ext.panel.Panel',
	alias: 'widget.gridview',
	cls: 'feed-grid',
	disabled: true,
    requires: ['Ext.toolbar.Toolbar'],
    border: false,
	initComponent:function(){
		Ext.apply(this,{
			closable: true,
			autoScroll:true,
			layout:"fit",
			gridViewConfig:{},
		});
		this.callParent(arguments);
	}
});