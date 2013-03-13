Ext.define('BGRM.view.CheckCode', {
	extend : 'Ext.form.field.Text',
	alias : 'widget.checkcode',
	// inputType:'text',
	codeUrl : Ext.BLANK_IMAGE_URL,
	isLoader : true,
	onRender : function(ct, position) {
		this.callParent(arguments);
		this.codeEl = ct.createChild({
			tag : 'img',
			src : Ext.BLANK_IMAGE_URL
		});
		this.codeEl.addCls('x-form-code');
		this.codeEl.on('click', this.loadCodeImg, this);

		if (this.isLoader)
			this.loadCodeImg();
	},
	// seems not used
	// alignErrorIcon: function() {
	// this.errorIcon.alignTo(this.codeEl, 'tl-tr', [2, 0]);
	// },
	validator : function() {
		return true;
	},
	loadCodeImg : function() {
		this.codeEl.set({
			src : this.codeUrl + '?' + Math.random()
		});
	}

});