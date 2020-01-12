<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
    </div>
</div>

<script>  function messages(msg) {
		$.toast({
			heading: "Messages",
			text: msg,
			icon: 'info',
			loader: true, // Change it to false to disable loader
			loaderBg: '#FFFFFF', // To change the background,
			position: 'mid-center'
		});
	}

	function errorMessages(msg) {
		$.toast({
			heading: "Messages",
			text: msg,
			icon: 'error',
			loader: true, // Change it to false to disable loader
			loaderBg: '#FF0000', // To change the background,
			position: 'mid-center'
		});
	}
	function excelExport(tableId)
	{
		$(".print").hide();
		var htmltable = document.getElementById(tableId);
		var html = htmltable.outerHTML;
		window.open('data:application/vnd.ms-excel,' + encodeURIComponent(html));
		$(".print").show();
	}

	function printDiv(div) {
		$('.print').hide();
		let printContents, popupWin;
		printContents = document.getElementById(div).innerHTML;
		popupWin = window.open('', '_blank', 'top=0,left=0,height=100%,width=auto');
		popupWin.document.open();
		popupWin.document.write(`
            <html>
              <head>
                <title> <%=""%></title>
                <style>
                .p{
                  margin-bottom: 5px;
                }
                .table-bordered {
                    border: 1px solid #eceeef;
                }
                .table {
                  position:relative;
                  width: 100%;
                  max-width: 100%;
                  margin-top: 20px;
                  margin-bottom: 1rem;
                  font-size: smaller;
                }
                .table {
                  border-collapse: collapse;
                  background-color: transparent;
                }
                .table-bordered th, .table-bordered td {
                    border: 1px solid #eceeef;
                }
                .table th, .table td {
                    padding: 0.55rem;
                    vertical-align: top;
                    border-top: 1px solid #eceeef;
                    text-align:left;
                }
                .last-td{
                  display:none;
                }
                //........Customized style.......
                </style>
              </head>
        
          <body onload="window.print();window.close()">` + printContents + `</body>
            </html>`
				);
		$('.print').show();
		popupWin.document.close();
	}

</script>  
</body>
</html>