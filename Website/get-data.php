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
              <div class="sun">
                  <div class="ray_box">
                      <div class="ray ray1"></div>
                      <div class="ray ray2"></div>
                      <div class="ray ray3"></div>
                      <div class="ray ray4"></div>
                      <div class="ray ray5"></div>
                      <div class="ray ray6"></div>
                      <div class="ray ray7"></div>
                      <div class="ray ray8"></div>
                      <div class="ray ray9"></div>
                      <div class="ray ray10"></div>
                  </div>
              </div>
EOT;
               break;
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

          break;
     case 10:

     case 11:

     case 13:

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
