package curso.udemy.spring.angular.ionc.services;

import java.util.Date;
import java.util.Optional;

import curso.udemy.spring.angular.ionc.domain.Cliente;
import curso.udemy.spring.angular.ionc.domain.ItemPedido;
import curso.udemy.spring.angular.ionc.domain.PagamentoComBoleto;
import curso.udemy.spring.angular.ionc.domain.Pedido;
import curso.udemy.spring.angular.ionc.domain.enums.EstadoPagamento;
import curso.udemy.spring.angular.ionc.repositories.ItemPedidoRepository;
import curso.udemy.spring.angular.ionc.repositories.PagamentoRepository;
import curso.udemy.spring.angular.ionc.repositories.PedidoRepository;
import curso.udemy.spring.angular.ionc.resources.PedidoResource;
import curso.udemy.spring.angular.ionc.security.UserSS;
import curso.udemy.spring.angular.ionc.services.exceptions.AuthorizationException;
import curso.udemy.spring.angular.ionc.services.exceptions.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PedidoService {

    @Autowired
    private PedidoRepository repo;

    @Autowired
    private BoletoService boletoService;

    @Autowired
    private PagamentoRepository pagamentoRepository;

    @Autowired
    private ItemPedidoRepository itemPedidoRepository;

    @Autowired
    private ProdutoService produtoService;

    @Autowired
    private ClienteService clienteService;

    @Autowired
    private EmailService emailService;

    public Pedido find(Integer id) {
        Optional<Pedido> obj = repo.findById(id);
        return obj.orElseThrow(() -> new ObjectNotFoundException(
                "Objeto não encontrado! Id: " + id + ", Tipo: " + Pedido.class.getName()));
    }

    @Transactional
    public Pedido insert(Pedido pedido) {
        pedido.setId(null);
        pedido.setInstante(new Date());
        pedido.setCliente(clienteService.find(pedido.getCliente().getId()));
        pedido.getPagamento().setEstado(EstadoPagamento.PENDENTE);
        pedido.getPagamento().setPedido(pedido);
        if (pedido.getPagamento() instanceof PagamentoComBoleto) {
            PagamentoComBoleto pagto = (PagamentoComBoleto) pedido.getPagamento();
            boletoService.preencherPagamentoComBoleto(pagto, pedido.getInstante());
        }
        pedido = repo.save(pedido);
        //pagamentoRepository.save(pedido.getPagamento()); -- Não presisa, pois o pagamento é inserido em cascata através do save do pedido.
        for (ItemPedido ip : pedido.getItens()) {
            ip.setDesconto(0.0);
            ip.setProduto(produtoService.find(ip.getProduto().getId()));
            ip.setPreco(ip.getProduto().getPreco());
            ip.setPedido(pedido);
        }
        itemPedidoRepository.saveAll(pedido.getItens());
        emailService.sendOrderConfirmationEmail(pedido);
        return pedido;
    }

    public Page<Pedido> findPage(Integer page, Integer linesPerPage, String orderBy, String direction) {
        UserSS user = UserService.authenticated();
        if (user == null) {
            throw new AuthorizationException("Acesso negado");
        }
        PageRequest pageRequest = PageRequest.of(page, linesPerPage, Sort.Direction.valueOf(direction), orderBy);
        Cliente cliente = clienteService.find(user.getId());
        return repo.findByCliente(cliente, pageRequest);
    }

}