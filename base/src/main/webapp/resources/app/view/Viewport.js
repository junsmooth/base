Ext.define('BGRM.view.UNUSEDHeader', {
    extend: 'Ext.Component',
    initComponent: function() {
        Ext.apply(this, {
            xtype: 'box',
			cls: 'header',
			region: 'north',
			html:'<a href="j_spring_security_logout">退出</a><h1>井下智能爆破管理系统</h1>',
			height: 30
        });
        this.callParent(arguments);
    }
});
function ChooseTheme(item, checked) {
    if (checked) {
        var Css = "resources/extjs4/resources/css/";
        cssname = item.id.replace("Skin-", "").toLowerCase();
        Css += "ext-all" + (cssname=="default"?"":"-"+cssname) + ".css";
        Ext.util.CSS.swapStyleSheet(null, Css);
        var exp = new Date();
        exp.setTime(exp.getTime() + 30 * 24 * 60 * 60 * 1000);
        Cookies.set("ThemeCss", Css, exp);
        Cookies.set("ThemeName", item.id, exp);
    }
};
Ext.define('BGRM.view.CfgMenu', {
    extend: 'Ext.menu.Menu',
    id: 'CfgMenu',
    alias: 'widget.CfgMenu',
    items: [
           '-', {
               text: '主题皮肤',
               iconCls: 'Paint',
               menu: {
                   items: [
                        {
                            id:'Skin-Default',
                            text: 'Default',
                            checked: false,
                            group: 'theme',
                            checkHandler:ChooseTheme
                        },'-', {
                            id: 'Skin-Gray',
                            text: 'Gray',
                            checked: false,
                            group: 'theme',
                            checkHandler: ChooseTheme
                        }, '-', {
                            id: 'Skin-Access',
                            text: 'Access',
                            checked: false,
                            group: 'theme',
                            checkHandler: ChooseTheme
                        }
                   ]
               }
           }
       ]
    
});

Ext.define('BGRM.view.Viewport',{
	extend: 'Ext.Viewport',
	layout: 'fit',
	hideBorders: true,
	requires : [
		'BGRM.view.Header',
		'BGRM.view.Menu',
		'BGRM.view.TabPanel',
		'BGRM.view.South'
	],
	initComponent : function(){
		var me = this;
        Ext.apply(me, {
            items: [{
            	id:'desk',
				layout: 'border',
				items: [
					Ext.create('BGRM.view.Header'),
					Ext.create('BGRM.view.Menu'),
					Ext.create('BGRM.view.TabPanel'),
					Ext.create('BGRM.view.South')
				]
				
			}]
        });
        me.callParent(arguments);
	}
});
