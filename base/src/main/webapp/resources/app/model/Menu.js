Ext.define('BGRM.model.Menu', {
extend: 'Ext.data.Model',
fields: ['id', 'text','iconCls','stores','columns','models','controller'],
root: { 
	expanded: true 
}
//, 
//proxy: { 
//	type: 'ajax', 
//	url: 'server/MenuLoader.jsp' 
//} 
});