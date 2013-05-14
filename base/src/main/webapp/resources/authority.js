auths=0;
function hasRole(role) {
	if (role == '') {
		return true;
	} else {
		if (auths==0) {
			$.ajax({
				type : "POST",
				url : 'security/authority',
				cache : false,
				async : false,
				success : function(data) {
					auths = data;
				}
			})
		}

	}
	if (auths!=0) {
		if(contains('ROLE_SYSTEM')){
			return true;
		}
		if(contains(role)){
			return true;
		}
		return false;
	}
}
function contains(role){
	for(var i=0;i<auths.length;i++){
		if(role==auths[i]){
			return true;
		}
	}
	return false;
}