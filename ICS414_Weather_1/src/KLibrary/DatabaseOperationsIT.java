/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KLibrary;

import static KLibrary.DatabaseOperations.myConn;
import static KLibrary.DatabaseOperations.myStat;
import java.sql.DriverManager;
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
public class DatabaseOperationsIT {
    
    public DatabaseOperationsIT() {
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
     * Test of CreateTable method, of class DatabaseOperations.
     * @throws java.lang.Exception
     */
    
     
    @Test
    public void testCreateTable() throws Exception {
        System.out.println("CreateTable");
        String name = "";
        String[] colNamesAndExtraStatements = null;
        String[] colTypes = null;
        DatabaseOperations.myConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"414_Weather","root",""); 
        myStat = myConn.createStatement();
        DatabaseOperations.CreateTable(name, colNamesAndExtraStatements, colTypes);

        
    }

    /**
     * Test of InsertInToTable method, of class DatabaseOperations.
     * @throws java.lang.Exception
     */
    @Test
    public void testInsertInToTable() throws Exception {
        System.out.println("InsertInToTable");
        String tableName = "";
        String[] colNames = null;
        String[] values = null;
        DatabaseOperations instance = new DatabaseOperations();
        instance.InsertInToTable(tableName, colNames, values);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of QueryWithBasicWhereClause method, of class DatabaseOperations.
     * @throws java.lang.Exception
     */
    @Test
    public void testQueryWithBasicWhereClause() throws Exception {
        System.out.println("QueryWithBasicWhereClause");
        String tableName = "";
        String[] colNamesReturned = null;
        String[] where = null;
        DatabaseOperations.QueryWithBasicWhereClause(tableName, colNamesReturned, where);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of UpdateTable method, of class DatabaseOperations.
     * @throws java.lang.Exception
     */
    @Test
    public void testUpdateTable() throws Exception {
        System.out.println("UpdateTable");
        String tableName = "";
        String[] colNames1 = null;
        String[] values1 = null;
        String[] colNames2 = null;
        String[] values2 = null;
        DatabaseOperations.UpdateTable(tableName, colNames1, values1, colNames2, values2);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
