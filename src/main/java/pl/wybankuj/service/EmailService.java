package pl.wybankuj.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

@Service
public class EmailService {

    private final static Logger logger = LogManager.getLogger(EmailService.class);
    private final static String MAIL_SENDER = "kontakt@wybankuj.pl";
    private final JavaMailSender javaMailSender;

    public EmailService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    public void send(String to, String title, String credit, String offer,
                     int amount, int creditPeriod, String phone, String email, String name) {
        MimeMessage mail = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mail, true);
            helper.setTo(to);
            helper.setReplyTo(MAIL_SENDER);
            helper.setFrom(MAIL_SENDER);
            helper.setSubject(title);
            helper.setText(
                    "<html>" +
                            "<body>" +
                            "<div style='margin: auto; padding: 0; border: 0; border-bottom: 1em solid #1C3752; box-shadow: 0 4px 2px -2px #BF4042;'>"
                            + "<p style='margin-left: 3em; padding: 0;'><a href='http://wybankuj-preversion1.herokuapp.com'>" +
//                            "<img src='cid:logo' style='width: 100px; height: 35px;' />" +
                            "</a></p>" +
                            "</div>" +
                            "<br /><br />" +
                            "<div style='color: #1C3752; font-size: 16px;'>" +
                            "Dzień dobry, <br /><br />" +
                            "interesuje mnie kredyt <span style='color: #BF4042'>" + credit + "</span> o poniższych parametrach: <br /><br />" +
                            "1. oferta - <span style='color: #BF4042'>" + offer + "</span><br />" +
                            "2. kwota - <span style='color: #BF4042'>" + amount + "</span> zł <br />" +
                            "3. okres kredytowania - <span style='color: #BF4042'>" + creditPeriod + "</span> miesięcy <br /><br />" +
                            "Proszę o kontakt: <br /><br />" +
                            "- nr telefonu - <span style='color: #BF4042'>" + phone + "</span><br />" +
                            "- e-mail - <span style='color: #BF4042'>" + email + "</span><br /><br />" +
                            "Pozdrawiam, <br />" +
                            "" + name + "" +
                            "</div>" +
                            "</body>" +
                            "</html>", true
            );
//            helper.addInline("logo", new File("${pageContext.request.contextPath}/img/logo.png"));
            javaMailSender.send(mail);
            logger.info("Wiadomość została wysłana - " + title);
        } catch (MessagingException e) {
            logger.warn("Wiadomość NIE została wysłana!");
        }
    }

    public void sendToUser(String to, String title,
                           String bank) {
        MimeMessage mail = javaMailSender.createMimeMessage();

        try {
            MimeMessageHelper helper = new MimeMessageHelper(mail, true);
            helper.setTo(to);
            helper.setReplyTo(MAIL_SENDER);
            helper.setFrom(MAIL_SENDER);
            helper.setSubject(title);
            helper.setText(
                    "<html>" +
                            "<body>" +
                            "<div style='margin: auto; padding: 0; border: 0; border-bottom: 1em solid #1C3752; box-shadow: 0 4px 2px -2px #BF4042;'>"
                            + "<p style='margin-left: 3em; padding: 0;'><a href='http://wybankuj-preversion1.herokuapp.com'>" +
//                            "<img src='cid:logo' style='width: 100px; height: 35px;' />" +
                            "</a></p>" +
                            "</div>" +
                            "<br /><br />" +
                            "<div style='color: #1C3752; font-size: 16px;'>" +
                            "Dzień dobry, <br /><br />" +
                            "Twoja wiadomość została przesłana do banku " +
                            "<span style='color: #BF4042'>" + bank + "</span>.<br />" +
                            "Pracownik banku skontaktuje się w ciągu 1 dnia roboczego i zaproponuje termin spotkania.<br /><br />" +
                            "Pozdrawiamy, <br />" +
                            "Zespół Wybankuj.pl" +
                            "<br /><br />" +
                            "<p style='font-size: 10px; text-align: justify;'>" +
                            "Wyraziłeś zgodę na kontakt doradcy banku <span style='color: #BF4042'>" + bank + "</span> w celu przekazania informacji dotyczących szczegółów oferty banku, wymaganej listy dokumentów oraz kolejnych kroków procesu kredytowego, a także na przedstawienie propozycji spotkania w placówce banku.<br /><br />" +
                            "Administratorem danych osobowych jest Big Bee Sp. z o.o. z siedzibą w Katowicach przy ul. Św. Jana 11/4. Pani/Pana dane osobowe w postaci imienia, nazwiska, nr telefonu, adresu e-mail będą przetwarzane w celu marketingu bezpośredniego produktów i usług własnych Administratora na podstawie prawnie uzasadnionego interesu Administratora w promocji produktów własnych. Przysługuje Pani/Panu prawo sprzeciwu wobec przetwarzania danych. Więcej informacji na temat przetwarzania danych osobowych dostępne jest w w/w placówce Administratora, pod numerem telefonu: 796373300 albo pod adresem e-mail <a href='mailto:kontakt@wybankuj.pl'>kontakt@wybankuj.pl</a>." +
                            "</p>" +
                            "</div>" +
                            "</body>" +
                            "</html>", true
            );
//            helper.addInline("logo", new File("${pageContext.request.contextPath}/img/logo.png"));
            javaMailSender.send(mail);
            logger.info("Wiadomość została wysłana - " + title);
        } catch (MessagingException e) {
            logger.warn("Wiadomość NIE została wysłana!");
        }
    }
}
