package curso.udemy.spring.angular.ionc.config;

import java.text.ParseException;

import curso.udemy.spring.angular.ionc.services.DBService.DBService;
import curso.udemy.spring.angular.ionc.services.EmailService;
import curso.udemy.spring.angular.ionc.services.SmtpEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Profile("dev")
public class DevConfig {

    @Autowired
    private DBService dbService;

    @Value("${spring.jpa.hibernate.ddl-auto}")
    private String strategy;

    @Bean
    public boolean instantiateDatabase() throws ParseException {
        if (!"create".equals(strategy) || !"create-drop".equals(strategy)) {
            return false;
        }
        dbService.instantiateTestDatabase();
        return true;
    }

    @Bean
    public EmailService emailService() {
        return new SmtpEmailService();
    }
}