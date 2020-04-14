package pl.wybankuj.entity;

import java.math.BigDecimal;

public class CalculationsMortgage {
    Mortgage mortgage;
    BigDecimal payment;
    BigDecimal serviceCharge;
    BigDecimal insurance;
    BigDecimal interests;
    BigDecimal totalCost;

    public CalculationsMortgage(Mortgage mortgage, BigDecimal payment, BigDecimal serviceCharge, BigDecimal insurance, BigDecimal interests, BigDecimal totalCost) {
        this.mortgage = mortgage;
        this.payment = payment;
        this.serviceCharge = serviceCharge;
        this.insurance = insurance;
        this.interests = interests;
        this.totalCost = totalCost;
    }

    public Mortgage getMortgage() {
        return mortgage;
    }

    public void setMortgage(Mortgage mortgage) {
        this.mortgage = mortgage;
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
