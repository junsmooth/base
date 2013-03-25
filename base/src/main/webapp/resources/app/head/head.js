require([ "dojo/_base/declare", "dijit/_WidgetBase", "dijit/_TemplatedMixin",
		"dojo/text!app/head/head.html" ], function(declare, _WidgetBase,
		_TemplatedMixin, template) {
	declare("FancyCounter", [ _WidgetBase, _TemplatedMixin ], {
		// counter
		_i : 0,

		// templateString: "<div>" +
		// "<button data-dojo-attach-event='onclick: increment'>press
		// me</button>" +
		// "&nbsp; count: <span data-dojo-attach-point='counter'>0</span>" +
		// "</div>",
		templateString : template,
		increment : function() {
			this.counter.innerHTML = ++this._i;
		}
	});

});
