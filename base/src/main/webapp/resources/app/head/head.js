require([ "dojo/_base/declare", "dijit/_WidgetBase", "dijit/_TemplatedMixin",
		"dojo/text!app/head/head.html" ], function(declare, _WidgetBase,
		_TemplatedMixin, template) {
	declare("FancyCounter", [ _WidgetBase, _TemplatedMixin ], {
		_i : 0,
		templateString : template,
		increment : function() {
			this.counter.innerHTML = ++this._i;
		}
	});

});
