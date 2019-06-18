package curso.udemy.spring.angular.ionc.services;

import curso.udemy.spring.angular.ionc.domain.Cliente;
import curso.udemy.spring.angular.ionc.domain.Pedido;
import org.springframework.mail.SimpleMailMessage;

public interface EmailService {
    void sendOrderConfirmationEmail(Pedido obj);
    void sendEmail(SimpleMailMessage msg);
    void sendNewPasswordEmail(Cliente cliente, String newPass);
}
