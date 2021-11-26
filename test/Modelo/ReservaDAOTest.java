/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.util.ArrayList;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
public class ReservaDAOTest {
    
    public ReservaDAOTest() {
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
     * Test of listarReservas method, of class ReservaDAO.
     */
    @Test
    public void testListarReservas() {
        System.out.println("listarReservas");
        int rut = 19649953;
        ReservaDAO instance = new ReservaDAO();
         //Número de la reserva en la lista, que teóricamente existe según la base de datos.
        int expResult = 2;
        int result = instance.listarReservas(rut).get(0).getHorario_reservas_id_horario_reserva();
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(expResult != result){
            fail("El resultado no es el mismo.");
        }
    }

    /**
     * Test of traerReserva method, of class ReservaDAO.
     */
    @Test
    public void testTraerReserva() {
        System.out.println("traerReserva");
        int id = 6;
        ReservaDAO instance = new ReservaDAO();
        int expResult = 19649953;
        int result = instance.traerReserva(id).getRut_solicitante();
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(expResult != result){
            fail("El resultado no es el mismo.");
        }
    }

    /**
     * Test of traerReservaPorFecha method, of class ReservaDAO.
     */
    @Test
    public void testTraerReservaPorFecha() {
        System.out.println("traerReservaPorFecha");
        Date date = new Date(System.currentTimeMillis());
        ReservaDAO instance = new ReservaDAO();
        //La reserva no existirá en este caso
        Reserva result = instance.traerReservaPorFecha((java.sql.Date)date);
        String msg = "Se espera que resultado sea <" + result + ">.";
        assertNotNull(msg, result);
        if(result == null){
            fail("El resultado ha sido null.");
        }
    }

    /**
     * Test of verificarReservaDuplicada method, of class ReservaDAO.
     */
    @Test
    public void testVerificarReservaDuplicada() {
        System.out.println("verificarReservaDuplicada");
        Date date = new Date(System.currentTimeMillis());
        String horario = "15:00 - 18:00";
        int mesa = 5;
        ReservaDAO instance = new ReservaDAO();
        Reserva result = instance.verificarReservaDuplicada((java.sql.Date)date, horario, mesa);
        String msg = "Se espera que resultado sea <" + result + ">.";
        assertNotNull(msg, result);
        if(result == null){
            fail("El resultado no es el mismo.");
        }
    }

    /**
     * Test of crearReserva method, of class ReservaDAO.
     */
    @Test
    public void testCrearReserva() {
        System.out.println("crearReserva");
        Reserva r = new Reserva();
        ReservaDAO instance = new ReservaDAO();
        r.id_reserva = 999;
        r.horario_reservas_id_horario_reserva = 1;
        r.horario_reserva = "10:00 - 13:00";
        r.mesas_id_mesa = 2;
        r.rut_solicitante = 19649953;
        boolean expResult = true;
        boolean result = instance.crearReserva(r);
        String msg = "Se espera que resultado sea <" + expResult + ">.";
        assertEquals(msg, expResult, result);
        if(expResult != result){
            fail("La acción no se ha ejecutado.");
        }
    }
        
            /**
     * Test of eliminarReserva method, of class ReservaDAO.
     */
    @Test
    public void testEliminarReserva() {
        System.out.println("eliminarReserva");
        int id = 1;
        ReservaDAO instance = new ReservaDAO();
        int expResult = instance.traerReserva(id).getId_reserva();
        instance.eliminarReserva(id);
        if(expResult != 1){
            fail("La acción no se ha ejecutado.");
        }
    }
}
