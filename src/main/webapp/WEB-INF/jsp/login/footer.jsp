<br><br><br><br>

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
<footer id="footer" >
<div class="container">
<div class="row">
<div class="col-xs-12 col-sm-12 col-md-12">
<p>&nbsp;</p>
<p>Copy Right &copy; 2014-2018 </p>
</div>
</div>
</div>
</footer> 
</body>
</html>