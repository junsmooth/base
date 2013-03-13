Ext.define('BGRM.view.Login',{
	extend:'Ext.window.Window',
	id:'loginForm',
	alias: 'widget.loginForm',
	requires: ['Ext.form.*','BGRM.view.CheckCode'],
	initComponent:function(){
		var checkcode = Ext.create('BGRM.view.CheckCode',{
			cls : 'key',
			fieldLabel : '验证码',
			name : 'CheckCode',
			id : 'CheckCode',
			allowBlank : false,
			isLoader:true,
			blankText : '验证码不能为空',
			codeUrl: 'Kaptcha.jpg',
			width : 160
		});
		var form = Ext.widget('form',{
			border: false,
            bodyPadding: 10,
			fieldDefaults: {
				labelAlign: 'left',
				labelWidth: 55,
				labelStyle: 'font-weight:bold'
			},
			defaults: {
				margins: '0 0 10 0'
			},
			items:[{
				xtype: 'textfield',
                fieldLabel: '用户名',
				blankText : '用户名不能为空',
				name:'j_username',
				id:'UserName',
                allowBlank: false,
				width:240
			},{
				xtype: 'textfield',
                fieldLabel: '密&nbsp;&nbsp;&nbsp;码',
                allowBlank: false,
				blankText : '密码不能为空',
				name:'j_password',
				id:'PassWord',
				width:240,
				inputType : 'password' 
			},checkcode],
			buttons:[{
				id:'loginBtn',
				text:'登录'
			}]
		});
		Ext.apply(this,{
			height: 160,
			width: 280,
			id:'loginWindow',
			title: '用户登陆',
			closeAction: 'hide',
			closable : false, 
			iconCls: 'win',
			layout: 'fit',
			modal : true, 
			plain : true,
			resizable: false,
			items:form
		});
		this.callParent();
	}
});