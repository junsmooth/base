function checkInteger(oInput) {
	if ('' != oInput.value.replace(/^[1-9]\d*$/, "")) {
		oInput.value = oInput.value.match(/^[1-9]\d*$/) == null ? ""
				: oInput.value.match(/^[1-9]\d*$/);
	}
}
function checkFloat(oInput) {
	var flength=oInput.value.length;
	if(flength>=14){
		var ch=oInput.value.charAt(13)
		if(ch!='.'){
			oInput.value=oInput.value.substr(0,13)
		}else if(flength>17){
			oInput.value=oInput.value.substr(0,17)
		}
	}
	var reg=/^\s*$/;
	if(!reg.test(oInput.value)){
		if (oInput.value.length == 1) {
			if (isNaN(oInput.value)) {
				oInput.value = oInput.value.match(/-?/) == null ? "" : oInput.value.match(/-?/);
			}
		} else {
			if ('' != oInput.value.replace(/-?\d{1,}\.{0,1}\d{0,}/, "")) {
				oInput.value = oInput.value.match(/-?\d{1,}\.{0,1}\d{0,}/) == null ? ""
						: oInput.value.match(/-?\d{1,}\.{0,1}\d{0,}/);
			}
		}
	}else{
		oInput.value="";
	}
}
function validateDate(element) {
	var strValue = element.value;
	var objRegExp = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$/
	if (objRegExp.test(strValue) || strValue == "") {
		return true;
	} else {
		alert("���ڸ�ʽ����ȷ��yyyy-MM-dd HH:mm:ss��");
		element.value = "";
		return false;
	}
}function validateDate2(element) {
	  var strValue=element.value;
      var objRegExp = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/ 
      if(objRegExp.test(strValue)||strValue==""){
    	  return true;
      }else{
    	  alert("���ڸ�ʽ����ȷ��yyyy-MM-dd��");
    	  element.value="";
          return false;  
	  }
 }
//*************************************Double����֤����************************************
 function fcheck(obj,n){   
   var value=obj.value;
   if(value!=""){
      n = n > 0 && n <= 20 ? n : 2;   
      value = parseFloat((value + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";  
      var l = value.split(".")[0].split("").reverse();
      r = value.split(".")[1];
      t = "";   
      for(i = 0; i < l.length; i ++ ){   
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "" : "");   
      }   
      obj.value= t.split("").reverse().join("") + "." + r;  
   }else{
	  obj.value="";
   }
}  

 function checkIDCard(oInput){ 
	  var strValue=oInput.value;
      var objRegExp = /d{17}\d{1}|X/ 
      if(objRegExp.test(strValue)||strValue==""){
    	  return true;
      }else{
    	  alert("���֤��ʽ����ȷ");
    	  oInput.value="";
    	  oInput.focus();
          return false;  
	  }
 }
 function checkNull(itemName,oInput){
	 var strValue=oInput.value;
	 if(strValue==""||strValue==null){
		alert(itemName+"����Ϊ��"); 
	    oInput.focus();
		return false;
	 }else{
		return true;
	 }
 }
 function checkEmail(oInput){ 
	  var strValue=oInput.value;
      var objRegExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/ 
      if(objRegExp.test(strValue)){
    	  return true;
      }else if(strValue==""){
    	  alert("Email����Ϊ��");
          return false;  
      }{
    	  alert("Email��ʽ����ȷ");
    	  oInput.value="";
    	  oInput.focus();
          return false;  
	  }
  }
  function checkMobile(oInput){ 
	  var strValue=oInput.value;
      var objRegExp = /\d{11}/ 
      if(objRegExp.test(strValue)){
    	  return true;
      }else if(strValue==""){
    	  alert("�ֻ����벻��Ϊ��");
          return false;  
      }else{
    	  alert("�ֻ������ʽ����ȷ");
    	  oInput.value="";
    	  oInput.focus();
          return false;  
	  }
  }
  function checkPhone(itemName,oInput){ 
	  var strValue=oInput.value;
      var objRegExp = /\d{3}-\d{8}|\d{4}-\d{7}/ 
      if(objRegExp.test(strValue)||strValue==""){
    	  return true;
      }else{
    	  alert(itemName+"��ʽ����ȷ");
    	  oInput.value="";
    	  oInput.focus();
          return false;  
	  }
  }
  function checkSelect(itemName,oInput){
	 var strValue=oInput.value;
	 if(strValue==0){
		alert(itemName+"����Ϊ��"); 
		return false;
	 }else{
		return true;
	 }
  }
  function checkPostCode(oInput){
	 var strValue=oInput.value;
     var objRegExp = /\d{3}-\d{8}|\d{4}-\d{7}/ 
	 if(objRegExp.test(strValue)||strValue==null){
		alert("�ʱ��ʽ����ȷ"); 
	    oInput.focus();
		return false;
	 }else{
		return true;
	 }
 }
		function returnSubmit(){
	       if(checkNull('�û�����',document.forms[0].name)){
	          if(checkSelect('���ڲ���',document.forms[0].department)){
	        	  if(checkPostCode(document.forms[0].postCode)){
	        		  if(checkPhone('�칫�绰',document.forms[0].office_Tel)){
	        			 if(checkPhone('סլ�绰',document.forms[0].home_Tel)){
	        				 if(checkMobile(document.forms[0].mobliePhone)){
	        					 if(checkEmail(document.forms[0].email)){
	        						 if(checkIDCard(document.forms[0].card_num)){
	        							 if(checkSelect('��������',document.forms[0].alarm_id)){
	        								 return true;
	        							 }else{
	        								 return false;
	        							 }
	        						 }else{
	        							return false;  
	        						 }
	        					 }else{
	        						return false;  
	        					 }  
	        				 }else{
	        					return false; 
	        				 }
	        			 }else{
	        				return false;
	        			 }
	        		  }else{
	        			 return false;
	        		  }
	        	  }else{
	    	         return false;
	              }
	          }else{
	    	     return false;
	          }
	       }else{
	    	  return false;
	       }
        }