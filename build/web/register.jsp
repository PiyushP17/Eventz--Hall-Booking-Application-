<%-- 
    Document   : register
    Created on : 19 Jul, 2019, 9:42:45 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Register to Book Event</title>
      <link href="assets/css/bootstrap.css" rel="stylesheet">
      <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
      <link href="assets/css/style.css" rel="stylesheet">
      <link href="assets/css/style-responsive.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
   </head>
   <body>
      <div id="login-page">
      <div class="container">
          <form name="signup" class="form-login" action="SignUp" method="post">
      <h2 class="form-login-heading">Sign Up Now</h2>
      <div class="login-wrap">
         <input type="text" name="username" class="form-control" placeholder="User ID" autofocus required>
         <br>
         <input type="text" name="email" class="form-control" placeholder="Email" autofocus required>
         <br>
         <input type="password" name="password" class="form-control" placeholder="Password" required>
         <br>
         <input type="password" id='cpass' name="cpassword" class="form-control" placeholder="Retype Password" required>
         <br>
         <select name="secque" class="form-control" onchange='validate();' autofocus/>
                      <option disabled selected hidden>--Choose Security Question--</option>
                      <option>What is your mother's maiden name?</option>
                      <option>What is your birth place?</option>
                      <option>What is your pet name ?</option>
                      <option>What is your first school name?</option>
         </select>
         <br>
         <input type="text" name="answer" class="form-control" placeholder="Answer" autofocus>
         <br>
         <script>
         function validate()
         {
             if(document.forms["signup"]["password"].value !== document.forms["signup"]["cpassword"].value) {
                 alert("Password and Confirm Password do not match");
                 document.getElementById("cpass").focus();
             }
         }
         </script>
         <button class="btn btn-theme btn-block" name="submit_btn" type="submit"><i class="fa fa-lock"></i> SIGN UP</button>
         <hr>
         <div class="registration">
            Already a User?<br/>
            <a class="" href="login.jsp">
            Login Here
            </a>
         </div>
      </div>
      </form>	
      </div>            
      </div>
      <script src="assets/js/jquery.js"></script>
      <script src="assets/js/bootstrap.min.js"></script>
      <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
      <script>
         $.backstretch("resources/hallimg2.jpg", {speed: 500});
      </script>
   </body>
</html>