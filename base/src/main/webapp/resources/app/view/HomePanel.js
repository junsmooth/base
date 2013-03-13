Ext.define('BGRM.view.HomePanel', {
	extend : 'Ext.panel.Panel',
	// html:'This is Home Page',
	alias : 'widget.homePanel',
	id : 'bgrmhomepage',
	title : '首页',
	border : 5,
	//bodyStyle:"background-image:url('images/main.png');",
//	style : {
//		borderColor : 'blue',
//		borderStyle : 'solid'
//	},
	layout : {
		type : 'absolute'
	},
	width:1000,
	height:800,
	items:[{xtype:'tiger'}]

});

Ext.define('BGRM.view.SVG', {
	extend : 'Ext.draw.Component',
	alias : 'widget.svg',
	viewBox : false,
	id:'svgcmp',
	width:1400,
	height:1000
//		,
//	items:[{
//	    type: 'circle',
//	    radius: 10,
//	    fill: '#f00',
//	    x: 10,
//	    y: 10,
//	    group: 'circles'
//	}]
	

});

Ext.define('BGRM.view.Red', {
	extend : 'Ext.Img',
	src : 'images/red.gif',
	border : 5,
	id:'imgred',
	style : {
//		borderColor : 'red',
//		borderStyle : 'solid'
		top: '100px',
		left: '100px'
	},
	draggable:true,
	//autoEl : 'div',
	alias : 'widget.red'

});
Ext.define('BGRM.view.Tiger', {
	extend : 'Ext.Img',
	id : 'imgmain',
	width: 900,
	height: 524,
	laytou:'absolute',
	boder : 5,
	//bodyStyle:"background-image:url('images/main.png');",
	style : {
//		borderColor : 'red',
//		borderStyle : 'solid',
		//position: absolute,
		top: '0px',
		left: '0px'
	},
	
//	autoEl: {
//        tag: 'img',
//        src: 'images/main.png'
//    },
	alias : 'widget.tiger',
	src : 'images/main.png'
	//draggable : true
	//html:'aaa',
	//items:[{xtype:'red'}]

});