package curso.udemy.spring.angular.ionc.services;

import java.util.Optional;

import curso.udemy.spring.angular.ionc.domain.Pedido;
import curso.udemy.spring.angular.ionc.repositories.PedidoRepository;
import curso.udemy.spring.angular.ionc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PedidoService {

    @Autowired
    private PedidoRepository repo;

    public Pedido buscar(Integer id) {
        Optional<Pedido> obj = repo.findById(id);
        return obj.orElseThrow(() -> new ObjectNotFoundException(
                "Objeto não encontrado! Id: " + id + ", Tipo: " + Pedido.class.getName()));
    }

}