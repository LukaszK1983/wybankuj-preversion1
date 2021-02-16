package pl.wybankuj.web;

import com.itextpdf.text.DocumentException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.wybankuj.bean.EnvSiteKey;
import pl.wybankuj.entity.Calculations;
import pl.wybankuj.entity.Loan;
import pl.wybankuj.entity.UserLoan;
import pl.wybankuj.repository.LoanRepository;
import pl.wybankuj.service.LoanService;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Map;

@Controller
public class HomeLoanController {

    private final static Logger logger = LogManager.getLogger(HomeLoanController.class);

    private final LoanRepository loanRepository;
    private final LoanService loanService;
    private final EnvSiteKey envSiteKey;

    public HomeLoanController(LoanRepository loanRepository, LoanService loanService, EnvSiteKey envSiteKey) {
        this.loanRepository = loanRepository;
        this.loanService = loanService;
        this.envSiteKey = envSiteKey;
    }

    @GetMapping("/loanParameters")
    public String getLoanParameters(Model model) {
        model.addAttribute("userLoan", new UserLoan());
        return "loanparameters";
    }

    @PostMapping("/loanParameters")
    public String postLoanParameters(@ModelAttribute UserLoan userLoan, Model model) {

        List<Loan> loans = loanService.chooseOffers(userLoan.getChooseInsurance(),
                userLoan.getChooseServiceCharge(), userLoan.getAmount(),
                userLoan.getCreditPeriod(), userLoan.getAge());
        Map<Loan, BigDecimal> loansWithPayments = loanService.calculateLoanPayment(loans, userLoan.getAmount(), userLoan.getCreditPeriod(), userLoan.getAge());

        model.addAttribute("loanSimulation", loansWithPayments);
        model.addAttribute("userLoan", userLoan);

        return "calculateloan";
    }

    @PostMapping("/loanDetails")
    public String getLoanDetails(@RequestParam Long loanId, @RequestParam Long loanId2,
                                 @RequestParam Long loanId3, @ModelAttribute UserLoan userLoan,
                                 Model model) {

        if (loanId > 0) {
            Calculations calculations1 = calculateLoanParameteres(loanId, userLoan);
            model.addAttribute("calculations1", calculations1);
        }

        if (loanId2 > 0) {
            boolean testLoan2 = true;
            model.addAttribute("testLoan2", testLoan2);

            Calculations calculations2 = calculateLoanParameteres(loanId2, userLoan);
            model.addAttribute("calculations2", calculations2);
        }

        if (loanId3 > 0) {
            boolean testLoan3 = true;
            model.addAttribute("testLoan3", testLoan3);

            Calculations calculations3 = calculateLoanParameteres(loanId3, userLoan);
            model.addAttribute("calculations3", calculations3);
        }
        model.addAttribute("userLoan", userLoan);
        model.addAttribute("siteKey", envSiteKey.getSite());

        return "loandetails";
    }

    @PostMapping("/generateOffer")
    public String generateOfferToPDF(@RequestParam Long loanId, @ModelAttribute UserLoan userLoan, Model model) throws DocumentException, IOException, URISyntaxException {

        calculateLoanParameteres(loanId, userLoan);

        model.addAttribute("userLoan", userLoan);

//        loanService.generatePDF(loan, userLoan, payment, serviceCharge, insurance,
//                interests, totalCost);

        return "loandetails";
    }

    @ModelAttribute("answears")
    public List<String> answears() {
        return List.of("TAK", "NIE");
    }

    public Calculations calculateLoanParameteres(Long loanId, UserLoan userLoan) {
        Loan loan = loanRepository.findById(loanId).orElse(new Loan());

        BigDecimal payment = loanService.calculateChoosenLoanPayment(loan, userLoan.getAmount(), userLoan.getCreditPeriod());

        BigDecimal serviceCharge = loanService.calculateServiceCharge(loan, userLoan.getAmount());

        BigDecimal insurance = loanService.calculateInsurance(loan, userLoan.getAmount());

        BigDecimal interests = loanService.calculateInterestsCost(userLoan.getAmount(), userLoan.getCreditPeriod(), payment, serviceCharge, insurance);

        BigDecimal totalCost = loanService.calculateTotalCost(userLoan.getAmount(), userLoan.getCreditPeriod(), payment);

        return new Calculations(loan, payment, serviceCharge, insurance, interests, totalCost);
    }
}
