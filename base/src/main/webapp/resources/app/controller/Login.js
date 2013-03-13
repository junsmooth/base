Ext.define('BGRM.controller.Login', {
	extend : 'Ext.app.Controller',
	requires : [ 'BGRM.view.Login' ],
	loginUser:'',
	init: function() {
        this.control({
            '#loginBtn': {
                click: this.onLoginBtnClicked
            },
            '#logoutBtn':{
            	click:this.onLogout
            }
		// ,
		// '#loginForm':{
		// keydown:this.onKeyEnterPressed
		// }
        });
    },
    onLogout:function(){
        Ext.MessageBox.confirm('确认', '您确定要退出本系统吗？ ', function (result) {
            if (result == 'yes') {
                window.location = "j_spring_security_logout";
            }
        });
    },
    onKeyEnterPressed:function(e){
    	console.log('key pressed'+e.getKey());
    },
    onLoginBtnClicked:function(self,e){
		var form = self.up('form').getForm();
		var win = self.up('window');
		var thisControl=this;
		if(form.isValid()){
			form.submit({
				clientValidation: true,
				waitMsg:'请稍后',
				waitTitle:'正在验证登录',
				url:'j_spring_security_check',
				success: function(form, action) {
					win.hide();
					Ext.getCmp('SystemMenus').store.load();
					//Load Home Panel
					thisControl.loadHomePanel();
					
				},
				failure: function(form, action) {
					Ext.MessageBox.show({
						width:150,
						title:"登录失败",
						buttons: Ext.MessageBox.OK,
						msg:action.result.msg
					});
					Ext.getCmp('CheckCode').loadCodeImg();
				}
			});
		}
	
    },
    loadHomePanel:function(){
    	console.log('Load Home Panel');
		var con=this.getController('HomePanel');
		con.init();
    },
    getCurrentUser:function(){
    	Ext.Ajax.request({
			url : 'security/validUser',
			success : function(response) {
				var text = response.responseText;
				if (text.indexOf("success") != -1) {
					var result = Ext.decode(response.responseText);
					if (result.success == true) {
						this.loginUser=result.data;
					} 
				}

			}});
    },
	onLaunch : function() {
		var win = Ext.getCmp('loginForm');
		var self=this;
		if (typeof (win) == 'undefined') {
			win = Ext.create('BGRM.view.Login');
		}
		Ext.Ajax.request({
			url : 'security/validUser',
			success : function(response) {
				var text = response.responseText;
				var showWin=true;
				if (text.indexOf("success") != -1) {
					var result = Ext.decode(response.responseText);
					if (result.success != true) {
						showWin=true;
						
					} else {
						showWin=false;
						var user = result.data;
						var btn=Ext.getCmp('HDCurrentUser').setText(user);
						self.loadHomePanel();
					}
				}else{
					if (win&&showWin) {
						win.show();
					}
				}

			}});

	}
});
