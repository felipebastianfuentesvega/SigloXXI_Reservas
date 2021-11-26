/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Felipe Fuentes
 */
public class MesaDAOTest {
    
    public MesaDAOTest() {
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
     * Test of listarMesasDisponibles method, of class MesaDAO.
     */
    @Test
    public void testListarMesasDisponibles() {
        System.out.println("listarMesasDisponibles");
        String fecha = "09/11/21";
        int horario = 1;
        MesaDAO instance = new MesaDAO();
        //Número de la mesa en la lista, que teóricamente está disponible según la base de datos.
        int expResult = 1;
        int result = instance.listarMesasDisponibles(fecha, horario).get(0).getId_mesa();
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(result != 1){
            fail("The test case is a prototype.");
        }
    }
}
