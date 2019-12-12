<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../login/header.jsp"%>
<script src="<%=path%>/Bootstrap/js/ChartOfAccount.js" type="text/javascript"></script>
<fieldset>  <legend>Add Organization Info</legend> 
    <form method='POST' id='dataFrom'> 
        <div class="row">
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6' hidden="">
                <label>Id</label>
                <input type='text' name='id' id='id' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Name</label>
                <input type='text' name='name' id='name' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Address</label>
                <input type='text' name='address' id='address' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Contact No</label>
                <input type='text' name='contactNo' id='contactNo' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Email</label>
                <input type='text' name='email' id='email' class='form-control'/>
            </div>
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>URL</label>
                <input type='text' name='url' id='url' class='form-control'/>
            </div>
        </div>
        <div class="row">
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Sales Income Account</label>
                <input type="text" id="salesIncomeName" onkeyup="getChartAccount('salesIncomeName', 'salesIncome', 'Y')" onkeydown="moveFocus(event, 'salesIncomeName', 'salesIncome');" onfocus=" showAc('salesIncomeName', 'salesIncome')" class="form-control">
                <select id="salesIncome" name='salesIncome' class="form-control salesIncome" onblur="setAc('salesIncome', 'salesIncomeName', this.selectedIndex)" size="4" style='display: none'></select>
            </div>  
           
             <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Cash Account</label>
                <input type="text" id="cashAccountName" onkeyup="getChartAccount('cashAccountName', 'cashAccount', 'Y')" onkeydown="moveFocus(event, 'cashAccountName', 'cashAccount');" onfocus=" showAc('cashAccountName', 'cashAccount')" class="form-control">
                <select id="cashAccount" name='cashAccount' class="form-control cashAccount" onblur="setAc('cashAccount', 'cashAccountName', this.selectedIndex)" size="4" style='display: none'></select>
            </div>   

             <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Bank Account</label>
                <input type="text" id="bankAccountName" onkeyup="getChartAccount('bankAccountName', 'bankAccount', 'Y')" onkeydown="moveFocus(event, 'bankAccountName', 'bankAccount');" onfocus=" showAc('bankAccountName', 'bankAccount')" class="form-control">
                <select id="bankAccount" name='bankAccount' class="form-control bankAccount" onblur="setAc('bankAccount', 'bankAccountName', this.selectedIndex)" size="4" style='display: none'></select>
            </div>  
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Inventory</label>
                <input type="text" id="inventoryName" onkeyup="getChartAccount('inventoryName', 'inventory', 'N')" onkeydown="moveFocus(event, 'inventoryName', 'inventory');" onfocus=" showAc('inventoryName', 'inventory')" class="form-control">
                <select id="inventory" name='inventory' class="form-control inventory" onblur="setAc('inventory', 'inventoryName', this.selectedIndex)" size="4" style='display: none'></select>
            </div>  
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Sundry Debtors</label>
                <input type="text" id="sundryDebtorsName" onkeyup="getChartAccount('sundryDebtorsName', 'sundryDebtors', 'N')" onkeydown="moveFocus(event, 'sundryDebtorsName', 'sundryDebtors');" onfocus=" showAc('sundryDebtorsName', 'sundryDebtors')" class="form-control">
                <select id="sundryDebtors" name='sundryDebtors' class="form-control sundryDebtors" onblur="setAc('sundryDebtors', 'sundryDebtorsName', this.selectedIndex)" size="4" style='display: none'></select>
            </div>  
            <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
                <label>Sundry Creditors</label>
                <input type="text" id="sundryCreditorsName" onkeyup="getChartAccount('sundryCreditorsName', 'sundryCreditors', 'N')" onkeydown="moveFocus(event, 'sundryCreditorsName', 'sundryCreditors');" onfocus=" showAc('sundryCreditorsName', 'sundryCreditors')" class="form-control">
                <select id="sundryCreditors" name='sundryCreditors' class="form-control sundryCreditors" onblur="setAc('sundryCreditors', 'sundryCreditorsName', this.selectedIndex)" size="4" style='display: none'></select>
            </div> 
        </div>
        <div class="row" >
            <div class='col-lg-12 col-sm-12 col-md-12 col-xs-12' style="text-align: center;margin-top: 20px;">
                <input type='button' onclick='doSave()' id='Save' value='Save' class='btn btn-success'/>
                <!--<input type='button' onclick='doUpdate()'  id='Update' value='Update' class='btn btn-success' style='display: none'/></div>-->
        </div>
        </div>
    </form>
</fieldset>  <br> <fieldset hidden>  
    <div class='row' id='table'></div>
</fieldset>
<script>
    function edit(sn) {
        var dataTable = document.getElementById("dataTable").rows[sn];
        var salesIncome = dataTable.cells.item(6).innerHTML;
        var cashAccount = dataTable.cells.item(7).innerHTML;
        var inventory = dataTable.cells.item(8).innerHTML;
        var sundryDebtors = dataTable.cells.item(9).innerHTML;
        var sundryCreditors = dataTable.cells.item(10).innerHTML;
        var bankAccount = dataTable.cells.item(11).innerHTML;
        $("#salesIncome").empty().append("<option>" + salesIncome + "</option>");
//        document.getElementById('salesIncomeName').value = salesIncome;
        $("#cashAccount").empty().append("<option>" + cashAccount + "</option>");
//        document.getElementById('cashAccountName').value = cashAccount;
        $("#inventory").empty().append("<option>" + inventory + "</option>");
//        document.getElementById('inventoryName').value = inventory;
        $("#sundryDebtors").empty().append("<option>" + sundryDebtors + "</option>");
//        document.getElementById('sundryDebtorsName').value = sundryDebtors;
        $("#sundryCreditors").empty().append("<option>" + sundryCreditors + "</option>");

        $("#bankAccount").empty().append("<option>" + bankAccount + "</option>");
        document.getElementById('bankAccountName').value = bankAccount;

        var id = ['id', 'name', 'address', 'contactNo', 'email', 'url', 'salesIncome', 'cashAccount', 'inventory', 'sundryDebtors', 'sundryCreditors', 'bankAccount', 'salesIncomeName', 'cashAccountName', 'inventoryName', 'sundryDebtorsName', 'sundryCreditorsName', 'bankAccountName'];
        for (var i = 0; i < id.length; i++) {
            console.log(dataTable.cells.item(i).innerHTML);
            document.getElementById(id[i]).value = dataTable.cells.item(i).innerHTML;
        }
     
    }
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

    function doSave()
    {
        var dataForm = $('form').serializeArray();
        var requestData = {};
        $.each(dataForm, function (i, v) {
            requestData[v.name] = v.value;
        });
        var URL = "<%=path%>/api/Setup/OrganizationMaster";
        callApi(URL, requestData, "POST");
    }
  
    function getRecord()
    {
        var URL = "<%=path%>/api/Setup/OrganizationMaster";
        $.ajax({type: "GET", url: URL, headers: {'Authorization': '<%=token%>'}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {
                if (data.length == 0) {
                    messages('Record Not Found');
                    document.getElementById('table').innerHTML = '';
                    return false;
                }
                document.getElementById('table').innerHTML = `<table class='table table-bordered table-hover table-striped' id='dataTable'><thead>
<tr><th>Id</th><th>Name</th><th>Address</th><th>Contact No</th><th>Email</th><th>Url</th><th>Action</th></tr></thead><tbody></tbody></table>`;
                var tableData;
                for (var i = 0; i < data.length; i++)
                {
                    tableData = "<tr><td>" + data[i].id + "</td><td>" + data[i].name + "</td><td>" + data[i].address + "</td><td>" + data[i].contactNo + "</td><td>" + data[i].email + "</td><td>" + data[i].url + "</td><td hidden>" + data[i].salesIncome + "</td><td hidden>" + data[i].cashAccount + "</td><td hidden>" + data[i].inventory + "</td><td hidden>" + data[i].sundryDebtors + "</td><td hidden>" + data[i].sundryCreditors + "</td><td hidden>" + data[i].bankAccount + "</td><td hidden>" + data[i].salesIncomeName + "</td><td hidden>" + data[i].cashAccountName + "</td><td hidden>" + data[i].inventoryName + "</td><td hidden>" + data[i].sundryDebtorsName + "</td><td hidden>" + data[i].sundryCreditorsName + "</td><td hidden>" + data[i].bankAccountName + "</td><td><a onclick='edit(" + (i + 1) + ")' class='glyphicon glyphicon-edit'></a> </td></tr>";
                    $('#dataTable').append(tableData);
                }
                edit(1);
            }
        });
    }
  
    getRecord();
</script>

<%@include file="../login/footer.jsp" %>

<%--
return "\n{\"id\": \""+id+"\",\"name\": \""+name+"\",\"address\": \""+address+"\",\"contactNo\": \""+contactNo+"\",\"email\": \""+email+"\",\"url\": \""+url+"\"}";
--%>