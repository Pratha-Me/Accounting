/*
 <input type="text" id="itemName" onkeyup="getChartOfItem('itemName','itemCode')" onkeydown="moveFocus(event,'itemName','itemCode');" onfocus=" showAc('itemName','itemCode') " class="form-control">
<select id="itemCode" class="form-control" onblur="setAc('itemCode','itemName',this.selectedIndex)" size="4"></select> */

var chartOfItem = [];
function getChartOfItem(itemName, itemCode) {
    var item = document.getElementById(itemName).value;
    var len = item.length;
    var da = item.substring(len - 1, len);
    if (da === " ") {
        item = item.substring(0, len - 1);
        $('#' + itemCode).empty();
        if (item.length > 0) {
            var requestData = {"itemName": item, "controlAccount": "Y"};
            $.ajax({type: "GET", url: path + "/api/Account/InventoryItem", data: requestData, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    chartOfItem = data;
                    $('#' + itemCode).show();
                    for (var i = 0; i < data.length; i++)
                        $('#' + itemCode).append('<option value="' + chartOfItem[i].acCode + '">' + chartOfItem[i].acName + '</option>');
                }});
        }
    }
}

function getSundryDebtors(itemName, itemCode) {
    var item = document.getElementById(itemName).value;
    var len = item.length;
    var da = item.substring(len - 1, len);
    if (da === " ") {
        item = item.substring(0, len - 1);
        $('#' + itemCode).empty();
        if (item.length > 0) {
            var requestData = {"itemName": item, "controlAccount": "Y"};
            $.ajax({type: "GET", url: path + "/api/Account/SundryDebtors", data: requestData, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    chartOfItem = data;
                    $('#' + itemCode).show();
                    for (var i = 0; i < data.length; i++)
                        $('#' + itemCode).append('<option value="' + chartOfItem[i].acCode + '">' + chartOfItem[i].acName + '</option>');
                }});
        }
    }
}


function getSundryCreditors(itemName, itemCode) {
    var item = document.getElementById(itemName).value;
    var len = item.length;
    var da = item.substring(len - 1, len);
    if (da === " ") {
        item = item.substring(0, len - 1);
        $('#' + itemCode).empty();
        if (item.length > 0) {
            var requestData = {"itemName": item, "controlAccount": "Y"};
            $.ajax({type: "GET", url: path + "/api/Account/SundryCreditors", data: requestData, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
                success: function (data) {
                    chartOfItem = data;
                    $('#' + itemCode).show();
                    for (var i = 0; i < data.length; i++)
                        $('#' + itemCode).append('<option value="' + chartOfItem[i].acCode + '">' + chartOfItem[i].acName + '</option>');
                }});
        }
    }
}
function moveFocus(eventRef, itemCode, itemName)
{
    var charCode = (window.event) ? eventRef.keyCode : eventRef.which;
    if ((charCode === 40)) {
        document.getElementById(itemName).focus();
        document.getElementById(itemName).selectedIndex = 0;
        document.getElementById(itemCode).value = chartOfItem[0].acName;
    }
}

function showAc(itemName, itemCode) {
    if (document.getElementById(itemName).value.length > 0) {
        $('#' + itemCode).show();
    } else {
        $('#' + itemCode).hide();
    }
}
function setAc(itemCode, itemName, selectedIndex) {
    $('#' + itemCode).hide();
    document.getElementById(itemName).value = chartOfItem[selectedIndex].acName;
}
function setAcUnit(itemCode, itemName,unit, selectedIndex) {
    $('#' + itemCode).hide();
    document.getElementById(itemName).value = chartOfItem[selectedIndex].acName;
     document.getElementById(unit).value = chartOfItem[selectedIndex].unit;
}