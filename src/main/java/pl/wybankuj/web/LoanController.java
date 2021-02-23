package pl.wybankuj.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.wybankuj.entity.Bank;
import pl.wybankuj.entity.Loan;
import pl.wybankuj.repository.BankRepository;
import pl.wybankuj.repository.LoanRepository;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/loan")
public class LoanController {

    private final static Logger logger = LogManager.getLogger(LoanController.class);

    private final LoanRepository loanRepository;
    private final BankRepository bankRepository;

    public LoanController(LoanRepository loanRepository, BankRepository bankRepository) {
        this.loanRepository = loanRepository;
        this.bankRepository = bankRepository;
    }

    @GetMapping
    public String allLoans(@RequestParam Long bankId, Model model) {
        model.addAttribute("loans", loanRepository.findAllByBankId(bankId));
        model.addAttribute("bank", bankRepository.findById(bankId));
        return "allloans";
    }

    @GetMapping("/add")
    public String addInitForm(@RequestParam Long bankId, Model model) {
        model.addAttribute("loan", new Loan());
        model.addAttribute("bank", bankRepository.findById(bankId));
        return "addloan";
    }

    @PostMapping("/add")
    public String addPostForm(@Valid Loan loan, BindingResult bindingResult,
                              @RequestParam Long bankId, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("bank", bankRepository.findById(bankId));
            return "addloan";
        }
        loanRepository.save(loan);
        return "redirect:/loan?bankId=" + loan.getBank().getId() + "";
    }

    @GetMapping("/edit")
    public String editInitForm(@RequestParam Long id, @RequestParam Long bankId, Model model) {
        model.addAttribute("loan", loanRepository.findById(id));
        model.addAttribute("bank", bankRepository.findById(bankId));
        return "editloan";
    }

    @PostMapping("/edit")
    public String editPostForm(@Valid Loan loan, BindingResult bindingResult,
                               @RequestParam Long bankId, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("bank", bankRepository.findById(bankId));
            return "editloan";
        }
        loanRepository.save(loan);
        return "redirect:/loan?bankId=" + loan.getBank().getId() + "";
    }

    @GetMapping("/delete")
    public String deleteLoan(@RequestParam Long id, @RequestParam Long bankId) {
        loanRepository.deleteById(id);
        return "redirect:/loan?bankId=" + bankId + "";
    }

    @ModelAttribute("banks")
    public List<Bank> banks() {
        return (List<Bank>) bankRepository.findAll();
    }

    @ModelAttribute("frequency")
    public List<String> frequency() {
        return Arrays.asList("brak", "mies.", "rocznie", "jednorazowo");
    }
}
