package curso.udemy.spring.angular.ionc.repositories;

import curso.udemy.spring.angular.ionc.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Integer> {

}
