var chartOfAccount = [];
function getChartAccount(acName, acCode,controlAccount) {
    var ac = document.getElementById(acName).value;
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $('#' + acCode).empty();
        if (ac.length > 0) {
            var requestData = {"acName": ac,"controlAccount":controlAccount};
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount", data: requestData,headers: {'Authorization':token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    chartOfAccount = data;
                    $('#' + acCode).show();
                    for (var i = 0; i < data.length; i++)
                        $('#' + acCode).append('<option value="' + chartOfAccount[i].acCode + '">' + chartOfAccount[i].acName + '</option>');
                }});
        }
    }
}
function getChartOfAccount(acName, acCode) {
    var ac = document.getElementById(acName).value;
    var len = ac.length;
    var da = ac.substring(len - 1, len);
    if (da === " ") {
        $('#' + acCode).empty();
        if (ac.length > 0) {
            var requestData = {"acName": ac,"controlAccount":"Y"};
            $.ajax({type: "GET", url: path + "/api/Account/ChartOfAccount", data: requestData,headers: {'Authorization':token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    chartOfAccount = data;
                    $('#' + acCode).show();
                    for (var i = 0; i < data.length; i++)
                        $('#' + acCode).append('<option value="' + chartOfAccount[i].acCode + '">' + chartOfAccount[i].acName + '</option>');
                }});
        }
    }
}
function moveFocus(eventRef, acCode, acName)
{
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById(acName).focus();
        document.getElementById(acName).selectedIndex = 0;
        document.getElementById(acCode).value = chartOfAccount[0].acName;
    }
}

function showAc(acName,acCode) {
    if (document.getElementById(acName).value.length > 0) {
        $('#' + acCode).show();
    } else {
        $('#' + acCode).hide();
    }
}
function setAc(itemCode,acName, selectedIndex) {
      $('#' + itemCode).hide();
    document.getElementById(acName).value = chartOfAccount[selectedIndex].acName;
}