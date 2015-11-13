/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ics414_weather;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import KLibrary.DatabaseOperations;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import static java.lang.Math.floor;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;


/**
 *
 * @author Kara
 */
public class NonDatabaseVersion {
    public static int index = 0;
    public static int countOutside = 0;
    public static int[] values = new int[92];
    
    public static void main(String[] args) throws MalformedURLException, IOException, SQLException 
    {
        checkWeb(50,"http://api.openweathermap.org/data/2.5/weather?q=",1, 50);
    }
    
    private static int getTotalMinutes()
    {
        Calendar calendar = Calendar.getInstance();
        int hours = calendar.get(Calendar.HOUR_OF_DAY);
        int minutes = calendar.get(Calendar.MINUTE);
        int totalMinutes = (hours *60) + minutes;
        return totalMinutes;
    }
        
    private static void checkWeb(int checkEveryXMinutes,String URL, int start, int end) throws SQLException, IOException
    {
     int initialTimeMin = getTotalMinutes();
     int count = 0;
      while(true)
       {
        int SysTimeMin = getTotalMinutes();
        if(SysTimeMin == 0)
        {
            initialTimeMin = 0;//When it's a new day it resets
        }
        if(SysTimeMin == initialTimeMin + (checkEveryXMinutes * count) )
        {
            String[] cities = getCitiesArray();//I thought about reading this in from a file, 
                                               //using a class I made, but there's not that
                                               //many cities and it saves overhead
            for(int i = 0; i < cities.length;i++)
            {
                String city = cities[i];
                String test = getURLSource(URL+city+"&appid=2de143494c0b295cca9337e1e96b00e0");
                String[] weather = parseJson(test, city);
                values[i] = Integer.parseInt(weather[3]);
                if((values[i] < start)|| values[i]> end)
                {
                    values[i] = 1;
                }
                System.out.println(values[i]);
            }
            count++;
            while(SysTimeMin == getTotalMinutes());
            
       } 
       }
    }
    
//take array and add elements to database
    //It's too messy to put in the main method, so I seperated it out
    private static String [] getCitiesArray()
    {
          String[] cities = {"Aiea","Anahola","Barbers-Point", "Captain-Cook","Eleele","Ewa-Beach",
                           "Fort-Shafter","Haiku","Hakalau","Haleiwa","Hana","Hanalei","Hanamaulu",
                           "Hanapepe","Hauula","Hawaii-National-Park","Hawaiian-Ocean-View","Hawi",
                           "Hickam-AFB","Hilo","Holualoa","Honaunau","Honokaa","Honolulu","Honomu",
                           "Hoolehua","Kaaawa","Kahului","Kailua","Kailua-Kona","Kalaheo","Kalaupapa",
                           "Kamuela","Kaneohe","Kapaa","Kapaau","Kapolei","Kaumakani","Kaunakakai",
                           "Kawela-Bay","Keaau","Kealakekua","Kealia","Keauhou","Kekaha","Kihei",
                           "Kilauea","Koloa","Kualapuu","Kula","Kunia","Kurtistown","Lahaina","Laie",
                           "Lanai-City","Laupahoehoe","Lawai","Lihue","Makawao","Makaweli","Maunaloa",
                           "Mililani","Mountain-View","Naalehu","Ninole","Ocean-View","Ookala","Paauhau",
                           "Paauilo","Pahala","Pahoa","Paia","Papaaloa","Papaikou","Pearl-City",
                           "Pearl-Harbor","Pepeekeo","Princeville","Pukalani","Puunene",
                           "Schofield-Barracks","Volcano","Wahiawa","Waialua","Waianae","Waikoloa",
                           "Wailuku","Waimanalo","Waimea","Waipahu","Wake-Island","Wheeler-Army-Airfield"};
          return cities;
        
    }
    
    private static String[] parseJson(String JSON, String city) throws IOException
    {//I used 
        String[] weatherData = new String[11];
        weatherData[0] = city;
        ObjectMapper mapper = new ObjectMapper();
        JsonNode root = mapper.readTree(JSON);
        JsonNode weather = root.path("weather");
        
        //I had to split up weather because it couldn't accept the format:
        //"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}]
        //the [] were causing it problems, so I had to remove them and make a new tree.
        String W = weather.toString();
        W = W.substring(1, W.length()- 1);
        JsonNode rootW = mapper.readTree(W);
        weatherData[1] = rootW.path("main").toString();
        weatherData[2] = rootW.path("description").toString();
        weatherData[3] = rootW.path("icon").toString();
        weatherData[3] = weatherData[3].substring(1, 3);//for id conversion
        
        weatherData[4] = root.path("main").path("temp").toString();
        weatherData[5] = root.path("main").path("humidity").toString();
        weatherData[6] = root.path("wind").path("speed").toString();
        weatherData[7] = root.path("wind").path("deg").toString();
        weatherData[8] = root.path("clouds").path("all").toString();
        weatherData[9] = root.path("sys").path("sunrise").toString();
        weatherData[10] = root.path("sys").path("sunset").toString();
        
        return weatherData;
        
    }
    
    private static String getURLSource(String url) throws IOException
    {//found at: http://stackoverflow.com/questions/8616781/how-to-get-a-web-pages-source-code-from-java
         URL weatherAPI = new URL(url);
            URLConnection weather = weatherAPI.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(weather.getInputStream(), "UTF-8"));
            
            
            String inputLine;
            StringBuilder a = new StringBuilder();
            while ((inputLine = in.readLine()) != null)
                a.append(inputLine);
            in.close();

            return a.toString();
        
    }

    
}
