<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../login/header.jsp"%>
<!--<script src="../Bootstrap/js/InventoryAccount.js" type="text/javascript"></script>-->
<!--<input type="text" id="acName" onkeyup="getChartOfAccount('acName','acCode')" onkeydown="moveFocus(event,'acName','acCode');" onfocus=" showAc('acName','acCode') " class="form-control">
<select id="acCode" class="form-control" onblur="$('#acCode').hide();" onchange="setAc('acName',this.selectedIndex)" size="4"></select>-->
<fieldset>  <legend>Fiscal Year</legend> 
    <form method='POST' id='dataFrom'> 
        <div class="row">
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Fy Symbol</label>
                <input type='text' name='fySymbol' id='fySymbol' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Fiscal Year</label>
                <input type='text' name='fiscalYear' id='fiscalYear' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Start Date</label>
                <input type='text' name='startDate' id='startDate' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>End Date</label>
                <input type='text' name='endDate' id='endDate' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Status</label>
                <select name='status' id='status' class='form-control'>
                    <option value="Y">Active</option>
                    <option value="N">Passive</option>
                </select>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>

                <label id='ActionMSG'>&nbsp;</label><br>
                <input type='button' onclick='doSave()' id='Save' value='Save' class='btn btn-success'/>
                <input type='button' onclick='doUpdate()'  id='Update' value='Update' class='btn btn-success' style='display: none'/></div>
        </div>
    </form>
</fieldset>  <br> <fieldset>  <legend>Fiscal Year Details</legend> 
    <div class='row' id='table' ></div>
</fieldset>
<script>
    function edit(sn) {
        var id = ['fySymbol', 'fiscalYear', 'startDate', 'endDate', 'status'];
        for (var i = 0; i < id.length; i++)
            document.getElementById(id[i]).value = document.getElementById("dataTable").rows[sn].cells.item(i).innerHTML;
        $('#Update').show();
        $('#Save').hide();
        document.getElementById('Update').focus();
    }</script>
<script>
    function callApi(URL, requestData, apiMethod)
    {
        $('.btn').button('loading');
        var msg = '';
        $.ajax({type: apiMethod, url: URL, headers: {'Authorization': '<%=token%>'}, data: JSON.stringify(requestData), contentType: "application/json; charset=utf-8", dataType: "json",
            success: function (data) {
                $('.btn').button('reset');
                if (!data['error']) {
                    $('#Update').hide();
                    $('#Save').show();
                    msg = data['message'];
                    document.getElementById('dataFrom').reset();
                    getRecord();
                } else {
                    msg = data['error'].message;
                }
                messages(msg);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $('.btn').button('reset');
                messages(XMLHttpRequest + " Status: " + textStatus + " Error: " + errorThrown);
            }});
    }
</script>
<script>
    function doSave()
    {
        var dataForm = $('form').serializeArray();
        var requestData = {};
        $.each(dataForm, function (i, v) {
            requestData[v.name] = v.value;
        });
        var URL = "<%=path%>/api/Setup/FiscalYear";
        callApi(URL, requestData, "POST");
    }
    function doUpdate()
    {
        var dataForm = $('form').serializeArray();
        var requestData = {};
        $.each(dataForm, function (i, v) {
            requestData[v.name] = v.value;});
        var URL = "<%=path%>/api/Setup/FiscalYear/" + document.getElementById('fySymbol').value;
        callApi(URL, requestData, "PUT");
    }
    function getRecord()
    {
        var URL = "<%=path%>/api/Setup/FiscalYear";
        $.ajax({type: "GET", url: URL, headers: {'Authorization': '<%=token%>'}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {
                if (data.length == 0) {
                    messages('Record Not Found');
                    document.getElementById('table').innerHTML = '';
                    return false;
                }
                document.getElementById('table').innerHTML = `<table class='table table-bordered table-hover table-striped' id='dataTable'><thead>
<tr><th>Fy Symbol</th><th>Fiscal Year</th><th>Start Date</th><th>End Date</th><th>Status</th><th>Action</th></tr></thead><tbody></tbody></table>`;
                var tableData;
                for (var i = 0; i < data.length; i++)
                {
                    tableData = "<tr><td>" + data[i].fySymbol + "</td><td>" + data[i].fiscalYear + "</td><td>" + data[i].startDate + "</td><td>" + data[i].endDate + "</td><td>" + data[i].status + "</td><td><a onclick='edit(" + (i + 1) + ")' class='glyphicon glyphicon-edit'></a> | <a onclick='recordDelete(" + data[i].fySymbol + ")' class='glyphicon glyphicon-remove-circle'></a></td></tr>";
                    $('#dataTable').append(tableData);
                }
            }
        });
    }
    function recordDelete(id) {
        if (!confirm('Are you sure'))
            return;
        var URL = "<%=path%>/api/Setup/FiscalYear/" + id;
        callApi(URL, "", "DELETE");
    }
    getRecord();
</script>

<%@include file="../login/footer.jsp" %>

<%--
return "\n{\"fySymbol\": \""+fySymbol+"\",\"fiscalYear\": \""+fiscalYear+"\",\"startDate\": \""+startDate+"\",\"endDate\": \""+endDate+"\",\"status\": \""+status+"\"}";
--%>