 /***表单js验证框架**************************************************************************\ 
 | 2012-11-06 
 |
 | <!--请确保在使用该函数时 引入了jQuery文件 -->
 | 该版本用于日期格式为（yyyy-mm-dd) 
 |
 | 函数名称：jsoncheckform 
 | 传入参数：formID (表单ID) 
 | 返回值：boolean型 (通过验证返回true,否则反之)
 | 函数功能：自动验证表单的输入值。在控件里加入验证属性即可，不需要修改任何代码。 
 | 调用方式：
 		1, ajax表单提交方式： if($("#form表单Id").jsoncheckform({formid:"form表单Id"})){...};
 | 验证属性格式：
 		<input ... checkStr="控件名称" checkType="验证类型" isEmpty="Y" [equal="另一个控件的ID"]>
 		<select ...  checkStr="控件名称" checkType="验证类型" isEmpty="N" >
 		<textarea ... checkStr="控件名称" checkType="验证类型" isEmpty="N">
 | 如果使用equal，请确保 另一个控件的checkStr有值。
 | 类型： 
 | 字符串：string,10,20 (长度最少为10，最大为20的字符串) 
 | 数字： number,-1,10000 (大于-1，小于10000的数字) 
 | 邮 件：email 与正则相比较，为一符合邮伯格式的字符串(admin@163.com) 
 | 身份证：idcard  简单判断是15位或18位的数字
 | QQ：qq  简单判断是长度大于5位的数字
 | 电话：phone 简单判断是否符合(区号)-电话这样格式的字符串
 | 手机：mphone 	判断是否以常见的手机号头三位开头的数字字符串
 | URL: url   判断是否符合url格式的字符串
 | IP: ip  判断是否ip
 | 文件后缀：file, 要增加一个属性为fileExt,如fileExt="gif,GIF,jpg,JPG,bmp,BMP" 为只允许使用gif,jpg,bmp三种文件格式 
 | 验证属性带逗号的表示最小值和最大值，如果不指定则不写，但逗号不能省略 
 | 如果是整数型并且有位数限制：number,0,14 
 | isEmpty="Y": 是否可以为空 为N时不能为空
 \******************************************************************************/

$(function () {
	$.fn.jsoncheckform = function(options){
		var defaults = {
			formid : "formid"	
		};
		var options = $.extend(defaults,options);
		var inputs = $("#" + options.formid).find(":input");	//表单下所有input元素集合
		var obj = null;											//input元素
		var isSuccess = false;									//是否验证成功
		_cleanErrorMsg(options.formid);
		for(i=0; i<inputs.length; i++){
			obj = inputs[i];
			if(obj.type == "hidden" || obj.type == "button") continue;
			isSuccess = false; // 如果中途跳出，isSuccess的值将被保持为false,表示验证未通过
			var checkStr = $(obj).attr("checkStr");
			var checkType = $(obj).attr("checkType");
			if(_isNotEmpty(checkStr)){
				//如果元素值为空并且isEmpty元素值不为Y时，弹出错误提示窗
				if (_isEmpty($(obj).attr("value")) && $(obj).attr("isEmpty") != "Y") {
					_showErrorMsg("『" + checkStr + "』不能为空,请重新输入!",obj); 
					break;
				}
				//检查字符串是否合法
				if(checkType.indexOf("string") > -1 && $(obj).attr("isEmpty") != "Y"){
					var strArray = checkType.split(",");
					if(strArray.length < 3) {
						_showErrorMsg("输入的『" + checkStr + "』检查类型格式不对!(string,最少长度值,最大长度值)",obj);
						break;
					}
					var length = parseInt(obj.value.length);
					var minLength = parseInt(strArray[1]);
					var maxLength = parseInt(strArray[2]);
					if(length < minLength){
						_showErrorMsg("『" + checkStr + "』长度不能小于" + minLength + ",请重新输入",obj);
						break;
					}
					if(length > maxLength){
						_showErrorMsg("『" + checkStr + "』长度不能大于" + maxLength + ",请重新输入",obj);
						break;
					}
					if(_isNotEmpty($(obj).attr("equal")) && $(obj).attr("equal").length > 0){
						var obj2 = $("#"+$(obj).attr("equal"));
						if (obj2 != null) { 
							if (!_compare($(obj),obj2)) {
								_showErrorMsg("『" + $(obj2).attr("checkStr") + "』必须与『" + checkStr + "』相等",obj);
								break;
							}
						}
					}
				}
				//检查url是否合法
				if (checkType == "url") {
					if (!_checkUrl(obj)) {
						_showErrorMsg("输入的『" + checkStr + "』不是合法的网址格式",obj);
						break;
					}
				}
				//检查下拉框是否有选择值
				if (checkType == "select") {
					var id = "#"+formId+" #"+obj.id;
					var val = $(id).val();
					if(_isEmpty(val) || val == "-1"){
						_showErrorMsg("『" + checkStr + "』没有选择，请选择!",obj);
						break;
					}
				}
				//检查单选按钮是否有选中
				if (checkType == "radio") {  
					var val = $("#"+formId+" input[name='"+obj.name+"'][type='radio']:checked").val(); 
					if(_isEmpty(val)){
						_showErrorMsg("『" + checkStr + "』没有选中，请选中!",obj);
						break;
					}
				}
				//检查数字是否合法
				if (/^number/.test(checkType)) {
					var tempArr = _checkNumber(obj);
					if (!tempArr[0]) {
						_showErrorMsg(tempArr[1],obj);
						break;
					}
				}
				//检查email是否合法
				if (checkType == "email") {
					if (!_checkEmail(obj)) {
						_showErrorMsg("输入的『" + checkStr + "』不是合法的邮件格式",obj);
						break;
					}
				}
				//检查身份证号是否合法
				if (checkType == "idcard") {
					if (!_checkIDCard(obj)) {
						_showErrorMsg("输入的『" + checkStr + "』不是合法的身份证",obj);
						break;
					}
				}
				//检查是固定电话号码是否合法
				if (checkType == "phone") {
					if (!_checkPhone(obj)) {
						_showErrorMsg("您输入的『" + checkStr	+ "』不是合法的电话号码格式,请按此格式输入(区号-电话号码[-分机号])",obj);
						break;
					}
				}
				//检查是手机号码是否合法
				if (checkType == "mphone") {
					if (!_checkMobilePhone(obj)) {
						_showErrorMsg("您输入的『" + checkStr+ "』不是合法的手机号码",obj);
						break;
					}
				}
				//检查QQ号码是否合法
				if (checkType == "qq") {
					if (obj.value != "") {
						if (isNaN(obj.value) || obj.value.length < 5) {
							_showErrorMsg("您输入的『" + checkStr + "』不是合法的QQ号码",obj);
							break;
						}
					}
				}
				//检查IP地址是否合法
				if (checkType == "ip") {
					if (!_checkIP(obj)) {
						_showErrorMsg("您输入的『" + checkStr + "』不是合法的IP地址",obj);
						break;
					}
				}
				//检查上传的文件扩展名是否合法
				if (checkType == "file") {
					if (!_checkfilext(obj, $(obj).attr("fileExt"))) {
						_showErrorMsg("您选择的『" + checkStr + "』不是合法的文件格式",obj);
						break;
					}
				}
				//日期比较
				if (checkType == "date") {
					if (_isNotEmpty($(obj).attr("equal")) && $(obj).attr("equal").length > 0) {
						var id = $(obj).attr("equal");
						var obj2 = $("#"+id);
						if (obj2 != null) { 
							if (!_compareDate($(obj),obj2)) {
								_showErrorMsg("『" + checkStr + "』必须大于『"	+ $(obj2).attr("checkStr") + "』",obj);
								break;
							}
						}
					}
				}
			}
			isSuccess = true; // 循环正常结束，未从循环中跳出,验证结果：全部满足要求
		}
		if (!isSuccess) return false;
		return true;
	}
});

 //是否为空(true:是)
function _isEmpty(obj){
	if(obj==null  || typeof(obj) =="undefined" || obj=="undefined" || obj=="" || obj.length == 0 || obj=="null") 
		return true;
	else
	 	return false;
}
//是否不为空(true:是)
function _isNotEmpty(obj){
	return !_isEmpty(obj);
}
//去除两端空格
function trim(str)
{
	return str.replace(/(^\s*)|(\s*$)/g, '');
}
//比较字符串是否相等
function _compare(obj, obj1){
	return trim($(obj).val()) == trim($(obj1).val()) ? true : false;
}
//比较日期(obj1开始日期，obj结束日期)
function _compareDate(obj, obj1) {
	var date1 = obj.attr("value");  //结束日期
	var date2 = $(obj1).attr("value");	//开始日期
	return date1 >= date2 ? true : false;
}
//检查url是否合法
function _checkUrl(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
			+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp的user@
			+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
			+ "|" // 允许IP和DOMAIN（域名）
			+ "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
			+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
			+ "[a-z]{2,6})" // first level domain- .com or .museum
			+ "(:[0-9]{1,4})?" // 端口- :80
			+ "((/?)|" // a slash isn't required if there is no file name
			+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
	var re = new RegExp(strRegex);
	var val = obj.value.toLowerCase();
	return re.test(val) ? (true) : (false);
}
//检查email
function _checkEmail(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	return (/^.*@([\w-]){1,}(\.([\w]){1,}){1,3}$/.test(obj.value));
}
//检查IP地址是否合法
function _checkIP(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	return (/^(((2[0-5][0-5])|([01]\d\d)|(\d\d?))\.){3}((2[0-5][0-5])|([01]\d\d)|(\d\d?))$/.test(obj.value));
}
//检查身份证号码是否合法
function _checkIDCard(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	if (obj.value.length == 15)
		return (/^([0-9]){15,15}$/.test(obj.value));
	if (obj.value.length == 18)
		return (/^([0-9]){17,17}([0-9xX]){1,1}$/.test(obj.value));
	return false;
}
//检查固定电话号码是否合法
function _checkPhone(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	return (/^([0-9]{3,5}\-[0-9]{7,10})$/.test(obj.value));
}
//检查手机号码是否合法
function _checkMobilePhone(obj) {
	if (jQuery(obj).attr("isEmpty") == "Y" && obj.value.length == 0) return true;
	return (/^((13[0-9]|15[0-9]|18[0-9])\d{8})$/.test(obj.value));
}
//检查是否是合法的数字
function _checkNumber(obj) {
	var tempArr = new Array(true, "");
	var val = obj.value;
	if ($(obj).attr("isEmpty") == "Y" && obj.value.length == 0)
		return tempArr;
	if (isNaN(val)) {
		tempArr[0] = false;
		tempArr[1] = "不是合法的数字，请重新输入『" + $(obj).attr("checkStr") + "』";
	}
	var numberArr = $(obj).attr("checkType").split(",");
	if(numberArr.length < 2){
		tempArr[0] = false;
		tempArr[1] = "请输入正确的数值验证格式：『number,最小值,最大值』";
	}
	var minNumber = parseFloat(numberArr[1]);
	var maxNumber = parseFloat(numberArr[2]);
	if (val < minNumber) {
		tempArr[0] = false;
		tempArr[1] = "不能小于" + minNumber + ",请重新输入『" + $(obj).attr("checkStr") + "』,取值范围在"+minNumber+"~"+maxNumber+"之间！";
	}
	if (val > maxNumber) {
		tempArr[0] = false;
		tempArr[1] = "不能大于" + maxNumber + ",请重新输入『" + $(obj).attr("checkStr") + "』,取值范围在"+minNumber+"~"+maxNumber+"之间！";
	}
	return tempArr;
}
function _showErrorMsg(msg,obj){
	if(_isNotEmpty(obj)){
		var id = obj.id+"Tip"
		var obj2 = $("#"+obj.id+"Tip2");
		if(_isNotEmpty(obj2))	$(obj2).remove();
		$(obj).parent().append("<div id='"+id+"' class='onShow'>"+msg+"</div>");
		$(obj).focus();
		$(obj).select();
	}
}
function _cleanErrorMsg(formId){
	var form = $("#"+formId);							//根据传进来的formId实例化一个jquery对象
 	var inputs = $(form).find(":input");				//表单下的所有input元素集合
	var obj = null;										//input元素
	for (i = 0; i < inputs.length; i++) {
		obj = inputs[i];
		if(obj.type == "hidden" || obj.type == "button") continue;
		if(_isNotEmpty(obj)){
			var id = "#"+obj.id+"Tip"
			$(id).remove();
		}
	}
}