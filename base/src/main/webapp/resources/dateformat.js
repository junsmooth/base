//--------------------日期格式化开始---------------------
function str2date (str_datetime) {
    str_datetime = (str_datetime == null) ? "" : str_datetime;
    if(str_datetime.length == 0){
        return null;
    }
    var re_date = /^(\d+)\-(\d+)\-(\d+)$/;
    if (!re_date.exec(str_datetime)){
        //return alert("Invalid Datetime format: "+ str_datetime + "\r\n  yyyy-mm-dd");
			throw err;
		}

    return (new Date (RegExp.$1, RegExp.$2-1, RegExp.$3, 0, 0, 0));
}
function str2time (str_datetime) {
    str_datetime = (str_datetime == null) ? "" : str_datetime;
    if(str_datetime.length == 0){
        return null;
    }
    var re_date = /^(\d+)\:(\d+)\:(\d+)$/;
    if (!re_date.exec(str_datetime)){
        //return alert("Invalid Datetime format: "+ str_datetime + "\r\n  HH:MM:SS");
			throw err;
		}
    var d = new Date();
    return (new Date (d.getYear(), d.getMonth(), d.getDate(), RegExp.$1, RegExp.$2, RegExp.$3));
}
function str2datetime (str_datetime) {
    str_datetime = (str_datetime == null) ? "" : str_datetime;
    if(str_datetime.length == 0){
        return null;
    }
    var re_date = /^(\d+)\-(\d+)\-(\d+)\s+(\d+)\:(\d+)\:(\d+)$/;
    if (!re_date.exec(str_datetime)){
        //return alert("Invalid Datetime format: "+ str_datetime + "\r\n  yyyy-mm-dd HH:MM:SS");
			throw err;
		}
    return (new Date ( RegExp.$1, RegExp.$2-1, RegExp.$3, RegExp.$4, RegExp.$5, RegExp.$6));
}

function getNewDate(d)
{
    if(d != null && typeof(d) == 'object')
    {
        if(d.getTime != null){
            return new Date(d.getTime());
        }
    }
    var nd = parseFloat(d);
    if(isNaN(nd))
    {
        return null;
    }
    else
    {
        return new Date(nd);
    }
}

function formatDate(arg)
{
    var d = getNewDate(arg);
    if(d == null) return "";

    var ds = getDateYear(d) + '-';
    ds += getDateMonth(d) + '-';
    ds += getDay(d);

    return ds;
}

function getDateYear(d)
{
    return "" + d.getFullYear();
}
function getDateMonth(d)
{
    var m = d.getMonth() + 1;
    if(m < 10) m = "0" + m;
    return "" + m;
}
function getDay(d)
{
    var day = d.getDate();
    if(day < 10) day = "0" + day;
    return "" + day;
}
function getHour(d)
{
    var h = d.getHours();
    if(h < 10) h = "0" + h;
    return "" + h;
}
function getMinute(d)
{
    var m = d.getMinutes();
    if(m < 10) m = "0" + m;
    return "" + m;
}
function getSecond(d)
{
    var s = d.getSeconds();
    if(s < 10) s = "0" + s;
    return "" + s;
}

function formatTime(arg)
{
    var d = getNewDate(arg);
    if(d == null) return "";

    var ds = getHour(d) + ':';
    ds += getMinute(d) + ':';
    ds += getSecond(d);

    return ds;
}

function formatDateTime(arg)
{
    var d = getNewDate(arg);
    if(d == null) return "";

    var ds = formatDate(arg) + " " + formatTime(arg);
    return ds;
}

function formatDateTimeA()
{
    var d = new Date();
    return formatDateTime(d.getTime());
}
//--------------------日期格式化结束---------------------