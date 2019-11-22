<%-- 
    Document   : login
    Created on : 19 Jul, 2019, 9:00:33 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Change Password</title>
      <link href="assets/css/bootstrap.css" rel="stylesheet">
      <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
      <link href="assets/css/style.css" rel="stylesheet">
      <link href="assets/css/style-responsive.css" rel="stylesheet">
   </head>
   <body>
      <div id="login-page">
         <div class="container">
            <form class="form-login" method="POST" action="ForgotPassword">
               <h2 class="form-login-heading">Forgotten Password</h2>
               <div class="login-wrap">
                   
                  <input id='username' type="text" name="username" class="form-control" placeholder="User ID" autofocus>
                  <br>
                  <select id = 'secque' name="secque" class="form-control"  autofocus/>
                      <option value="" disabled selected hidden>--Choose Security Question--</option>
                      <option>What is your mother's maiden name?</option>
                      <option>What is your birth place?</option>
                      <option>What is your pet name ?</option>
                      <option>What is your first school name?</option>
                  </select>
                  <br/>
                  <input id='secans' type="text" name="secans" class=" form-control" placeholder="Security Answer">
                  <br>
                  <input id='newpass' type="password" name="newpass" class=" form-control" placeholder="New Password">
                  <br>
                  <button class="btn btn-theme btn-block" name="login" type="submit">
                      <i class="fa fa-lock"></i> Change Password
                  </button>
                  <hr>
                  <div class="registration">
                     <a class="" href="register.jsp">
                         Back to Login Page..
                     </a>
                     <hr id="resulthr" style="display:none"> 
                     <span id="resultpass"></span>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <script src="assets/js/jquery.js"></script>
      <script src="assets/js/bootstrap.min.js"></script>
      <!--BACKSTRETCH-->
      <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
      <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
      <script>
         $.backstretch("resources/hallimg4.jpg", {speed: 500});
         function forgotpass(hrid,divid) {
             var parameter = "username="+document.getElementById("username").value;
             parameter += "&secque="+document.getElementById("secque").value;
             parameter += "&secans="+document.getElementById("secans").value;
             parameter += "&newpass="+document.getElementById("newpass").value;
             var xhttp = new XMLHttpRequest();
             xhttp.onreadystatechange = function()
             {
                 if(this.readyState == 4 && this.status == 200) {
                     //document.getElementById("admin_add_fix_div").style.display="block";
                     document.getElementById(hrid).style.display="block";
                     document.getElementById(divid).innerHTML = this.responseText;
                 }
             };
             xhttp.open("POST","ForgotPassword",true);
             xhttp.setRequestHeader("content-type", "application/x-www-form-urlencoded");
             xhttp.send(parameter);
             
         }
      </script>
   </body>
</html>