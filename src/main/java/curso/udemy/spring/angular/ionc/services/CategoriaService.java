package curso.udemy.spring.angular.ionc.services;

import curso.udemy.spring.angular.ionc.domain.Categoria;
import curso.udemy.spring.angular.ionc.repositories.CategoriaRepository;
import curso.udemy.spring.angular.ionc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CategoriaService {

    @Autowired
    CategoriaRepository repo;

    public Categoria find(Integer id) {
        Optional<Categoria> obj = repo.findById(id);
        return obj.orElseThrow(() -> new ObjectNotFoundException(
                "Objeto não encontrado! Id: " + id + ", Tipo: " + Categoria.class.getName()));
    }

}