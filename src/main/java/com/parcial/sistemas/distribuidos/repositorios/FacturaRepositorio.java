/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial.sistemas.distribuidos.repositorios;

import com.parcial.sistemas.distribuidos.model.Cliente;
import com.parcial.sistemas.distribuidos.model.Factura;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author mcastro
 */
@Repository
public interface FacturaRepositorio extends JpaRepository<Factura, Integer> {

    List<Factura> findByCliente(Cliente cliente);

}
