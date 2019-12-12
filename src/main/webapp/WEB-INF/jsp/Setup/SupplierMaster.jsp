<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../login/header.jsp"%>
<script src="<%=path%>/Bootstrap/js/InventoryAccount.js" type="text/javascript"></script>
        <fieldset>  <legend>Create New Supplier</legend> 
<form method='POST' id='dataFrom'> 
<div class="row">
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6' hidden>
<label>Id</label>
<input type='text' name='id' id='id' class='form-control'/>
</div>
<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
<label>Code</label>
<input type='text' name='code' id='code' class='form-control'/>
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
<label>Pan Vat No</label>
<input type='text' name='panVatNo' id='panVatNo' class='form-control'/>
</div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
<label>Phone No</label>
<input type='text' name='mobileNo' id='mobileNo' class='form-control'/>
</div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
<label>Status</label>
<select name='status' id='status' class='form-control'>
    <option value="Y">Active</option>
    <option value="N">Passive</option>
</select>
</div>
    <div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
<label>Sundry Creditors</label>
<input type="text" id="sundryCreditorsName" onkeyup="getSundryCreditors('sundryCreditorsName','sundryCreditors')" onkeydown="moveFocus(event,'sundryCreditorsName','sundryCreditors');" onfocus=" showAc('sundryCreditorsName','sundryCreditors') " class="form-control">
<select id="sundryCreditors" name='sundryCreditors' class="form-control sundryCreditors" onblur="setAc('sundryCreditors','sundryCreditorsName',this.selectedIndex)" size="4" style='display: none'></select>
</div>  
 
<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
  
  <label id='ActionMSG'>&nbsp;</label><br>
<input type='button' onclick='doSave()' id='Save' value='Save' class='btn btn-success'/>
<input type='button' onclick='doUpdate()'  id='Update' value='Update' class='btn btn-success' style='display: none'/></div>
</div>
</form>
</fieldset>  <br> <fieldset>  <legend>Supplier Details</legend> 
 <div class='row' id='table'></div>
</fieldset>
<script>
function edit(sn){
       var dataTable = document.getElementById("dataTable").rows[sn];
        var sundryDebtors = dataTable.cells.item(6).innerHTML;
          $("#sundryCreditors").empty().append("<option>" + sundryDebtors + "</option>");
        document.getElementById('sundryCreditorsName').value = sundryDebtors;
var id = ['id','code','name','address','panVatNo','status','sundryCreditors','mobileNo'];
for( var i=0;i<id.length;i++)
document.getElementById(id[i]).value=dataTable.cells.item(i).innerHTML;
  $('#Update').show();$('#Save').hide();
document.getElementById('Update').focus();
}</script>
<script>
 function callApi(URL,requestData,apiMethod)
 {
$('.btn').button('loading');
var msg=''; $.ajax({ type: apiMethod, url: URL, headers: {'Authorization':'<%=token%>'}, data: JSON.stringify(requestData), contentType: "application/json; charset=utf-8",dataType: "json",
 success: function(data) {
$('.btn').button('reset');
 if(!data['error']){ $('#Update').hide();$('#Save').show();msg=data['message'];
document.getElementById('dataFrom').reset();
getRecord();
}else{
msg=data['error'].message;
}messages(msg);},
    error: function(XMLHttpRequest, textStatus, errorThrown) {
$('.btn').button('reset'); 
    messages(XMLHttpRequest+" Status: " + textStatus+" Error: " + errorThrown);
    }    });
   }
</script>
<script>
 function doSave()
{
 var dataForm = $('form').serializeArray(); var requestData = {}; $.each(dataForm, function(i, v) {requestData[v.name] = v.value;});
var URL="<%=path%>/api/Setup/SupplierMaster";
callApi(URL,requestData,"POST");
}
 function doUpdate()
{
  var dataForm = $('form').serializeArray(); var requestData = {}; $.each(dataForm, function(i, v) {requestData[v.name] = v.value;});
 var URL="<%=path%>/api/Setup/SupplierMaster/"+document.getElementById('id').value;
callApi(URL,requestData,"PUT");
}
function getRecord()
    {
    var URL="<%=path%>/api/Setup/SupplierMaster";
    $.ajax({type: "GET",url: URL,headers: {'Authorization':'<%=token%>'}, contentType: "application/json; charset=utf-8", dataType: "json", success: function(data){
  if(data.length===0){messages('Record Not Found');document.getElementById('table').innerHTML='';return false;}
document.getElementById('table').innerHTML=`<table class='table table-bordered table-hover table-striped' id='dataTable'><thead>
<tr><th hidden>Id</th><th>Code</th><th>Name</th><th>Address</th><th>Pan Vat No</th><th>Status</th><th>Phone No</th><th>Action</th></tr></thead><tbody></tbody></table>`;
var tableData;
for(var i=0;i<data.length;i++)
{
tableData="<tr><td hidden>"+data[i].id+"</td><td>"+data[i].code+"</td><td>"+data[i].name+"</td><td>"+data[i].address+"</td><td>"+data[i].panVatNo+"</td><td>"+data[i].status+"</td><td hidden>"+data[i].sundryCreditors+"</td><td>"+data[i].mobileNo+"</td><td><a onclick='edit("+(i+1)+")' class='glyphicon glyphicon-edit'></a> | <a onclick='recordDelete("+data[i].id+")' class='glyphicon glyphicon-remove-circle'></a></td></tr>";
$('#dataTable').append(tableData);
}
}
});
}
function recordDelete(id){
if(!confirm('Are you sure'))return;
var URL="<%=path%>/api/Setup/SupplierMaster/"+id;
callApi(URL,"","DELETE");
}
 getRecord();
</script>

<%@include file="../login/footer.jsp" %>

<%--
return "\n{\"id\": \""+id+"\",\"code\": \""+code+"\",\"name\": \""+name+"\",\"address\": \""+address+"\",\"panVatNo\": \""+panVatNo+"\"}";
--%>