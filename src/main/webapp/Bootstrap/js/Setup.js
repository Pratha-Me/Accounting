function getSupplier(id) {
    var requestData = {"status": "Y"};
    $.ajax({type: "GET", url: path + "/api/Setup/SupplierMaster", data: requestData, headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
        success: function (data) {
            $('#' + id).empty().append('<option value="">Select</option>');
            for (var i = 0; i < data.length; i++)
                $('#' + id).append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
        }});
}
function getFiscalYear(id) {
    $.ajax({type: "GET", url: path + "/api/Setup/FiscalYear", headers: {'Authorization': token}, contentType: "application/json; charset=utf-8", dataType: "json",
        success: function (data) {
            $('#' + id).empty();
            for (var i = 0; i < data.length; i++)
                $('#' + id).append('<option value="' + data[i].fySymbol + '">' + data[i].fiscalYear + '</option>');
        }});
}

