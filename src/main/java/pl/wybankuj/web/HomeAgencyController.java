package pl.wybankuj.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import pl.wybankuj.bean.EnvSecretKey;
import pl.wybankuj.bean.EnvSiteKey;
import pl.wybankuj.entity.Agency;
import pl.wybankuj.entity.Bank;
import pl.wybankuj.entity.UserLoan;
import pl.wybankuj.entity.UserMortgage;
import pl.wybankuj.modal.ReCaptchaResponse;
import pl.wybankuj.repository.AgencyRepository;
import pl.wybankuj.repository.BankRepository;
import pl.wybankuj.service.EmailService;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class HomeAgencyController {

    private final EmailService emailService;
    private final AgencyRepository agencyRepository;
    private final BankRepository bankRepository;
    private final EnvSecretKey envSecretKey;
    private final EnvSiteKey envSiteKey;

    @Autowired
    private RestTemplate restTemplate;

    public HomeAgencyController(EmailService emailService, AgencyRepository agencyRepository, BankRepository bankRepository, EnvSecretKey envSecretKey, EnvSiteKey envSiteKey) {
        this.emailService = emailService;
        this.agencyRepository = agencyRepository;
        this.bankRepository = bankRepository;
        this.envSecretKey = envSecretKey;
        this.envSiteKey = envSiteKey;
    }

    @GetMapping("/listOfAgencies")
    public String getAgencies(@RequestParam Long bankId, @RequestParam int amount,
                              @RequestParam String offer, @RequestParam int creditPeriod,
                              @RequestParam int age, @RequestParam String chooseServiceCharge,
                              @RequestParam String chooseInsurance, Model model) {

        List<Agency> agencies = agencyRepository.findAllByBankId(bankId);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userLoan", userLoan);
        
        model.addAttribute("offer", offer);

        return "listofagencies";
    }

    @PostMapping("/listOfAgencies")
    public String getAgenciesByCity(@RequestParam Long bankId, @RequestParam String city,
                                    @RequestParam int amount, @RequestParam int creditPeriod,
                                    @RequestParam String offer, @RequestParam int age,
                                    @RequestParam String chooseServiceCharge,
                                    @RequestParam String chooseInsurance, Model model) {

        List<Agency> agencies = agencyRepository.findAllByBankIdAndCity(bankId, city);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userLoan", userLoan);

        model.addAttribute("offer", offer);

        return "listofagencies";
    }

//    @GetMapping("/agencyContactForm")
//    public String agencyContactForm(@RequestParam Long agencyId, @RequestParam int amount,
//                                    @RequestParam int creditPeriod, @RequestParam String offer,
//                                    @RequestParam int age, @RequestParam String chooseServiceCharge,
//                                    @RequestParam String chooseInsurance, Model model) {
//
//        model.addAttribute("agency", agencyRepository.findById(agencyId));
//        model.addAttribute("offer", offer);
//
//        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
//        model.addAttribute("userLoan", userLoan);
//
//        return "contactform";
//    }
//
//    @PostMapping("/agencyContactForm")
//    public String sendAgencyContactForm(@RequestParam Long agencyId, @RequestParam String name,
//                                        @RequestParam String message, @RequestParam int amount,
//                                        @RequestParam int creditPeriod, @RequestParam String offer,
//                                        @RequestParam int age, @RequestParam String chooseServiceCharge,
//                                        @RequestParam String chooseInsurance, Model model) {
//
//        String agencyMail = agencyRepository.findById(agencyId).get().getEmail();
//        String title = "Wiadomość z Wybankuj.pl - " + name;
//        emailService.send(agencyMail, title, message);
//        String answear = "yes";
//
//        model.addAttribute("agency", agencyRepository.findById(agencyId));
//
//        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
//        model.addAttribute("userLoan", userLoan);
//
//        model.addAttribute("offer", offer);
//        model.addAttribute("answear", answear);
//
//        return "contactform";
//    }
    @GetMapping("/agencyContactForm")
    public String agencyContactForm(@RequestParam Long bankId, @RequestParam int amount,
                                @RequestParam int creditPeriod, @RequestParam String offer,
                                @RequestParam int age, @RequestParam String chooseServiceCharge,
                                @RequestParam String chooseInsurance, Model model) {

        model.addAttribute("bank", bankRepository.findById(bankId));
        model.addAttribute("offer", offer);

        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userLoan", userLoan);

        model.addAttribute("siteKey", envSiteKey.getSite());

        return "contactform";
}

    @PostMapping("/agencyContactForm")
    public String sendAgencyContactForm(@RequestParam Long bankId, @RequestParam String name,
                                        @RequestParam String message, @RequestParam int amount,
                                        @RequestParam int creditPeriod, @RequestParam String offer,
                                        @RequestParam int age, @RequestParam String chooseServiceCharge,
                                        @RequestParam String chooseInsurance, Model model,
                                        @RequestParam(name="g-recaptcha-response") String captchaResponse) {

        String url = "https://www.google.com/recaptcha/api/siteverify";
        String params = "?secret=" + envSecretKey.getSecret() + "&response=" + captchaResponse;

        String title = "Wiadomość z Wybankuj.pl - " + name;

        model.addAttribute("bank", bankRepository.findById(bankId));

        UserLoan userLoan = new UserLoan(amount, creditPeriod, age, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userLoan", userLoan);

        model.addAttribute("offer", offer);

        ReCaptchaResponse reCaptchaResponse = restTemplate.exchange(url+params, HttpMethod.POST, null, ReCaptchaResponse.class).getBody();
        if(reCaptchaResponse.isSuccess()) {
            emailService.send("bank@wybankuj.pl", title, message);
            String answer = "yes";
            model.addAttribute("answer", answer);

            return "contactform";
        } else {
            String answer = "no";
            model.addAttribute("answer", answer);

            return "contactform";
        }
    }

    @GetMapping("/listOfAgenciesMortgage")
    public String getAgenciesMortgage(@RequestParam Long bankId, @RequestParam int amount,
                                      @RequestParam String offer, @RequestParam int creditPeriod,
                                      @RequestParam BigDecimal contributionPercent, @RequestParam int age,
                                      @RequestParam String chooseServiceCharge, @RequestParam int cost,
                                      @RequestParam String chooseInsurance, Model model) {

        List<Agency> agencies = agencyRepository.findAllByBankId(bankId);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        UserMortgage userMortgage = new UserMortgage(cost, amount, creditPeriod, age, contributionPercent, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userMortgage", userMortgage);

        model.addAttribute("offer", offer);

        return "listofagenciesmortgage";
    }

    @PostMapping("/listOfAgenciesMortgage")
    public String getAgenciesMortgageByCity(@RequestParam Long bankId, @RequestParam String city,
                                    @RequestParam int amount, @RequestParam int creditPeriod,
                                    @RequestParam String offer, @RequestParam BigDecimal contributionPercent,
                                            @RequestParam int age, @RequestParam String chooseServiceCharge,
                                    @RequestParam String chooseInsurance, @RequestParam int cost, Model model) {

        List<Agency> agencies = agencyRepository.findAllByBankIdAndCity(bankId, city);
        model.addAttribute("agencies", agencies);

        Bank bank = bankRepository.findFirstById(bankId).orElseThrow();
        model.addAttribute("bank", bank);

        UserMortgage userMortgage = new UserMortgage(cost, amount, creditPeriod, age, contributionPercent, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userMortgage", userMortgage);

        model.addAttribute("offer", offer);

        return "listofagenciesmortgage";
    }

    @GetMapping("/agencyContactFormMortgage")
    public String agencyContactFormMortgage(@RequestParam Long agencyId, @RequestParam int amount,
                                    @RequestParam int creditPeriod, @RequestParam String offer,
                                    @RequestParam BigDecimal contributionPercent, @RequestParam int age,
                                            @RequestParam String chooseServiceCharge, @RequestParam int cost,
                                    @RequestParam String chooseInsurance, Model model) {

        model.addAttribute("agency", agencyRepository.findById(agencyId));
        model.addAttribute("offer", offer);

        UserMortgage userMortgage = new UserMortgage(cost, amount, creditPeriod, age, contributionPercent, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userMortgage", userMortgage);

        return "contactformmortgage";
    }

    @PostMapping("/agencyContactFormMortgage")
    public String sendAgencyContactFormMortgage(@RequestParam Long agencyId, @RequestParam String name,
                                        @RequestParam String message, @RequestParam int amount,
                                        @RequestParam int creditPeriod, @RequestParam String offer,
                                        @RequestParam int age, @RequestParam String chooseServiceCharge,
                                        @RequestParam String chooseInsurance, @RequestParam BigDecimal contributionPercent,
                                                @RequestParam int cost, Model model) {

        String agencyMail = agencyRepository.findById(agencyId).get().getEmail();
        String title = "Wiadomość z Wybankuj.pl - " + name;
        emailService.send(agencyMail, title, message);
        String answear = "yes";

        model.addAttribute("agency", agencyRepository.findById(agencyId));

        UserMortgage userMortgage = new UserMortgage(cost, amount, creditPeriod, age, contributionPercent, chooseServiceCharge, chooseInsurance);
        model.addAttribute("userMortgage", userMortgage);

        model.addAttribute("offer", offer);
        model.addAttribute("answear", answear);

        return "contactformmortgage";
    }
}
