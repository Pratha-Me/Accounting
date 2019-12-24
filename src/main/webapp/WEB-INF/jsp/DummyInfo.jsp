<%-- 
    Document   : DummyInfo
    Created on : Nov 26, 2019, 7:31:36 AM
    Author     : hp
--%>

<%@include file="login/header.jsp" %>

<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/util_table.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/Bootstrap/css/main_table.css">

<script defer src="<%=path%>/Bootstrap/js/main.js"></script>
<!--
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/> @
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css"> @

<script defer src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script defer src="vendor/bootstrap/js/popper.js"></script>
<script defer src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script defer src="vendor/select2/select2.min.js"></script> @
<script defer src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script> @
<script defer src="js/main.js"></script>
-->

<div class="row" style="display:flex; align-content: flex-start; justify-content: center;">
	<div class = "col-lg-10">
		<fieldset>  <legend>ADD INFO</legend> 
			<form method='POST' id='dataFrom'> 
				<div class="row">
					<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6' hidden>
						<label>id</label>
						<input type='text' name='id' id='id' class='form-control'/>
					</div>
					<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
						<label>name</label>
						<input type='text' name='name' id='name' class='form-control'/>
					</div>
					<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
						<label>surname</label>
						<input type='text' name='surname' id='surname' class='form-control'/>
					</div>

					<div class='col-lg-2 col-sm-2 col-md-2 col-xs-6'>
						<label id='ActionMSG'>&nbsp;</label><br>
						<input type='button' onclick='doSave()' id='Save' value='Save' class='btn btn-success'/>
						<input type='button' onclick='doUpdate()'  id='Update' value='Update' class='btn btn-success' style='display: none'/>
					</div>
				</div>
			</form>
		</fieldset> 
		<br>
		<fieldset>  <legend>Details</legend> 
			<div class='row' id='table' ></div>
		</fieldset>
	</div>
</div>


<script>

	function edit(sn) {
		var id = ['id', 'name', 'surname'];
		for (var i = 0; i < id.length; i++)
			document.getElementById(id[i]).value = document.getElementById("dataTable").rows[sn].cells.item(i).innerHTML;
		$('#Update').show();
		$('#Save').hide();
		document.getElementById('Update').focus();
	}

	function callApi(URL, requestData, apiMethod)
	{
		$('.btn').button('loading');
		var msg = '';
		$.ajax({type: apiMethod, url: URL, headers: {'Authorization': '<%=token%>'}, data: JSON.stringify(requestData), contentType: "application/json; charset=utf-8", dataType: "json",
			success: function (data) {
				$('.btn').button('reset');
				if (!data['error']) {
					msg = data['message'];
					getRecord();
					document.getElementById('dataFrom').reset();
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
		var URL = "<%=path%>/api/DummyInfo";
		callApi(URL, requestData, "POST");
	}

	function doUpdate()
	{
		var dataForm = $('form').serializeArray();
		var requestData = {};
		$.each(dataForm, function (i, v) {
			requestData[v.name] = v.value;
		});
		var URL = "<%=path%>/api/DummyInfo/" + document.getElementById('id').value;
		callApi(URL, requestData, "PUT");
		$('#Update').hide();
		$('#Save').show();
		document.getElementById('Save').focus();
	}

	function getRecord()
	{
		var URL = "<%=path%>/api/DummyInfo";
		$.ajax({type: "GET", url: URL, headers: {'Authorization': '<%=token%>'}, contentType: "application/json; charset=utf-8", dataType: "json", success: function (data) {
				if (data.length == 0) {
					messages('Record Not Found');
					document.getElementById('table').innerHTML = '';
					return false;
				}
				//<div class='row' id='table' ></div>
				document.getElementById('table').innerHTML = "<table class = 'table table-bordered table-hover table-striped' id = 'dataTable'><thead><tr> <th hidden> id </th><th>Name</th> <th> Surname </th><th>Action</th></tr></thead ><tbody></tbody></table>";
				var tableData;
				for (var i = 0; i < data.length; i++)
				{
					tableData = "<tr><td hidden>" + data[i].id + "</td><td>" + data[i].name + "</td><td>" + data[i].surname + "</td><td><a onclick='edit(" + (i + 1) + ")'><i class=\"fas fa-edit\"></i></a> | <a onclick='recordDelete(" + data[i].id + ")' ><i class=\"fas fa-trash-alt\"></i></a></td></tr>";
					$('#dataTable').append(tableData);
				}
			}
		});
	}

	function recordDelete(id) {
		if (!confirm('Are you sure'))
			return;
		var URL = "<%=path%>/api/DummyInfo/" + id;
		callApi(URL, "", "DELETE");
	}

	getRecord();

</script>

<script>
	$('.js-pscroll').each(function () {
		var ps = new PerfectScrollbar(this);

		$(window).on('resize', function () {
			ps.update();
		})
	});


</script>
</div> <!-- This is the end tag for the class="bodydiv" division in header jsp file -->

<!--<div class="limiter">
	<div class="wrap-table100">	
		<div class="table100 ver1 m-b-110">
			<div class="table100-head">
				<table>
					<thead>
						<tr class="row100 head">
							<th class="cell100 column1">Class name</th>
							<th class="cell100 column2">Type</th>
							<th class="cell100 column3">Hours</th>
							<th class="cell100 column4">Trainer</th>
							<th class="cell100 column5">Spots</th>
						</tr>
					</thead>
				</table>
			</div>

			<div class="table100-body js-pscroll">
				<table>
					<tbody>
						<tr class="row100 body">
							<td class="cell100 column1">Like a butterfly</td>
							<td class="cell100 column2">Boxing</td>
							<td class="cell100 column3">9:00 AM - 11:00 AM</td>
							<td class="cell100 column4">Aaron Chapman</td>
							<td class="cell100 column5">10</td>
						</tr>
						<tr class="row100 body">
							<td class="cell100 column1">Mind & Body</td>
							<td class="cell100 column2">Yoga</td>
							<td class="cell100 column3">8:00 AM - 9:00 AM</td>
							<td class="cell100 column4">Adam Stewart</td>
							<td class="cell100 column5">15</td>
						</tr>

						<tr class="row100 body">
							<td class="cell100 column1">Crit Cardio</td>
							<td class="cell100 column2">Gym</td>
							<td class="cell100 column3">9:00 AM - 10:00 AM</td>
							<td class="cell100 column4">Aaron Chapman</td>
							<td class="cell100 column5">10</td>
						</tr>

						<tr class="row100 body">
							<td class="cell100 column1">Wheel Pose Full Posture</td>
							<td class="cell100 column2">Yoga</td>
							<td class="cell100 column3">7:00 AM - 8:30 AM</td>
							<td class="cell100 column4">Donna Wilson</td>
							<td class="cell100 column5">15</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>	
	</div>	
</div>	
-->
<%@include file="login/footer.jsp" %>