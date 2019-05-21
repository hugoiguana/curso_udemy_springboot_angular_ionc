package curso.udemy.spring.angular.ionc.repositories;

import curso.udemy.spring.angular.ionc.domain.Pedido;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PedidoRepository extends JpaRepository<Pedido, Integer> {

}
