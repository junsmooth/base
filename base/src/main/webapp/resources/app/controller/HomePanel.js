Ext.define('BGRM.controller.HomePanel', {
			extend : 'Ext.app.Controller',
			requires : ['BGRM.view.HomePanel'],
			stack : new Stack(),
			init : function() {
				var self = this;
				var menuController = this.getController('Menu');
				var testPanel = Ext.widget('homePanel');
				menuController.openTab(testPanel, 0);
				// var myMask = new Ext.LoadMask(Ext.getCmp('bgrmhomepage'), {
				// msg : "数据加载中，请稍等"
				// });
				// myMask.show();
				// var drawComponent = Ext.create('Ext.draw.Component', {
				// viewBox : false
				// // items : [{
				// // type : 'circle',
				// // fill : '#79BB3F',
				// // radius : 100,
				// // x : 100,
				// // y : 100
				// // }]
				// });
				//
				// Ext.getCmp('bgrmhomepage').add(drawComponent);
				// surface = drawComponent.surface;
				// alert(1);
				// var sp = surface.add([{
				// type : 'circle',
				// radius : 100,
				// fill : '#f00',
				// x : 400,
				// y : 400,
				// group : 'circles',
				// surface : drawComponent.surface
				// }]);
				// Ext.Array.each(sp, function(p) {
				// p.show(true);
				// });
				// Ext.getCmp('bgrmhomepage').doLayout();
//				Ext.Ajax.request({
//							url : 'homepage/data',
//							success : function(response) {
//								var result = Ext.decode(response.responseText);
//								var surface = Ext.getCmp('svgcmp').surface;
//								// result.surface=surface;
//								// var sp = surface.add([{
//								// fill : "#f00",
//								// radius : 10,
//								// type : "circle",
//								// y : 10,
//								// x : 10,
//								// surface :surface
//								// }]);
//								for (var i = 0; i < result.length; i++) {
//									result[i].surface = surface;
//								}
//								var sp = surface.add(result);
//								Ext.Array.each(sp, function(p) {
//											p.show(true);
//										});
//								Ext.getCmp('bgrmhomepage').doLayout();
//								myMask.hide();
//							}
//						});

				Ext.get('imgmain').on({
							'dblclick' : {
								fn : function() {
									alert(1);
								}
							},
							'click' : {
								fn : function(evt, el, o) {
									var p = evt.getXY();
									// alert(evt.getX()+","+evt.getY());
									// alert(p[0]+","+p[1]);
								}
							},
							'mousewheel' : {
								fn : function(e) {
									// Ext.get('imgmain').setWidth(2000);
									var delta = e.getWheelDelta();
									if (delta > 0) {
										var w = Ext.get('imgmain').getWidth();
										var h = Ext.get('imgmain').getHeight();
										console.log('width:' + w + ",height:"
												+ h);
										self.stack.Push({
													'w' : w,
													'h' : h
												});
										Ext.get('imgmain').setWidth(w * 1.01);
										Ext.get('imgmain').setHeight(h * 1.01);

									} else {
										var s = self.stack.Pop();
										if (s != -1) {
											Ext.get('imgmain').setWidth(s.w);
											Ext.get('imgmain').setHeight(s.h);
										}

									}
								}
							}
						});

			},
			onMainMouseWheel : function() {
				alert('mousewheel');
			},
			onLaunch : function() {
				alert(1);
			}
		});

function Stack() {
	this.STACKMAX = 100;
	this.stack = new Array(this.STACKMACK);
	this.top = -1;
}
Stack.prototype.Push = function(elem) {

	if (this.top == this.STACKMAX - 1) {
		return "栈满";
	} else {
		this.top++;
		this.stack[this.top] = elem;
	}

}
Stack.prototype.Pop = function() {
	if (this.top == -1) {
		return -1;
	} else {
		var x = this.stack[this.top];
		this.top--;
		return x;
	}

}
Stack.prototype.Top = function() {
	if (this.top != -1) {
		return this.stack[this.top];
	} else {
		return "空栈，顶元素无返回值！";
	}
}
Stack.prototype.Empty = function() {

	if (this.top == -1) {
		return true;
	} else {
		return false;
	}

}
Stack.prototype.Clear = function() {
	this.top = -1;
}
Stack.prototype.Length = function() {
	return this.top + 1;
}
