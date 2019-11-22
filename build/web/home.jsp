<%-- 
    Document   : home
    Created on : 17 Jul, 2019, 5:23:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("username")==null){
        response.sendRedirect("login.jsp");
    }
    if(session.getAttribute("username") != null && session.getAttribute("type")==null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <script>
          //var x = "<%out.print(session.getAttribute("type"));%>";
          //if(performance.navigation.type == 2 && x !== "admin") ){
          //    location.reload(true);
         /*} else */
         if(performance.navigation.type == 2){
             location.reload(true);
         }
      </script>
      <title>Bootstrap Example</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
      <style>
         /* Remove the navbar's default rounded borders and increase the bottom margin */ 
         html {
            scroll-behavior: smooth;
         }   
         .navbar {
         margin-bottom: 50px;
         border-radius: 0;
         }
         /* Remove the jumbotron's default bottom margin */ 
         .jumbotron {
         margin-bottom: 0;
         }
         /* Add a gray background color and some padding to the footer */
         footer {
         background-color: #f2f2f2;
         padding: 25px;
         }
         .fixed_div
         {
         width:100%;
         height:800px;
         background-color:rgba(0,0,0,0.5);
         display:none;
         position:fixed;
         border:2px solid black;
         z-index:2;
         }
      </style>
   </head>
   <body>
         <div class="fixed_div" id="update_fix_div">
         <div style="padding:30px;margin:auto;margin-top:100px;border-radius:10%;background-color:white;height:auto;width:600px;border:12px solid green;">
            <h4 style="color:brown" id="endresult">
                Update Your Details Here
            </h4>
            User Id : <input type="text" id="updateUser" class="form-control"/><br/>
            <!--<br/>
            Password : <input type="password" id="updatePassword" class="form-control"/>
            <br/>-->
            Email<input type="email" id="updateEmail" class="form-control"/>
            <br/>
            Security Question<input type="text" id="updateSecq" class="form-control"/>
            <br/>
            Security Answer<input type="text" id="updateAnswer" class="form-control"/>
            <br/>
            <button onclick="modify();" class="btn btn-success" id="btnUpdate">Update</button>
            <button onclick="closeit('update_fix_div')" class="btn btn-danger" id="btnClose">Close</button>
         </div>
         <!--<div style="position:absolute;top:0px;right:0px;color:red;">
            <button onclick="closeit();">Close</button>
         </div>-->
      </div>
      <div class="fixed_div" id="upass_fix_div">
         <div style="padding:30px;margin:auto;margin-top:100px;border-radius:10%;background-color:white;height:auto;width:600px;border:12px solid green;">
            <h4 style="color:brown" id="passendresult">
                Change Password here
            </h4>
             <form action="UpdatePass" method="post" style='display:inline;'>
            Old Password <input type="password" name='opass' id="oldpass" class="form-control"/><br/>
            <!--<br/>
            Password : <input type="password" id="updatePassword" class="form-control"/>
            <br/>-->
            New Password<input type="password" name='npass' id="newpass" class="form-control"/>
            <br/>
            Confirm New Password<input type="password" name='cnpass'id="cnewpass" class="form-control"/>
            <br/>
            <input type="submit" style='display:inline;' value="Change Password" class="btn btn-success" id="btnUPass">
             </form>
             <button onclick="closeit('upass_fix_div')" style='display:inline;' class="btn btn-danger" id="btnClose">Close</button>
             
         </div>
         <!--<div style="position:absolute;top:0px;right:0px;color:red;">
            <button onclick="closeit();">Close</button>
         </div>-->
      </div> 
      <div class="fixed_div" id="admin_add_fix_div">
         <div style="padding:30px;margin:auto;margin-top:100px;border-radius:10%;background-color:white;height:auto;width:600px;border:12px solid green;">
            <h4 style="color:brown" id="adminModalHead">
                Add Other Admin Here
            </h4>
            User Id : <input type="text" id="adminUser" class="form-control"/>
            <br/>
            Password : <input type="password" id="adminPassword" class="form-control"/>
            <br/>
            Email<input type="email" id="adminEmail" class="form-control"/>
            <br/>
            Security Question<input type="text" id="adminSecq" class="form-control"/>
            <br/>
            Security Answer<input type="text" id="adminAnswer" class="form-control"/>
            <br/>
            <button onclick="add_admin();" class="btn btn-success" id="btnAddAdmin">Add</button>
            <button onclick="closeit('admin_add_fix_div')" class="btn btn-danger" id="btnCloseAdmin">Close</button>
         </div>
         <!--<div style="position:absolute;top:0px;right:0px;color:red;">
            <button onclick="closeit();">Close</button>
         </div>-->
      </div>
      <div class="jumbotron" style="height:200px;">
         <div class="container text-center">
            <h1>Admin Panel</h1>
            <span id = "p1"> </span>
            <p>Select your task</p>
         </div>
      </div>
      <nav class="navbar navbar-inverse" style="background-color:; margin-bottom:0; margin-top:0; border:2px solid white;">
          
          <div class="container-fluid">
              <ul class="nav navbar-nav">
                  <li><a href="booking.jsp" target='_blank'>Book Hall</a></li>
                  <li><a href="#" onclick="document.getElementById('admin_add_fix_div').style.display='block'">Add Admins</a></li>
              </ul>
              <ul class="nav navbar-nav navbar-right">
                  <li><a href="#" onclick="update_User_Profile();">Update Admin Profile</a></li>
                  <li><a href="#" onclick="document.getElementById('upass_fix_div').style.display='block';">Change Password</a></li>
                  <li><a href="Logout">Logout</a></li>
              </ul>
          </div>
     </nav>
      <br/><br/>
      <div class="container">
         <div class="row">
            <div class="col-sm-4" >
               <div class="panel panel-primary">
                  <div class="panel-heading">Hall Management</div>
                  <div class="panel-body"><img src="resources/hall.jpg" class="img-responsive" style="width:100%;height:200px;" alt="Image"></div>
                  <a>
                     <div class="panel-footer"><button id="detailhall" class="btn btn-primary" onclick="show_bookingpanel('hallmanage','usermanage','openbooking','bookmanage');">Show Hall details</button></div>
                  </a>
               </div>
            </div>
            <div class="col-sm-4">
               <div class="panel panel-danger">
                  <div class="panel-heading">Open Booking</div>
                  <div class="panel-body"><img src="resources/open-bookings.jpg" class="img-responsive" style="width:100%;height:200px;" alt="Image"></div>
                  <a>
                     <div class="panel-footer"><button class="btn btn-danger" onclick="show_bookingpanel('openbooking','hallmanage','usermanage','bookmanage');">Open booking for next week</button></div>
                  </a>
               </div>
            </div>
         <!--</div>-->
         <!--<div class="row">-->
            <div class="col-sm-4">
               <div class="panel panel-info">
                  <div class="panel-heading">Check Past/Current Bookings</div>
                  <div class="panel-body"><img src="resources/booking.png" class="img-responsive" style="width:100%;height:200px;" alt="Image"></div>
                  <a>
                     <div class="panel-footer"><button class="btn btn-info" onclick="show_bookingpanel('bookmanage','hallmanage','usermanage','openbooking');">View Booking details</button></div>
                  </a>
               </div>
            </div>
            <div class="col-sm-4">
               <div class="panel panel-success">
                  <div class="panel-heading">Profile Management</div>
                  <div class="panel-body"><img src="resources/user1.png" class="img-responsive" style="width:100%;height:200px;" alt="Image"></div>
                  <a>
                     <div class="panel-footer"><button class="btn btn-success" onclick="show_bookingpanel('usermanage','hallmanage','openbooking','bookmanage');">Delete Profiles</button></div>
                  </a>
               </div>
            </div>
             <div class="col-sm-4">
               <div class="panel panel-danger">
                  <div class="panel-heading">Manage Bookings</div>
                  <div class="panel-body"><img src="resources/Delete.jpg" class="img-responsive" style="width:100%;height:200px;" alt="Delete Bookings"></div>
                  <a>
                     <div class="panel-footer"><button class="btn btn-danger" onclick="show_bookingpanel('deletemanage','hallmanage','openbooking','bookmanage');">Delete Bookings</button></div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <br/><br/>
      <!--<footer class="container-fluid text-center">-->
      <div class="container-fluid text-center">
         <!-- -->
      <div class="container" id="resultdiv">
          <div class="container" id="openbooking" style="display:none;">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel panel-primary">
                     <div class="panel-heading">Open Booking</div>
                     <div class="panel-body">
                        <br/>
                        <div id="open_date" style="margin:10px;border:3px solid black;padding:30px;text-align:left;border-radius:10px;">
                        </div>
                     </div>
                     <a>
                         <div class="panel-footer"><button class="btn btn-primary" onclick="closeit('openbooking');">Close</button></div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
          
         <div class="container" id="usermanage" style="display:none;">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel panel-danger">
                     <div class="panel-heading">User Management</div>
                     <div class="panel-body">
                         <h2 id="deletehead"> Select Profile to Delete </h2>
                        <select class="form-control" id="usersid">
                        </select><br/><br/>
                        <a>
                            <div><button class="btn btn-danger form-control" onclick="delete_profile(document.getElementById('usersid').value)">Delete Selected Profile</button></div>
                        </a>
                        <div id="userdetails">
                        </div>
                     </div>
                     <a>
                        <div class="panel-footer"><button class="btn btn-primary" onclick='closeit("usermanage")'>Close</button></div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
          
         <div class="container" id="deletemanage" style="display:none;">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel panel-primary">
                     <div class="panel-heading">Delete Bookings</div>
                     <div class="panel-body" id="deletedetails"></div>
                     <a>
                        <div class="panel-footer"><button class="btn btn-primary" onclick="closeit('deletemanage');">Close</button></div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
          
         <div class="container" id="hallmanage" style="display:none;">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel panel-primary">
                     <div class="panel-heading">Hall Details</div>
                     <div class="panel-body" id="halldetail"></div>
                     <a>
                        <div class="panel-footer"><button class="btn btn-primary" onclick="closeit('hallmanage');">Hide Hall Details</button></div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
          
         <div class="container" id="bookmanage" style="display:none;">
            <div class="row">
               <div class="col-sm-12">
                  <div class="panel panel-primary">
                     <div class="panel-heading">View Bookings</div>
                     <div class="panel-body">
                        <div style="padding:30px;">
                            <input class="form-control" type="radio" name="rdcheck" value="user_search" onclick="show_search_div('usearch')"/>Search Based on User ID
                           <input class="form-control" type="radio" name="rdcheck" value="date_search" onclick="show_search_div_date('dsearch')" />Search Based on Date
                           <input class="form-control" type="radio" name="rdcheck" value="user_date_search" onclick="show_search_div_user_date('udsearch')"/>Search Based on Date  and User ID
                           <input class="form-control" type="radio" name="rdcheck" value="hall_search" onclick="show_search_div_hall('hsearch')"/>Search Based on Hall Id
                        </div>
                        <div style="height:auto;border:3px solid green;border-radius:4px;display:none;padding:30px;" id="usearch">
                           <h2>User Search</h2>
                           <br/>
                           <span style='text-align:left; font-weight:bold;'>Select User Id </span> 
                           <select id="usersidsearch" class='form-control' onchange="show_user_booking_detail();">
                           </select>
                           <br/>
                           <br/>
                           <div id="usertable">
                           </div>
                        </div><br/> <br/>
                        <div style="height:auto;border:3px solid green;border-radius:4px;display:none;padding:30px;" id="dsearch">
                           <h2>Date Search</h2>
                           <br/>
                           <p align='left'>Select Date</p> 
                           <select id="datesearch" class='form-control' onchange="show_date_booking_detail();">
                           </select>
                           <br/>
                           <br/>
                           <div id="datetable">
                           </div>
                        </div><br/> <br/>
                        <div style="height:auto;border:3px solid green;border-radius:4px;display:none;padding:30px;" id="udsearch">
                           <h2>User and Date Search</h2>
                           <br/>
                           <p align='left'>Enter User Id</p>
                           <input type="text" class='form-control' id="userid_for_third_radio"/>
                           <br/>
                           <p align='left'>Select Date</p>
                           <input type="date" class='form-control' id="date_for_third_radio"/><br>
                           <button class='btn btn-primary' onclick='show_user_date_detail();'>Done</button>
                           <br/>
                           <br/>
                           <div id="userdatetable">
                           </div>
                        </div><br/> <br/>
                        <div style="height:auto;border:3px solid green;border-radius:4px;display:none;padding:30px;" id="hsearch">
                           <h2>Hall Search</h2>
                           <br/>
                           <p align='left'>Select Hall</p>  
                           <select id="hallsearch" class='form-control' onchange="show_hall_booking_detail();">
                              <option value="select">--Select--</option>
                              <option value="hall1">Hall 1 </option>
                              <option value ="hall2">Hall 2</option>
                           </select>
                           <br/>
                           <br/>
                           <div id="halltable">
                           </div>
                        </div>
                     </div>
                     <a>
                        <div class="panel-footer"><button class="btn btn-primary" onclick='closeit("bookmanage")'>Hide Details</button></div>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </div>
      <footer class="footer text-center" style="background-color:#000000;color:#FFFFFF">
          Copyright @ Netcom Computers
      </footer>
      <script>
          function update_User_Profile() {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                            document.getElementById("update_fix_div").style.display="block";
                            var user = JSON.parse(this.responseText);
                            document.getElementById("updateUser").value = user.username;
                            document.getElementById("updatePassword").value = user.password;
                            document.getElementById("updateEmail").value = user.email;
                            document.getElementById("updateSecq").value = user.securityquestion;
                            document.getElementById("updateAnswer").value = user.answer;
         		}
         	};
         	xhttp.open("GET", "updateDetails.jsp", true);
         	xhttp.send();
         
         }
         function modify()
         {		
         	var parameter = "username="+document.getElementById("updateUser").value;
         	parameter += "&email="+document.getElementById("updateEmail").value;
         	parameter += "&secq="+document.getElementById("updateSecq").value;
         	parameter += "&ans="+document.getElementById("updateAnswer").value;
         	
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{	
         			document.getElementById("endresult").innerHTML =
         			this.responseText;
         		}
                };
                xhttp.open("POST", "Update", true);
         	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         	xhttp.send(parameter);
        }
         function update_User_Profile() {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                            document.getElementById("update_fix_div").style.display="block";
                            var user = JSON.parse(this.responseText);
                            document.getElementById("updateUser").value = user.username;
                            document.getElementById("updateEmail").value = user.email;
                            document.getElementById("updateSecq").value = user.securityquestion;
                            document.getElementById("updateAnswer").value = user.answer;
         		}
         	};
         	xhttp.open("GET", "updateDetails.jsp", true);
         	xhttp.send();
         
         }
         function add_admin() {
             var parameter = "username="+document.getElementById("adminUser").value;
             parameter += "&password="+document.getElementById("adminPassword").value;
             parameter += "&email="+document.getElementById("adminEmail").value;
             parameter += "&secque="+document.getElementById("adminSecq").value;
             parameter += "&answer="+document.getElementById("adminAnswer").value;
             parameter+="&type=admin";
             var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function()
             {
                 if(this.readyState == 4 && this.status == 200) {
                     //document.getElementById("admin_add_fix_div").style.display="block";
                     document.getElementById("adminModalHead").innerHTML = this.responseText;
                 }
             };
             xhttp.open("POST","SignUp",true);
             xhttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
             xhttp.send(parameter);
             
         }
         function closeit(id)
         {
         	document.getElementById(id).style.display="none";
                if (id == "admin_add_fix_div")
                {
                    document.getElementById("adminUser").value = '';
                    document.getElementById("adminPassword").value = '';
                    document.getElementById("adminEmail").value = '';
                    document.getElementById("adminSecq").value = '';
                    document.getElementById("adminAnswer").value = '';
                    document.getElementById("adminModalHead").innerHTML = "Add Other Admin here";
                }
         }
         function get_hall_details()
         {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
         			document.getElementById("halldetail").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("GET", "image_gallery.html", true);
         	
         	xhttp.send();
         }
         function show_search_div_hall(a)
         {
         	document.getElementById(a).style.display="block";
         	
         }
         function show_hall_booking_detail()
         {
         	var parameter=document.getElementById('hallsearch').value;
         	
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                                var childEle = document.createElement("button");
                                childEle.className="btn btn-primary";
                                childEle.innerHTML = "Close";
                                childEle.onclick = function(){document.getElementById("hsearch").style.display="none";};
         			document.getElementById("halltable").innerHTML =
         			this.responseText;
                                document.getElementById('halltable').appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_hall_booking_details.jsp?hall="+parameter, true);
         	
         	xhttp.send();
         }
         function show_date_booking_detail()
         {
         	var parameter=document.getElementById('datesearch').value;
         	
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                                var childEle = document.createElement("button");
                                childEle.className="btn btn-primary";
                                childEle.innerHTML = "Close";
                                childEle.onclick = function(){document.getElementById("dsearch").style.display="none";};
         			document.getElementById("datetable").innerHTML =
         			this.responseText;
                                document.getElementById("datetable").appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_date_booking_details.jsp?date="+parameter, true);
         	
         	xhttp.send();
         }
         function show_user_booking_detail()
         {
         	var parameter=document.getElementById('usersidsearch').value;
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                                var childEle = document.createElement("button");
                                childEle.className="btn btn-primary";
                                childEle.setAttribute("id","hidebtn");
                                childEle.innerHTML = "Close";
                                childEle.onclick = function(){document.getElementById("usearch").style.display="none";};
         			document.getElementById("usertable").innerHTML =
         			this.responseText;
                                document.getElementById("usertable").appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_user_booking_details.jsp?username="+parameter, true);
         	
         	xhttp.send();
         }
         function show_search_div(a)
         {
         	document.getElementById(a).style.display="block";
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                                
         			document.getElementById("usersidsearch").innerHTML =
         			this.responseText;
                                document.getElementById("usersidsearch").appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_user_details.jsp", true);
         	xhttp.send();
         }
         function show_search_div_date(a)
         {
         	document.getElementById(a).style.display="block";
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
         			document.getElementById("datesearch").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("GET", "get_booking_date.jsp", true);
         	xhttp.send();
         }
         function show_search_div_user_date(a)
         {
         	document.getElementById(a).style.display="block";
         }
         function show_user_date_detail()
         {
         	var parameter1=document.getElementById('userid_for_third_radio').value;
         	var parameter2=document.getElementById('date_for_third_radio').value;
         
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                                var childEle = document.createElement("button");
                                childEle.className="btn btn-primary";    
                                childEle.innerHTML = "Close";
                                childEle.onclick = function(){document.getElementById("udsearch").style.display="none";};
         			document.getElementById("userdatetable").innerHTML =
         			this.responseText;
                                document.getElementById('userdatetable').appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_user_date_booking_details.jsp?username="+parameter1+"&date="+parameter2, true);
         	
         	xhttp.send();
         }
         function pageScroll(id)
         {
                window.location = id;
                //window.scrollBy(0,1000); // horizontal and vertical scroll increments
                
         }
         
         function show_bookingpanel(a,b,c,d)
         {
         	document.getElementById(a).style.display="block";
         	if(a=='usermanage')
         	{
                    getusernames();
                    setTimeout(function(){pageScroll("#usermanage");},200);
         	} else if(a=='deletemanage') {
                    get_list_to_delete();
                    setTimeout(function(){pageScroll("#deletemanage");},200);
                } else if (a == 'hallmanage') {
                    get_hall_details();
                    setTimeout(function(){pageScroll("#hallmanage");},200);
                } else if (a == 'openbooking') {
                    get_openingdates();
                    setTimeout(function(){pageScroll("#openbooking");},200);
                } else if (a == 'bookmanage') {
                    setTimeout(function(){pageScroll("#bookmanage");},200);
                }
         }
         function get_list_to_delete()
         {
             var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function()
             {
                 if (this.readyState == 4 && this.status == 200)
                 {
                     document.getElementById("deletedetails").innerHTML = this.responseText;
                 }
             };
             xhttp.open("GET", "returndeldetails.jsp", true);
             xhttp.send();
             
         }
         function deleteBookings(btnid) 
         {
             var index = parseInt(btnid.charAt(1))+1;
             var parameter = "userid="+document.getElementById('myTable').rows[index].cells[0].innerHTML;
             parameter += "&date="+document.getElementById('myTable').rows[index].cells[1].innerHTML;
             parameter += "&hallid="+document.getElementById('myTable').rows[index].cells[2].innerHTML;
             parameter += "&slot="+document.getElementById('myTable').rows[index].cells[3].innerHTML;
             
             var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function()
             {
                 if (this.readyState == 4 && this.status == 200)
                 {
                     document.getElementById("delh").innerHTML = this.responseText;
                     setTimeout(function(){ get_list_to_delete(); }, 900);
                     
                 }
             };
             var x = confirm("Are you sure you want to delete this booking ?");
             if (x == true) 
             {
                 xhttp.open("POST", "DeleteBooking", true);
                 xhttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
                 xhttp.send(parameter);
             }
         }
         function getusernames()
         {
         	setTimeout(function(){pageScroll("#userdetails");},200);
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
         			document.getElementById("usersid").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("GET", "get_user_details.jsp", true);
         	xhttp.send();
         	
         }
         function get_openingdates()
         {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
         			document.getElementById("open_date").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("GET", "get_open_date.jsp", true);
         	xhttp.send();
         }
         function confirm_booking()
         {
         	var a = document.getElementsByTagName("input");
         	var parameter ="";
         	for(var i=0;i<a.length;i++)
         	{
         		if(i==0)
         		{
         			parameter+=a[i].id+"="+a[i].value;
         		}
         		else
         		{
         			parameter+="&"+a[i].id+"="+a[i].value;
         		}
         	}
         	//alert(parameter); 
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
         			document.getElementById("open_date").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("POST", "confirm_booking.jsp", true);
         	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         	xhttp.send(parameter);
         }
         function delete_profile(userid)
         {
             var xhttp = new XMLHttpRequest();
             var parameter = "username="+userid;
             xhttp.onreadystatechange = function()
             {
                 if (this.readyState == 4 && this.status == 200)
                 {
                     document.getElementById("deletehead").innerHTML = this.responseText; 
                     show_bookingpanel('usermanage',"","","");
                 }
             };
             if(confirm("Are you sure you want to delete profile for "+userid) == true) 
             {
                 xhttp.open("POST", "DeleteProfile", true);
                 xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                 xhttp.send(parameter); 
             }

         }  
      </script>
   </body>
</html>