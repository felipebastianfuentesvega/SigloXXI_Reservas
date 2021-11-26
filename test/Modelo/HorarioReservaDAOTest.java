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
public class HorarioReservaDAOTest {
    
    public HorarioReservaDAOTest() {
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
     * Test of recuperarHorario method, of class HorarioReservaDAO.
     */
    @Test
    public void testRecuperarHorario() {
        System.out.println("recuperarHorario");
        int id = 1;
        HorarioReservaDAO instance = new HorarioReservaDAO();
        String expResult = "10:00 - 13:00";
        String result = instance.recuperarHorario(id).getHorario_reserva();
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(!expResult.equals(result)){
            fail("El resultado no es el mismo.");
        }
    }

    /**
     * Test of listarHorarios method, of class HorarioReservaDAO.
     */
    @Test
    public void testListarHorarios() {
        System.out.println("listarHorarios");
        HorarioReservaDAO instance = new HorarioReservaDAO();
        String expResult = "10:00 - 13:00";
        String result = instance.listarHorarios().get(0).getHorario_reserva();
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(!expResult.equals(result)){
            fail("El resultado no es el mismo.");
        }
    }
    
}
