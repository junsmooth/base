Ext.define('BGRM.view.South',{
	extend: 'Ext.Toolbar',
	initComponent : function(){
		Ext.apply(this,{
			id:"bottom",
			//frame:true,
			region:"south",
			height:23,
			items:['->',"技术支持:<a href='http://www.bgrimm.com' target='_blank' style='text-decoration:none;'><font color='#0000FF'>http://www.bgrimm.com</font></a>&nbsp;&nbsp;"]
		});
		this.callParent(arguments);
	}
});