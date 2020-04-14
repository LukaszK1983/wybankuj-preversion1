package pl.wybankuj.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.wybankuj.entity.*;
import pl.wybankuj.repository.MortgageRepository;
import pl.wybankuj.service.MortgageService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
public class HomeMortgageController {

    private final MortgageRepository mortgageRepository;
    private final MortgageService mortgageService;

    public HomeMortgageController(MortgageRepository mortgageRepository, MortgageService mortgageService) {
        this.mortgageRepository = mortgageRepository;
        this.mortgageService = mortgageService;
    }

    @GetMapping("/mortgageParameters")
    public String getMortgageParameters(Model model) {
        model.addAttribute("userMortgage", new UserMortgage());
        return "mortgageparameters";
    }

    @PostMapping("/mortgageParameters")
    public String postMortgageParameters(@ModelAttribute UserMortgage userMortgage,
                                         Model model) {
        List<Mortgage> mortgages = mortgageService.chooseOffers(userMortgage.getChooseInsurance(),
                userMortgage.getChooseServiceCharge(), userMortgage.getAmount(),
                userMortgage.getCreditPeriod(), userMortgage.getAge(), userMortgage.getContributionPercent());
        Map<Mortgage, BigDecimal> mortgagesWithPayments = mortgageService.calculateMortgagePayment(mortgages, userMortgage.getAmount(), userMortgage.getCreditPeriod());

        model.addAttribute("mortgageSimulation", mortgagesWithPayments);
        model.addAttribute("userMortgage", userMortgage);

        return "calculatemortgage";
    }

    @PostMapping("/mortgageDetails")
    public String getMortgageDetails(@RequestParam Long mortgageId, @RequestParam Long mortgageId2,
                                     @RequestParam Long mortgageId3, @ModelAttribute UserMortgage userMortgage,
                                     Model model) {

        if (mortgageId > 0) {
            CalculationsMortgage calculations1 = calculateMortgageParameteres(mortgageId, userMortgage);
            model.addAttribute("calculations1", calculations1);
        }

        if (mortgageId2 > 0) {
            boolean testMortgage2 = true;
            model.addAttribute("testMortgage2", testMortgage2);

            CalculationsMortgage calculations2 = calculateMortgageParameteres(mortgageId2, userMortgage);
            model.addAttribute("calculations2", calculations2);
        }

        if (mortgageId3 > 0) {
            boolean testMortgage3 = true;
            model.addAttribute("testMortgage3", testMortgage3);

            CalculationsMortgage calculations3 = calculateMortgageParameteres(mortgageId3, userMortgage);
            model.addAttribute("calculations3", calculations3);
        }
        model.addAttribute("userMortgage", userMortgage);

        return "mortgagedetails";
    }

    @ModelAttribute("answears")
    public List<String> answears() {
        return List.of("TAK", "NIE");
    }

    public CalculationsMortgage calculateMortgageParameteres(Long mortgageId, UserMortgage userMortgage) {
        Mortgage mortgage = mortgageRepository.findById(mortgageId).orElse(new Mortgage());

        BigDecimal payment = mortgageService.calculateChoosenMortgagePayment(mortgage, userMortgage.getAmount(), userMortgage.getCreditPeriod());

        BigDecimal serviceCharge = mortgageService.calculateServiceCharge(mortgage, userMortgage.getAmount());

        BigDecimal insurance = mortgageService.calculateInsurance(mortgage, userMortgage.getAmount());

        BigDecimal interests = mortgageService.calculateInterestsCost(mortgage, userMortgage.getAmount(), userMortgage.getCreditPeriod(), payment, serviceCharge, insurance);

        BigDecimal totalCost = mortgageService.calculateTotalCost(mortgage, userMortgage.getAmount(), userMortgage.getCreditPeriod(), payment);

        return new CalculationsMortgage(mortgage, payment, serviceCharge, insurance, interests, totalCost);
    }
}
