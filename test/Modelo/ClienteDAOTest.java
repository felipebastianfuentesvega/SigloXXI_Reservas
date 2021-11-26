/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

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
public class ClienteDAOTest {
    
    public ClienteDAOTest() {
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
     * Test of validarCliente method, of class ClienteDAO.
     */
    @Test
    public void testValidarCliente() {
        System.out.println("validarCliente");
        ClienteDAO instance = new ClienteDAO();
        String email = "pruebatestingjava@gmail.com";
        String password = instance.traerCliente(email).getClave_cliente();
        boolean expResult = true;
        boolean result = instance.validarCliente(email, password);
        String msg = "Se espera que <" + email + "> exista y tenga como clave <" + password +">";
        assertEquals(msg, expResult, result);
        if(expResult != result){
            fail("The test case is a prototype.");
        }
    }
    
    /**
     * Test of validarCliente method, of class ClienteDAO.
     */
    @Test
    public void testValidarClienteFallido() {
        System.out.println("validarCliente");
        String email = "pruebatestingjavanoexistente@gmail.cl";
        String password = "Abcd.1234";
        ClienteDAO instance = new ClienteDAO();
        boolean expResult = false;
        boolean result = instance.validarCliente(email, password);
        String msg = "Se espera que <" + email + "> no exista o no tenga como clave <" + password +">";
        assertFalse(msg, result);
        if(expResult != result){
            fail("El correo tiene como clave el valor indicado.");
        }
    }

    /**
     * Test of traerCliente method, of class ClienteDAO.
     */
    @Test
    public void testTraerCliente() {
        System.out.println("traerCliente");
        String email = "pruebatestingjava@gmail.com";
        ClienteDAO instance = new ClienteDAO();
        ClienteDAO dao = new ClienteDAO();
        String expResult = email;
        String result = instance.traerCliente(email).getEmail_cliente();
        String msg = "Se espera que el usuario de correo <" + email + "> exista.";
        assertEquals(msg, expResult, result);
        if(!expResult.equals(result)){
            fail("El email no es el mismo."); 
        }
        
    }
    
    /**
     * Test of traerCliente method, of class ClienteDAO.
     */
    @Test
    public void testTraerClienteFallido() {
        System.out.println("traerCliente");
        String email = "pruebatestingjavanoexistente@gmail.cl";
        ClienteDAO instance = new ClienteDAO();
        ClienteDAO dao = new ClienteDAO();
        String expResult = email;
        String result = instance.traerCliente(email).getEmail_cliente();
        String msg = "Se espera que el usuario de correo <" + email + "> no exista.";
        assertNull(msg, result);
        if(expResult.equals(result)){
            fail("El usuario de correo <" + email + "> existe. No se puede verificar que el método falle"); 
        }
        
    }

    /**
     * Test of crearCliente method, of class ClienteDAO.
     */
    @Test
    public void testCrearCliente() {
        System.out.println("crearCliente");
        Cliente cl = new Cliente();
        ClienteDAO instance = new ClienteDAO();
        cl.rut_cliente = 1;
        cl.digito_verificador_cliente = "1";
        cl.clave_cliente = "clave.cliente.nuevo";
        cl.nombre_cliente = "Prueba";
        cl.papellido_cliente = "Prueba";
        cl.sapellido_cliente = "Prueba";
        cl.telefono_cliente = 11223344;
        cl.direccion_cliente = "Prueba";
        cl.email_cliente = "pruebacreacion2@gmail.com";
        boolean result = instance.crearCliente(cl);
        String msg = "La acción se ejecuta con éxito.";
        assertTrue(msg, result);
        if(result == false){
            fail("La acción no se ha ejecutado.");
        }
    }
    
    /**
     * Test of modificarCliente method, of class ClienteDAO.
     */
    @Test
    public void testModificarCliente() {
        System.out.println("modificarCliente");
        int rut_cliente = 1;
        String clave_cliente = "PRUEBAACTUALIZADO";
        String nombre_cliente = "PRUEBAACTUALIZADO";
        String papellido_cliente = "PRUEBAACTUALIZADO";
        String sapellido_cliente = "PRUEBAACTUALIZADO";
        int telefono_cliente = 911111111;
        String direccion_cliente = "PRUEBAACTUALIZADO";
        String email_cliente = "PRUEBAACTUALIZADO@GMAIL.COM";
        ClienteDAO instance = new ClienteDAO();
        boolean expResult = true;
        boolean result = instance.modificarCliente(rut_cliente, clave_cliente, nombre_cliente, papellido_cliente, sapellido_cliente, telefono_cliente, direccion_cliente, email_cliente);
        String msg = "La acción se ejecuta con éxito.";
        assertEquals(msg, expResult, result);
        if(result == false){
            fail("La acción no se logró ejecutar."); 
        }
    }

    /**
     * Test of modificarPass method, of class ClienteDAO.
     */
    @Test
    public void testModificarPass() {
        System.out.println("modificarPass");
        String email = "pruebatestingjava@gmail.com";
        String clave_cliente = "Actualizado.12345";
        ClienteDAO instance = new ClienteDAO();
        boolean expResult = true;
        boolean result = instance.modificarPass(email, clave_cliente);
        String msg = "El método debe retornar un valor True.";
        assertTrue(msg, result);
        if(expResult != result){
           fail("La contraseña no se ha modificado."); 
        }
        instance.modificarPass(email, "Prueba.Java");
    }

    /**
     * Test of randomString method, of class ClienteDAO.
     */
    @Test
    public void testRandomString() {
        System.out.println("randomString");
        int len = 10;
        ClienteDAO instance = new ClienteDAO();
        String pass = instance.randomString(len);
        String msg = "El método debe retornar un valor aleatorio. En este caso será de <"+pass+">";
        assertNotNull(msg, pass);
        if(pass.length() != 10){
            fail("No se ha generado una contraseña de 10 caracteres como se suponía.");
        }
        
    }
}
