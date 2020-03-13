package pl.wybankuj.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.wybankuj.entity.Agency;
import pl.wybankuj.entity.Bank;
import pl.wybankuj.repository.AgencyRepository;
import pl.wybankuj.repository.BankRepository;
import pl.wybankuj.service.EmailService;

import java.util.List;

@Controller
public class HomeAgencyController {

    private final EmailService emailService;
    private final AgencyRepository agencyRepository;
    private final BankRepository bankRepository;

    public HomeAgencyController(EmailService emailService, AgencyRepository agencyRepository, BankRepository bankRepository) {
        this.emailService = emailService;
        this.agencyRepository = agencyRepository;
        this.bankRepository = bankRepository;
    }

    @GetMapping("/listOfAgencies")
    public String getAgencies(@RequestParam Long bankId, @RequestParam int amount,
                              @RequestParam int creditPeriod, Model model) {
        List<Agency> agencies = agencyRepository.findAllByBankId(bankId);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        model.addAttribute("amount", amount);
        model.addAttribute("creditPeriod", creditPeriod);

        return "listofagencies";
    }

    @PostMapping("/listOfAgencies")
    public String getAgenciesByCity(@RequestParam Long bankId, @RequestParam String city,
                                    @RequestParam int amount, @RequestParam int creditPeriod,
                                    Model model) {
        List<Agency> agencies = agencyRepository.findAllByBankIdAndCity(bankId, city);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        model.addAttribute("amount", amount);
        model.addAttribute("creditPeriod", creditPeriod);

        return "listofagencies";
    }

    @GetMapping("/agencyContactForm")
    public String agencyContactForm(@RequestParam Long agencyId, @RequestParam int amount,
                                    @RequestParam int creditPeriod, Model model) {
        model.addAttribute("agency", agencyRepository.findById(agencyId));
        model.addAttribute("amount", amount);
        model.addAttribute("creditPeriod", creditPeriod);
        return "contactform";
    }

    @PostMapping("/agencyContactForm")
    public String sendAgencyContactForm(@RequestParam Long agencyId, @RequestParam String name,
                                        @RequestParam String message, @RequestParam int amount,
                                        @RequestParam int creditPeriod, Model model) {

        String agencyMail = agencyRepository.findById(agencyId).get().getEmail();
        String title = "Wiadomość z Wybankuj.pl - " + name;
        emailService.send(agencyMail, title, message);
        String answear = "yes";

        model.addAttribute("agency", agencyRepository.findById(agencyId));
        model.addAttribute("amount", amount);
        model.addAttribute("creditPeriod", creditPeriod);
        model.addAttribute("answear", answear);

        return "contactform";
    }
}
