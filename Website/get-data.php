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

$html =<<<EOT
          <!DOCTYPE html>
          <html lang="en">
          <head>
            <meta charset="UTF-8">
            <title>Weather</title>
EOT;
switch($id)
{
     case 1: $html .=<<<EOT
             <link rel="stylesheet" href="style1.css">
              </head>
              <body>
EOT;
             $html .=$weather.$temp;
             $html .=<<<EOT
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
     </div>
EOT;
     $html .= $weather.$temp;
                  break;
     case 3:
     case 4: $html .=<<<EOT
              <link rel="stylesheet" href="style4.css">
              </head>
              <body>
              <div class="container">
                <div id="cloud-intro">
EOT;
               $html.=$weather.$temp.'</div> </div> <img src="http://btstrategy.com/wp-new/wp-content/uploads/2013/10/cloud2_55171579                 .jpg">';
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
     {$html .= '.js"></script>';}
     else
     {$html .= '2.js"></script>';}
     $html .= $weather.$temp;
     break;

     default:
        $html .=<<<EOT
           <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
           <script src="storm.js"></script>
           <title>Bla</title>
               <style>
                   html, body {padding:0;margin:0}
               </style>
           </head>
           <body>
               <canvas id="can"></canvas>
EOT;
        $html .= $weather.$temp;
        break;

}
$html.=<<<EOT
             </body>
             </html>
EOT;

echo $html;
$conn->close();
?>
