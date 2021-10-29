<?php
    session_start();
    require_once("OOP.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="index.css" rel="stylesheet" type="text/css">
    <title>Guestbook</title>
</head>
<body>
    <?php
    $connection = mysqli_connect("localhost", "root", "", "guestbook");
    
        if(isset($_GET['page']))
        {
            if($_GET['page'] == 1)
            {
                include('pages\message.php');
            } 
            else if($_GET['page'] == 2)
            {
                include('pages\login.php');
            }
        }  else {
            include("pages\message.php");
        }
    ?>
    
    
</body>
</html>