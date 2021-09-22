<% 

ui.decorateWith("appui", "standardEmrPage") %>
<%
ui.includeJavascript("dataquality", "jquery-3.3.1.js")
ui.includeJavascript("dataquality", "jquery.dataTables.min.js")
ui.includeJavascript("dataquality", "datatables.min.js")
ui.includeJavascript("dataquality", "buttons.flash.min.js")
ui.includeJavascript("dataquality", "jquery-ui.js")
ui.includeJavascript("dataquality", "jszip.min.js")
ui.includeJavascript("dataquality", "pdfmake.min.js")
ui.includeJavascript("dataquality", "vfs_fonts.js")
ui.includeCss("dataquality", "bootstrap.min.css")
ui.includeJavascript("dataquality", "buttons.html5.min.js")
ui.includeJavascript("dataquality", "buttons.print.min.js")
ui.includeJavascript("dataquality", "datatable.button.min.js")
ui.includeCss("dataquality", "buttons.dataTables.min.css")
ui.includeCss("dataquality", "jquery.dataTables.min.css")
ui.includeCss("dataquality", "myStyle.css")

def id = config.id
%>
<%=ui.resourceLinks()%>
<div class="container">
    
    <h3><%= title; %></h3>
    <% 
        if(subset == 1){ %>
            ${ui.includeFragment("dataquality", "cqidetails/adult_offered_index", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 2){ %>
            ${ui.includeFragment("dataquality", "cqidetails/ped_offered_index", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 3){ %>
            ${ui.includeFragment("dataquality", "cqidetails/adults_tested_positive", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 4){ %>
            ${ui.includeFragment("dataquality", "cqidetails/peds_tested_positive", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 5){ %>
            ${ui.includeFragment("dataquality", "cqidetails/adults_started_on_art", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
     <% 
        if(subset == 6){ %>
            ${ui.includeFragment("dataquality", "cqidetails/peds_started_on_art", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 7){ %>
            ${ui.includeFragment("dataquality", "cqidetails/patients_on_art", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 8){ %>
            ${ui.includeFragment("dataquality", "cqidetails/patients_with_vl_within_6_months", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 9){ %>
            ${ui.includeFragment("dataquality", "cqidetails/patients_with_vl_within_6_months", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    <% 
        if(subset == 10){ %>
            ${ui.includeFragment("dataquality", "cqidetails/patients_with_suppressed_first_vl", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    
    <% 
        if(subset == 11){ %>
            ${ui.includeFragment("dataquality", "cqidetails/ped_patients_with_suppressed_first_vl", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    %>
    
    <% 
        if(subset == 12){ %>
            ${ui.includeFragment("dataquality", "cqidetails/pts_with_missed_app", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }

  %>
  <% 
        if(subset == 13){ %>
            ${ui.includeFragment("dataquality", "cqidetails/ped_pts_with_missed_app", [patients:patients, startDate:startDate, endDate:endDate])  } 
      <%
       }
    
    %> 
</div>

<script type="text/javascript">
    var jq = jQuery;
    
    jq(document).ready(function(e){
        jq('.date').datepicker({
            dateFormat: 'yy-mm-dd',
            changeYear: true,
            changeMonth:true,
            yearRange: "-30:+0",
            autoclose: true
        });
        
        jq(".dataTable").DataTable({
             pageLength: 100,
             "lengthMenu": [[50, 100, 250, 500, -1], [50, 100, 250, 500, "All"]],
             "columnDefs": [
                { "searchable": false, "targets": [0] }  // Disable search on first and last columns
              ],
              dom: 'lfBrtip',
                buttons: [
                    'copy', 
                   // 'csv', 
                    {
                        extend: 'csv',
                        title:'<%= title; %>',
                        //messageTop: '<%= title; %>'
                    },
                    {
                        extend: 'excel',
                        title:'<%= title; %>',
                        //messageTop: '<%= title; %>'
                    },
                    {
                        extend: 'pdf',
                        title:'<%= title; %>',
                        //messageTop: '<%= title; %>'
                    },
                    {
                        extend: 'print',
                        title:'<%= title; %>',
                        //messageTop: '<%= title; %>'
                    },
                    //'pdf', 
                    //'print'
                ]

                });
        
        
        jq("#filterCQI").click(function(e){
            var subSet = <%= subset %>
            var startDate = jq("#startDate").val();
            var endDate = jq("#endDate").val();
            window.location = "cqidetail.page?subset="+subSet+"&startDate="+startDate+"&endDate="+endDate;
        })
    });
</script>