/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial.sistemas.distribuidos.controladores;

import com.parcial.sistemas.distribuidos.model.Cliente;
import com.parcial.sistemas.distribuidos.model.Factura;
import com.parcial.sistemas.distribuidos.model.Producto;
import com.parcial.sistemas.distribuidos.model.TipoProducto;
import com.parcial.sistemas.distribuidos.repositorios.ClienteRepositorio;
import com.parcial.sistemas.distribuidos.repositorios.FacturaRepositorio;
import com.parcial.sistemas.distribuidos.repositorios.ProductoRepositorio;
import com.parcial.sistemas.distribuidos.repositorios.TipoProductoRepositorio;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author mcastro
 */
@RestController
public class ServiciosControlador {

    @Autowired
    ClienteRepositorio clienteRepositorio;

    @Autowired
    FacturaRepositorio facturaRepositorio;

    @Autowired
    ProductoRepositorio productoRepositorio;

    @Autowired
    TipoProductoRepositorio tipoProductoRepositorio;

    @GetMapping("/clientes")
    public List<Cliente> clientes() {

        return clienteRepositorio.findAll();
    }

    @GetMapping("/facturas")
    public List<Factura> facturas(@RequestParam(value = "cliente") String identificacion) {

        Cliente cliente = clienteRepositorio.findByIdentificacion(identificacion);

        return facturaRepositorio.findByCliente(cliente);
    }

    @GetMapping("/productos")
    public List<Producto> productos(@RequestParam(value = "factura") String codigo) {

        return productoRepositorio.findByFacturas(codigo);
    }

    @DeleteMapping("/eliminarProducto")
    public String eliminarProductos(@RequestParam(value = "codigo") String codigo) {
        try {
            Producto producto = productoRepositorio.findByCodigo(codigo).get(0);
            productoRepositorio.delete(producto);
            return "Producto eliminado";
        } catch (Exception e) {
            return "Error eliminando producto " + e.getMessage();
        }

    }

    @PostMapping("/tipoProducto")
    public TipoProducto agregarTipoProducto(@RequestBody TipoProducto tipo) {
        return tipoProductoRepositorio.save(tipo);
    }

    @PutMapping("/clientes/{identificacion}")
    public Cliente actualizarCliente(@PathVariable String identificacion, @RequestBody Cliente cliente) {
        
        Cliente clienteToUpdate = clienteRepositorio.findByIdentificacion(identificacion);
        
        clienteToUpdate.setNombre(cliente.getNombre());
        clienteToUpdate.setApellido(cliente.getApellido());
        clienteToUpdate.setDireccion(cliente.getDireccion());
        
        return clienteRepositorio.save(clienteToUpdate);
    }

}
