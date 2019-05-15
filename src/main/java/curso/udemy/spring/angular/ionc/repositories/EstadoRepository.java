package curso.udemy.spring.angular.ionc.repositories;

import curso.udemy.spring.angular.ionc.domain.Estado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EstadoRepository extends JpaRepository<Estado, Integer> {
}
