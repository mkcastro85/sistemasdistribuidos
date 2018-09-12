/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.parcial.sistemas.distribuidos.repositorios;

import com.parcial.sistemas.distribuidos.model.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author mcastro
 */
@Repository
public interface ProductoRepositorio extends JpaRepository<Producto, Integer> {

    @Query(value = "select p.* "
            + "from producto p "
            + "inner join factura f on f.id=:factura "
            + "inner join producto_factura pf on pf.id_factura=f.id and pf.id_producto=p.id", nativeQuery = true)
    List<Producto> findByFacturas(@Param("factura") String factura);

    List<Producto> findByCodigo(String codigo);

}
