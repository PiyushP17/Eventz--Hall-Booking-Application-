<%-- 
    Document   : booking
    Created on : 16 Jul, 2019, 10:27:48 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //session.removeAttribute("type");
    if(session.getAttribute("username") == null){
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <script>
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
   <body onload="show_booking_dates();">
      <div class="fixed_div" id="fix_div">
         <div style="padding:30px;margin:auto;margin-top:100px;border-radius:10%;background-color:white;height:auto;width:600px;border:12px solid green;">
            <h4 style="color:brown" id="result">
                Enter Password to Book slot
            </h4>
            User Id  <input type="text" id="userid" class="form-control" readonly />
            <br/>
            Password  <input type="password" id="password" class="form-control" required/>
            <br/>
            Hall Id  <input type="text" id="hallid" class="form-control" readonly/>
            <br/>
            Slot Id  <input type="text" id="slotid" class="form-control" readonly/>
            <br/>
            Date <input type="text" id="date_booking" class="form-control" readonly/>
            <br/>
            <button onclick="call_book_final();" class="btn btn-success" id="btnmodal">Done</button>
            <button onclick="closeit('fix_div')" class="btn btn-danger" id="btnmodal">Close</button>
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
             <form name='chpass' action="UpdatePass" method="post" style='display:inline;' onsubmit='return validate();'>
            Old Password <input type="password" name='opass' id="oldpass" class="form-control"/><br/>
            <!--<br/>
            Password : <input type="password" id="updatePassword" class="form-control"/>
            <br/>-->
            New Password<input type="password" name='npass' id="newpass" class="form-control"/>
            <br/>
            Confirm New Password<input type="password" name='cnpass' id="cnewpass" class="form-control"/>
            <br/>
            <input type="submit" style='display:inline;' value="Change Password" class="btn btn-success" id="btnUPass">
             </form>
             <button onclick="closeit('upass_fix_div')" style='display:inline;' class="btn btn-danger" id="btnClose">Close</button>
             <script>
                 function validate()
                 {
                     if(document.forms["chpass"]["npass"].value !== document.forms["chpass"]["cnpass"].value) {
                        alert("New Password and Confirm New Password do not match");
                        document.getElementById("cnewpass").focus();
                        return false;
                     }
                     return true;
                 }
             </script>
         </div>
        </div>
      <div class="fixed_div" id="update_fix_div">
         <div style="padding:30px;margin:auto;margin-top:100px;border-radius:10%;background-color:white;height:auto;width:600px;border:12px solid green;">
            <h4 style="color:brown" id="endresult">
                Update Your Details Here
            </h4>
            User Id  <input type="text" id="updateUser" class="form-control" readonly disabled/>
            <br/>
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
      <div class="jumbotron" style="height:200px;">
         <div class="container text-center">
             <h1>Welcome <% out.print(session.getAttribute("username")); %> </h1>
            <p>Book hall here</p>
         </div>
      </div>
      <nav class="navbar navbar-inverse" style="background-color:; margin-bottom:0; margin-top:0; border:2px solid white;">
          <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li><a href="" disabled>Eventz&nbsp;<span class="glyphicon glyphicon-home"></span></a></li>
                <li><a href="#here" onclick="show_user_booking_detail()" >My Bookings</a></li>
                <li><a href="#here" onclick="get_hall_details()">Gallery</a></li>
                <!--<li><a href="enquiry">Enquiry</a></li>-->
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" onclick="update_User_Profile()">Update Profile</a></li>
                <li><a href="#" onclick="document.getElementById('upass_fix_div').style.display='block';">Change Password</a></li>
                <li><a href="Logout">Logout</a></li>
            </ul>
          </div>
     </nav>
      <br/><br/>
      <div class="container">
         <div class="row">
            <div class="col-sm-12">
               <div class="panel panel-primary">
                   <div class="panel-heading"><h4 style="display:inline">Select Date to Book Hall</h4></div>
                  <div class="panel-body">
                     <div id="booking_details" style="border:10px solid powderblue;border-radius:15px;padding:25px;padding-left:50px;">
                     </div>
                     <br/>
                     <div id="show_hall" style="display:none;border:10px solid powderblue;border-radius:15px;padding:25px;padding-left:50px;">
                     </div><br/>
                     <div id ="show_details" style="display:none;border:10px solid powderblue;border-radius:15px;padding:25px;padding-left:50px;"> 
                     </div>
                     <span id="here"></span>
                  <a>
                     <div class="panel-footer">
                         <button class="btn btn-primary" id="hidebtn2"style="display:none;"onclick="hide();">
                             Hide Details
                         </button>
                     </div>
                  </a>
               </div>
            </div>
         </div>
      </div>
      <br>
      </div>
      <footer class="footer text-center" style="background-color:#000000;color:#FFFFFF">
          Copyright @ Netcom Computers
      </footer>
      <script>
         function get_hall_details()
         {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                            var childEle = document.createElement("button");
                            childEle.className="btn btn-primary";
                            childEle.setAttribute("id","hidebtn");
                            childEle.innerHTML = "Hide Details";
                            childEle.onclick = function(){document.getElementById("show_details").style.display="none";};
                            document.getElementById("show_details").style.display="block";
                            pageScroll('#show_details');
                            document.getElementById("show_details").innerHTML = this.responseText;
                            document.getElementById("show_details").appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "image_gallery.html", true);
         	
         	xhttp.send();
         }
         function show_booking_dates()
         {
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{	
         			document.getElementById("booking_details").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("GET", "show_booking.jsp", true);
         	xhttp.send();
         
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
         function show_user_booking_detail()
         {
         	var parameter="<%out.print(session.getAttribute("username"));%>";
         	
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{
                            var childEle = document.createElement("button");
                            childEle.className="btn btn-primary";
                            childEle.setAttribute("id","hidebtn");
                            childEle.innerHTML = "Hide Details";
                            childEle.onclick = function(){document.getElementById("show_details").style.display="none";};
                            document.getElementById("show_details").style.display="block";
                            pageScroll("#show_details");
                            document.getElementById("show_details").innerHTML = "<h2>My Bookings</h2>"+this.responseText;
                            document.getElementById("show_details").appendChild(childEle);
         		}
         	};
         	xhttp.open("GET", "get_user_booking_details.jsp?username="+parameter, true);
         	xhttp.send();
         }
         function book_now(a)
         {
         	var get_book_date = a.innerHTML;
         	//alert(get_book_date);
         	document.getElementById("show_hall").style.display = "block";
                pageScroll('#show_hall');
         	var parameter = "date="+get_book_date;
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{	
         			document.getElementById("show_hall").innerHTML =
         			this.responseText;
         		}
         	};
         	xhttp.open("POST", "show_available_hall.jsp", true);
         	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         	xhttp.send(parameter);
         	
         }
         
         function book_final(a,b)
         {
         	//in a there is button on which click event has occured, and b contains hall id
         	document.getElementById("fix_div").style.display="block";
         	//alert(a);
         	//alert(b.id);
                document.getElementById("userid").value="<%out.print(session.getAttribute("username"));%>";
         	document.getElementById("hallid").value=b.id;
         	document.getElementById("slotid").value=a.innerHTML;
         	document.getElementById("date_booking").value=document.getElementById("date_of_booking").innerHTML;
         	
         }
         
         function closeit(id)
         {
         	document.getElementById(id).style.display="none";
         	//location.reload();
         }
         function hide()
         {
             document.getElementById("show_details").style.display="none";
             
         }
         function pageScroll(id)
         {
                window.location = id;
         }
         function call_book_final()
         {		
         	var parameter = "date="+document.getElementById("date_booking").value;
         	parameter += "&hallid="+document.getElementById("hallid").value;
         	parameter += "&slotid="+document.getElementById("slotid").value;
         	parameter += "&userid="+document.getElementById("userid").value;
         	parameter += "&pass="+document.getElementById("password").value;
         	
         	var xhttp = new XMLHttpRequest();
         	xhttp.onreadystatechange = function()
         	{
         		if (this.readyState == 4 && this.status == 200) 
         		{	
         			document.getElementById("result").innerHTML =
         			this.responseText;
         			
         			
         			document.getElementById("date_booking").disabled="true";
         			document.getElementById("hallid").disabled="true";
         			document.getElementById("slotid").disabled="true";
         			document.getElementById("userid").disabled="true";
         			document.getElementById("password").disabled="true";
         			document.getElementById("btnmodal").disabled="true";
         			
         		}
         	};
         	xhttp.open("POST", "make_booking_entry.jsp", true);
         	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         	xhttp.send(parameter);	
         }
      </script>
   </body>
</html>