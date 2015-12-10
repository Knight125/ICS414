/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ics414_weather;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Chase
 */
public class ICS414_WeatherIT {
    
    public ICS414_WeatherIT() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }


    /**
     * Test of parseJson method, of class ICS414_Weather.
     * @throws java.lang.Exception
     */
    @Test
    public void testParseJson() throws Exception {
        System.out.println("parseJson");
        String city = "Aiea";
        String test = ICS414_Weather.getURLSource("http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=2de143494c0b295cca9337e1e96b00e0");
        String[] weatherData = new String[11];
        weatherData[0] = city;
        ObjectMapper mapper = new ObjectMapper();
        JsonNode root;
        root = mapper.readTree(test);
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
        
        String[] expResult = weatherData;
        String[] result = ICS414_Weather.parseJson(test, city);
        Assert.assertArrayEquals(expResult, result);

    }

    /**
     * Test of parseJson method, of class ICS414_Weather.
     * @throws java.lang.Exception
     */
    @Test
    public void testParseJson2() throws Exception {
        System.out.println("parseJson");
        String city = "Aiea";
        String test = ICS414_Weather.getURLSource("http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid=2de143494c0b295cca9337e1e96b00e0");
        String[] weatherData = new String[11];
        weatherData[0] = city;
        ObjectMapper mapper = new ObjectMapper();
        JsonNode root;
        root = mapper.readTree(test);
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
        
        String[] expResult = null;
        String[] result = ICS414_Weather.parseJson(test, city);
        Assert.assertArrayEquals(expResult, result);

    }

    /**
     * Test of getURLSource method, of class ICS414_Weather.
     * @throws java.lang.Exception
     */
    @Test
    public void testGetURLSource() throws Exception {
        System.out.println("getURLSource");
        String url = "http://api.openweathermap.org/data/2.5/weather?q="+"Aiea"+"&appid=2de143494c0b295cca9337e1e96b00e0";
        String result = ICS414_Weather.getURLSource(url);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
