
<!DOCTYPE html>
<html class="bg-dark-green">
    <head>
        <meta charset="UTF-8">
        <title>Sistem Informasi Dosen | Log in</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="css/ionicons.min.css" rel="stylesheet" type="text/css"/>
        <!-- Theme style -->
        <link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="bg-dark-green">

        <div class="form-box" id="login">
            <div class="header">
                <p>Selamat Datang!</p>
            </div>
            <form action="model/login.php" method="post">
                <div>
                    <div class="form-group">
                        <input type="text" name="nidn" class="form-control" placeholder="NIDN"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>          
                    <div class="form-group">
                        <input type="checkbox" name="remember_me"/> Ingat Saya
                    </div>
                </div>
                <div class="footer bg-dark-green col-md-4">                                                               
                    <button type="submit" class="btn bg-yellow btn-block">Log In</button>  
                </div>
            </form>

        </div>


        <!-- jQuery 2.0.2 -->
        <script src="js/jquery-2.0.2.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        

    </body>
</html>