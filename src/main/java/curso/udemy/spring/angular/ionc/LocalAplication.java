package curso.udemy.spring.angular.ionc;

import curso.udemy.spring.angular.ionc.services.S3Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LocalAplication {

    @Autowired
    private S3Service s3Service;

    public static void main(String[] args) {
        SpringApplication.run(LocalAplication.class, args);
    }

    public void run(String... args) throws Exception {
        s3Service.uploadFile("C:\\temp\\fotos\\ana.jpg");
    }
}
