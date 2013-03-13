Ext.define('BGRM.view.Header', {
    extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.BGRMHeader',
    region: 'north',
    border: 0,
    //width:600,
    cls: 'header',
    items: ['<h1>智能爆破管理系统</h1>',
        '->',
        {
            id: 'HDCurrentUser',
            text: '',
            iconCls: 'icon-user'
         
        },'-',
        {
            text: '首选项',
            iconCls: 'icon-config',
            menu: { xtype: 'CfgMenu' }
        }, '-',
        {
            text: '安全退出',
            iconCls: 'Controlpowerblue',
            id: 'logoutBtn',
            tooltip: 'Completed Tasks'
//            	,
//            handler: function () {
//                Ext.MessageBox.confirm('确认', '您确定要退出本系统吗？ ', function (result) {
//                    if (result == 'yes') {
//                        window.location = "j_spring_security_logout";
//                    }
//                });
//            }
        }
    ]
});