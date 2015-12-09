<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "414_weather";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
}

$sql = 'SELECT * FROM `weather_by_city` WHERE `city_name` = "'.$_POST['city'].'" ORDER BY `city_name` ASC ;';
$result = $conn->query($sql);

if ($result->num_rows > 0) {
     // output data of each row
     while($row = $result->fetch_assoc())
     {
          $name = $row['city_name'];
          $id = $row["id"];
          $weather = "The weather in ".$name." is ".$row['weather_description']."<br>";
          $temp = $row['temp_kelvin'] *(9/5) -459.67;
          $temp = "The temperature is ".$temp;
     }
} else {
     echo "empty";
}
$myfile = fopen("testpage.html", "w") or die("Unable to open file!");
$html =<<<EOT
          <!DOCTYPE html>
          <html lang="en">
          <head>
            <meta charset="UTF-8">
            <title>Weather</title>
            <link rel="stylesheet" href="text.css">
EOT;
switch($id)
{
     case 1: $html .=<<<EOT
             <link rel="stylesheet" href="style1.css">
              </head>
              <body><center><h1>
EOT;
$html .=$weather.$temp;
             $html .=<<<EOT

              </h1><form action="get-data.php" method="post">
                  <input type="text" placeholder="city name" name="city"><br>
                  <input type="submit" value ="See Weather">
                </form></center>
              <div class="container-sun">
              <svg class="svg-sun" version="1.1" viewBox="0 0 100 100" preserveAspectRatio="xMinYMin meet">
              <circle cx="50" cy="50" r="35" id="sun"></circle>
              </svg>
              </div>
EOT;

               break;
     case 2: $html .=<<<EOT
     <link rel="stylesheet" href="style2.css">
                   </head>
                   <body>
     <div id="background-wrap">
         <div class="x1">
             <div class="cloud"></div>
         </div>

         <div class="x2">
             <div class="cloud"></div>
         </div>

         <div class="x3">
             <div class="cloud"></div>
         </div>

         <div class="x4">
             <div class="cloud"></div>
         </div>

         <div class="x5">
             <div class="cloud"></div>
         </div>
     </div><center><h1>
EOT;
     $html .= $weather.$temp;
          $html .= <<<EOT
            </h1><form action="get-data.php" method="post">
              <input type="text" placeholder="city name" name="city"><br>
              <input type="submit" value ="See Weather">
            </form></center>
EOT;
                  break;
     case 3:
     case 4: $html .=<<<EOT
              <link rel="stylesheet" href="style4.css">
              </head>
              <body>
              <div class="container">
                <div id="cloud-intro"><center><h1>
EOT;
               $html.=$weather.$temp;
               $html .=<<<EOT

                </h1><form action="get-data.php" method="post">
                   <input type="text" placeholder="city name" name="city"><br>
                   <input type="submit" value ="See Weather">
                 </form></center>
               </div> </div></div>

EOT;
          break;

     case 9:
     case 10:

     $html .=<<<EOT
 <title>CSS RAIN</title>




        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      html{height:100%;}
body {
background:#0D343A;
background:-webkit-gradient(linear,0% 0%,0% 100%, from(rgba(13,52,58,1) ), to(#000000)  );
background: -moz-linear-gradient(top, rgba(13,52,58,1) 0%, rgba(0,0,0,1) 100%);

overflow:hidden;}


.drop {
  background:-webkit-gradient(linear,0% 0%,0% 100%, from(rgba(13,52,58,1) ), to(rgba(255,255,255,0.6))  );
  background: -moz-linear-gradient(top, rgba(13,52,58,1) 0%, rgba(255,255,255,.6) 100%);
	width:1px;
	height:89px;
	position: absolute;
	bottom:200px;
	-webkit-animation: fall .63s linear infinite;
  -moz-animation: fall .63s linear infinite;

}

/* animate the drops*/
@-webkit-keyframes fall {
	to {margin-top:900px;}
}
@-moz-keyframes fall {
	to {margin-top:900px;}
}
    </style>
        <script src="js/prefixfree.min.js"></script>
  </head>
  <body>
    <section class="rain"></section>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        <script src="showerrain
EOT;
     if($id == 9)
     {$html .= '.js"></script><center><h1>';}
     else
     {$html .= '2.js"></script><center><h1>';}
     $html .= $weather.$temp;
     $html .= <<<EOT
       </h1><form action="get-data.php" method="post">
         <input type="text" placeholder="city name" name="city"><br>
         <input type="submit" value ="See Weather">
       </form></center>
EOT;
     break;

     case 11:
        $html .=<<<EOT
           <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
           <script src="storm.js"></script>
           <title>Bla</title>
               <style>
                   html, body {padding:0;margin:0}
               </style>
           </head>
           <body>
           <div style="position:relative;width:800px;height:800px">
           <form action="get-data.php" method="post">
                    <input type="text" placeholder="city name" name="city" style="position:absolute;left:500px;top:100px;width:309px;"><br>
                    <input type="submit" value ="See Weather" style="position:absolute;left:505px;top:200px;width:309px;">
                  </form>

EOT;
        $html .= $weather.$temp.'<canvas id="can" width="800" height="800"></canvas><h1 style="position:absolute;left:505px;top:50px;width:309px;">';

        break;
     case 13:
      $html .='<link rel="stylesheet" href="snow.css"></head><body><div id="snow"></div><center><h1>'.$weather.$temp;
      $html .=<<<EOT
      </h1><form action="get-data.php" method="post">
                         <input type="text" placeholder="city name" name="city"><br>
                         <input type="submit" value ="See Weather">
                       </form></center>
EOT;

     break;

     default:
     $html .=<<<EOT
   <!DOCTYPE html>
   <html >
     <head>
       <meta charset="UTF-8">
       <title>PARTICLE FOG GENERATOR</title>




           <style>
         /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
         #myCanvas {
     height: 200px;
     width: 1600px;
     max-width: 99%;
     min-width: 800px;
     position: absolute;
     bottom: 0;
   }

   body {
     background: black url(http://s.cdpn.io/16327/texture_bg.jpg) no-repeat 50% 0px;
   }

   div {
     font-family: 'Exo 2', sans-serif;
     font-size: 24px;
     text-align: center;
     color: white;
     position: absolute;
     height: 100px;
     width: 200px;
     top: 50%;
     left: 50%;
     margin-top: -50px;
     margin-left: -100px;
   }

   div p {
     font-size: 15px;
   }

       </style>


           <script src="js/prefixfree.min.js"></script>


     </head>

     <body>

       <!-- just for fonts-->
   <link href='http://fonts.googleapis.com/css?family=Exo+2:400,800' rel='stylesheet' type='text/css'>

   <!-- title --><h1><center>
EOT;
$html .= $weather.$temp;
$html .=<<<EOT
</h1><form action="get-data.php" method="post">
                         <input type="text" placeholder="city name" name="city" ><br>
                         <input type="submit" value ="See Weather">
                       </form></center>



   <!-- canvas stretches along the bottom -->
   <canvas id="myCanvas" height="200" width="800"></canvas>
       <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

           <script src="mist.js"></script>
     </body>
   </html>

EOT;

     break;

}
$html.=<<<EOT
             </body>
             </html>

EOT;
fwrite($myfile, $html);
fclose($myfile);
header("Location: testpage.html");
$conn->close();
?>
