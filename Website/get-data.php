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
     case 3: $html .=<<<EOT
     <link rel="stylesheet" type="text/css" href="style3.css">
     <script language="javascript" type="text/javascript" src="jquery-1.8.3.js"></script>
     <script language="javascript" type="text/javascript" src="scatteredclouds.js"></script>
     </head>

     <div class="clouds">
         <div class="cloud-1" data-speed="35000"></div>
         <div class="cloud-2" data-speed="45000" data-delay="15000"></div>
         <div class="cloud-3" data-speed="40000"></div>
         <div class="cloud-4" data-speed="38000" data-delay="20000"></div>
     </div>
EOT;
     $html .= $weather.$temp;
              break;
     case 70: $html .=<<<EOT
              <link rel="stylesheet" href="style4.css">
              </head>
              <body>
              <div class="container">
                <div id="cloud-intro">
EOT;
               $html.=$weather.$temp.'</div> </div> <img src="http://btstrategy.com/wp-new/wp-content/uploads/2013/10/cloud2_55171579                 .jpg">';
          break;

     case 4:

     $html .= '<link rel="stylesheet" href="style10.css"><script language="javascript" type="text/javascript" src="rain10.js"></script></head><body><section class="rain"></section>'.$weather.$temp;
     break;

     case 50:

     default:

}
$html.=<<<EOT
             </body>
             </html>
EOT;

echo $html;
$conn->close();
?>
