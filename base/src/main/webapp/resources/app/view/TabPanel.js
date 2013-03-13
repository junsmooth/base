Ext.define('BGRM.view.TabPanel',{
	extend: 'Ext.tab.Panel',
	alias: 'widget.sytablepanel',
	initComponent : function(){
		Ext.apply(this,{
			id: 'content_panel',
		    region: 'center', 
		    defaults: {
			   autoScroll:true,
			   bodyPadding: 10
		    },
		    activeTab: 0,
		    border: false,
		   //plain: true,
//		    items: [{
//			  id: 'HomePage',
//			  title: '首页',
//			  layout: 'fit',
//			  html:'Default Content'
//			}],
			plugins: Ext.create('Ext.ux.TabCloseMenu')
		});
		this.callParent(arguments);
	}
});