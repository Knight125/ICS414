/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KLibrary;

import java.io.BufferedReader;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Chase
 */
public class ReadFileIT2 {
    
    public ReadFileIT2() {
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
     * Test of ReadingFile method, of class ReadFile.
     */
    public String[] lines;
    public String path;
    @Test
    public void testReadingFile() throws Exception {
        System.out.println("ReadingFile");
        this.path = "/Users/Chase/Documents/UH Manoa Fall 2015/ICS 321/csv_file.txt";
        BufferedReader br = ReadFile.openFile(path);
        int numLines = ReadFile.findNumberOfLines(br);
        br = ReadFile.openFile(path);
        lines = ReadFile.fillArrayWithLines(numLines, br);
        String[] expResult = null;
        String[] result = lines;
        assertArrayEquals(expResult, result);
    }

    /**
     * Test of fillArrayWithLines method, of class ReadFile.
     * @throws java.lang.Exception
     */
    @Test
    public void testFillArrayWithLines() throws Exception {
        System.out.println("fillArrayWithLines");
        this.path = "/Users/Chase/Documents/UH Manoa Fall 2015/ICS 321/csv_file.txt";
        BufferedReader br = ReadFile.openFile(path);
        int numLines = ReadFile.findNumberOfLines(br);
        br = ReadFile.openFile(path);
        lines = ReadFile.fillArrayWithLines(numLines, br);
        String[] expResult = null;
        String[] result = lines;
        assertArrayEquals(expResult, result);
        
    }
    
}
