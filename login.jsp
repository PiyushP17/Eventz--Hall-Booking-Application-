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
      <title>Online Hall Booking</title>
      <link href="assets/css/bootstrap.css" rel="stylesheet">
      <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
      <link href="assets/css/style.css" rel="stylesheet">
      <link href="assets/css/style-responsive.css" rel="stylesheet">
   </head>
   <body>
      <div id="login-page">
         <div class="container">
            <form class="form-login" action="login" method="post">
                <h2 class="form-login-heading">sign in now</h2>
               <div class="login-wrap">
                  <input type="text" name="username" class="form-control" placeholder="User ID" autofocus required>
                  <br>
                  <input type="password" name="password" class="form-control" placeholder="Password" required>
                  <br>
                  <label><b>Usertype:&nbsp;&nbsp;&nbsp;</b></label>
                  <div>
                     <select class="form-control" name="type">
                        <option value="-1" selected>Select</option>
                        <option value="User">User</option>
                        <option value="Admin">Admin</option>
                     </select>
                  </div>
                  <br>
                  <button class="btn btn-theme btn-block" name="login" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
                  <hr>
                  <div class="registration">
                     Don't have an account yet?<br/>
                     <a class="" href="register.jsp">
                     Create an account
                     </a>
                     <hr> <a id="forgotpass" href="forgotpassword.jsp">Forgotten Password ? </a>
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
         $.backstretch("resources/hallimg1.jpg", {speed: 500});
      </script>
   </body>
</html>