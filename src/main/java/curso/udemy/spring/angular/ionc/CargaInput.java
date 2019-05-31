package curso.udemy.spring.angular.ionc;

import curso.udemy.spring.angular.ionc.domain.*;
import curso.udemy.spring.angular.ionc.domain.enums.EstadoPagamento;
import curso.udemy.spring.angular.ionc.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;

@Configuration
public class CargaInput implements CommandLineRunner {

    @Autowired
    CategoriaRepository categoriaRepository;

    @Autowired
    ProdutoRepository produtoRepository;

    @Autowired
    EstadoRepository estadoRepository;

    @Autowired
    CidadeRepository cidadeRepository;

    @Autowired
    ClienteRepository clienteRepository;

    @Autowired
    EnderecoRepository enderecoRepository;

    @Autowired
    private PedidoRepository pedidoRepository;

    @Autowired
    private PagamentoRepository pagamentoRepository;

    @Autowired
    private ItemPedidoRepository itemPedidoRepository;

    private Cidade cidade1;
    private Cidade cidade2;
    private Cidade cidade3;

    private Cliente cliente1;

    private Estado estado1;
    private Estado estado2;

    private Endereco endereco1;
    private Endereco endereco2;

    private Pedido pedido1;
    private Pedido pedido2;

    private Produto produto1;
    private Produto produto2;
    private Produto produto3;
    private Produto produto4;
    private Produto produto5;
    private Produto produto6;
    private Produto produto7;
    private Produto produto8;
    private Produto produto9;
    private Produto produto10;
    private Produto produto11;

    @Override
    public void run(String... args) throws Exception {
        inserirCategoriasEProdutos();
        inserirEstadosECidades();
        inserirClientesEEnderecos();
        inserirPedidosEPagamentos();
        inserirEstadosECidades();
        inserirItensDePedido();
    }

    private void inserirCategoriasEProdutos() {
        Categoria cat1 = new Categoria(null, "Informática");
        Categoria cat2 = new Categoria(null, "Escritório");
        Categoria cat3 = new Categoria(null, "Cama mesa e banho");
        Categoria cat4 = new Categoria(null, "Eletrônicos");
        Categoria cat5 = new Categoria(null, "Jardinagem");
        Categoria cat6 = new Categoria(null, "Decoração");
        Categoria cat7 = new Categoria(null, "Perfumaria");

        produto1 = new Produto(null, "Computador", 2000.00);
        produto2 = new Produto(null, "Impressora", 800.00);
        produto3 = new Produto(null, "Mouse", 80.00);
        produto4 = new Produto(null, "Mesa de escritório", 300.00);
        produto5 = new Produto(null, "Toalha", 50.00);
        produto6 = new Produto(null, "Colcha", 200.00);
        produto7 = new Produto(null, "TV true color", 1200.00);
        produto8 = new Produto(null, "Roçadeira", 800.00);
        produto9 = new Produto(null, "Abajour", 100.00);
        produto10 = new Produto(null, "Pendente", 180.00);
        produto11 = new Produto(null, "Shampoo", 90.00);

        cat1.getProdutos().addAll(Arrays.asList(produto1, produto2, produto3));
        cat2.getProdutos().addAll(Arrays.asList(produto2, produto4));
        cat3.getProdutos().addAll(Arrays.asList(produto5, produto6));
        cat4.getProdutos().addAll(Arrays.asList(produto1, produto2, produto3, produto7));
        cat5.getProdutos().addAll(Arrays.asList(produto8));
        cat6.getProdutos().addAll(Arrays.asList(produto9, produto10));
        cat7.getProdutos().addAll(Arrays.asList(produto11));

        produto1.getCategorias().addAll(Arrays.asList(cat1, cat4));
        produto2.getCategorias().addAll(Arrays.asList(cat1, cat2, cat4));
        produto3.getCategorias().addAll(Arrays.asList(cat1, cat4));
        produto4.getCategorias().addAll(Arrays.asList(cat2));
        produto5.getCategorias().addAll(Arrays.asList(cat3));
        produto6.getCategorias().addAll(Arrays.asList(cat3));
        produto7.getCategorias().addAll(Arrays.asList(cat4));
        produto8.getCategorias().addAll(Arrays.asList(cat5));
        produto9.getCategorias().addAll(Arrays.asList(cat6));
        produto10.getCategorias().addAll(Arrays.asList(cat6));
        produto11.getCategorias().addAll(Arrays.asList(cat7));

        categoriaRepository.saveAll(Arrays.asList(cat1, cat2, cat3, cat4, cat5, cat6, cat7));
        produtoRepository.saveAll(Arrays.asList(produto1, produto2
                , produto3, produto4, produto5, produto6, produto7, produto8
                , produto9, produto10, produto11));
    }

    private void inserirEstadosECidades() {
        estado1 = new Estado(null, "Minas Gerais");
        estado2 = new Estado(null, "São Paulo");

        cidade1 = new Cidade(null, "Uberlândia", estado1);
        cidade2 = new Cidade(null, "São Paulo", estado2);
        cidade3 = new Cidade(null, "Campinas", estado2);

        estado1.getCidades().addAll(Arrays.asList(cidade1));
        estado2.getCidades().addAll(Arrays.asList(cidade2, cidade3));

        estadoRepository.saveAll(Arrays.asList(estado1, estado2));
        cidadeRepository.saveAll(Arrays.asList(cidade1, cidade2, cidade3));
    }

    private void inserirClientesEEnderecos() {
        cliente1 = new Cliente(null, "Maria Silva", "maria@gmail.com", "36378912377", TipoCliente.PESSOAFISICA);
        cliente1.getTelefones().addAll(Arrays.asList("27363323", "93838393"));

        endereco1 = new Endereco(null, "Rua Flores", "300", "Apto 303", "Jardim", "38220834", cliente1, cidade1);
        endereco2 = new Endereco(null, "Avenida Matos", "105", "Sala 800", "Centro", "38777012", cliente1, cidade2);

        cliente1.getEnderecos().addAll(Arrays.asList(endereco1, endereco2));

        clienteRepository.saveAll(Arrays.asList(cliente1));
        enderecoRepository.saveAll(Arrays.asList(endereco1, endereco2));
    }

    private void inserirPedidosEPagamentos() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");

        pedido1 = new Pedido(null, sdf.parse("30/09/2017 10:32"), cliente1, endereco1);
        pedido2 = new Pedido(null, sdf.parse("10/10/2017 19:35"), cliente1, endereco2);

        Pagamento pagto1 = new PagamentoComCartao(null, EstadoPagamento.QUITADO, pedido1, 6);
        pedido1.setPagamento(pagto1);

        Pagamento pagto2 = new PagamentoComBoleto(null, EstadoPagamento.PENDENTE, pedido2, sdf.parse("20/10/2017 00:00"), null);
        pedido2.setPagamento(pagto2);

        cliente1.getPedidos().addAll(Arrays.asList(pedido1, pedido2));

        pedidoRepository.saveAll(Arrays.asList(pedido1, pedido2));
        pagamentoRepository.saveAll(Arrays.asList(pagto1, pagto2));
    }

    private void inserirItensDePedido() {
        ItemPedido itemPedido1 = new ItemPedido(pedido1, produto1, 0.00, 1, 2000.00);
        ItemPedido itemPedido2 = new ItemPedido(pedido1, produto3, 0.00, 2, 80.00);
        ItemPedido itemPedido3 = new ItemPedido(pedido2, produto2, 100.00, 1, 800.00);

        pedido1.getItens().addAll(Arrays.asList(itemPedido1, itemPedido2));
        pedido2.getItens().addAll(Arrays.asList(itemPedido3));

        produto1.getItens().addAll(Arrays.asList(itemPedido1));
        produto2.getItens().addAll(Arrays.asList(itemPedido3));
        produto3.getItens().addAll(Arrays.asList(itemPedido2));

        itemPedidoRepository.saveAll(Arrays.asList(itemPedido1, itemPedido2, itemPedido3));
    }

}
