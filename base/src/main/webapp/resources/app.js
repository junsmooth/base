Ext.Loader.setConfig({enabled: true});
Ext.application({
	name: 'BGRM',
	appFolder: 'app',
	autoCreateViewport:true,
	controllers: [
        'Login',
		'Menu'
    ]
});