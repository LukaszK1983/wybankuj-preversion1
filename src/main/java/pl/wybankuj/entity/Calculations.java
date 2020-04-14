package pl.wybankuj.entity;

import java.math.BigDecimal;

public class Calculations {
    Loan loan;
    BigDecimal payment;
    BigDecimal serviceCharge;
    BigDecimal insurance;
    BigDecimal interests;
    BigDecimal totalCost;

    public Calculations(Loan loan, BigDecimal payment, BigDecimal serviceCharge, BigDecimal insurance, BigDecimal interests, BigDecimal totalCost) {
        this.loan = loan;
        this.payment = payment;
        this.serviceCharge = serviceCharge;
        this.insurance = insurance;
        this.interests = interests;
        this.totalCost = totalCost;
    }

    public Loan getLoan() {
        return loan;
    }

    public void setLoan(Loan loan) {
        this.loan = loan;
    }

    public BigDecimal getPayment() {
        return payment;
    }

    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    public BigDecimal getServiceCharge() {
        return serviceCharge;
    }

    public void setServiceCharge(BigDecimal serviceCharge) {
        this.serviceCharge = serviceCharge;
    }

    public BigDecimal getInsurance() {
        return insurance;
    }

    public void setInsurance(BigDecimal insurance) {
        this.insurance = insurance;
    }

    public BigDecimal getInterests() {
        return interests;
    }

    public void setInterests(BigDecimal interests) {
        this.interests = interests;
    }

    public BigDecimal getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(BigDecimal totalCost) {
        this.totalCost = totalCost;
    }
}
