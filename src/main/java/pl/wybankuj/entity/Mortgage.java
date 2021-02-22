package pl.wybankuj.entity;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.math.BigDecimal;

@Entity
@Table(name = "mortgages")
public class Mortgage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    private String offer;

    @NotNull
    @DecimalMin(value = "0.1")
    @DecimalMax(value = "10.0")
    private BigDecimal creditRate;

    @NotNull
    @DecimalMin(value = "0.0")
    private BigDecimal serviceCharge;

    @NotNull
    @DecimalMin(value = "0.0")
    private BigDecimal insurance;

    private String insuranceFrequency;

    @NotNull
    @DecimalMin(value = "10.0")
    private BigDecimal contributionPercent;

    @NotNull
    @DecimalMin(value = "10.0")
    private BigDecimal maxContributionPercent;

    @NotNull
    @Min(value = 1)
    private Integer minCreditAmount;

    @NotNull
    @Min(value = 2)
    private Integer maxCreditAmount;

    @NotNull
    @Min(value = 18)
    private Integer minBorrowerAge;

    @NotNull
    @Min(value = 19)
    private Integer maxBorrowerAge;

    @NotNull
    @Min(value = 1)
    private Integer minCreditPeriod;

    @NotNull
    @Min(value = 1)
    private Integer maxCreditPeriod;

    @ManyToOne
    @JoinColumn(name = "bank_id")
    @NotNull
    private Bank bank;

    public Mortgage() {
    }

    public Mortgage(Long id, BigDecimal contributionPercent, BigDecimal maxContributionPercent, BigDecimal creditRate, BigDecimal insurance, String insuranceFrequency, int maxBorrowerAge, int maxCreditAmount, int maxCreditPeriod, int minBorrowerAge, int minCreditAmount, int minCreditPeriod, String offer, BigDecimal serviceCharge, Bank bank) {
        this.id = id;
        this.contributionPercent = contributionPercent;
        this.maxContributionPercent = maxContributionPercent;
        this.creditRate = creditRate;
        this.insurance = insurance;
        this.insuranceFrequency = insuranceFrequency;
        this.maxBorrowerAge = maxBorrowerAge;
        this.maxCreditAmount = maxCreditAmount;
        this.maxCreditPeriod = maxCreditPeriod;
        this.minBorrowerAge = minBorrowerAge;
        this.minCreditAmount = minCreditAmount;
        this.minCreditPeriod = minCreditPeriod;
        this.offer = offer;
        this.serviceCharge = serviceCharge;
        this.bank = bank;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    public BigDecimal getCreditRate() {
        return creditRate;
    }

    public void setCreditRate(BigDecimal creditRate) {
        this.creditRate = creditRate;
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

    public BigDecimal getContributionPercent() {
        return contributionPercent;
    }

    public void setContributionPercent(BigDecimal contributionPercent) {
        this.contributionPercent = contributionPercent;
    }

    public Integer getMinCreditAmount() {
        return minCreditAmount;
    }

    public void setMinCreditAmount(Integer minCreditAmount) {
        this.minCreditAmount = minCreditAmount;
    }

    public Integer getMaxCreditAmount() {
        return maxCreditAmount;
    }

    public void setMaxCreditAmount(Integer maxCreditAmount) {
        this.maxCreditAmount = maxCreditAmount;
    }

    public Integer getMinBorrowerAge() {
        return minBorrowerAge;
    }

    public void setMinBorrowerAge(Integer minBorrowerAge) {
        this.minBorrowerAge = minBorrowerAge;
    }

    public Integer getMaxBorrowerAge() {
        return maxBorrowerAge;
    }

    public void setMaxBorrowerAge(Integer maxBorrowerAge) {
        this.maxBorrowerAge = maxBorrowerAge;
    }

    public Integer getMaxCreditPeriod() {
        return maxCreditPeriod;
    }

    public void setMaxCreditPeriod(Integer maxCreditPeriod) {
        this.maxCreditPeriod = maxCreditPeriod;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public BigDecimal getMaxContributionPercent() {
        return maxContributionPercent;
    }

    public void setMaxContributionPercent(BigDecimal maxContributionPercent) {
        this.maxContributionPercent = maxContributionPercent;
    }

    public Integer getMinCreditPeriod() {
        return minCreditPeriod;
    }

    public void setMinCreditPeriod(Integer minCreditPeriod) {
        this.minCreditPeriod = minCreditPeriod;
    }

    public String getInsuranceFrequency() {
        return insuranceFrequency;
    }

    public void setInsuranceFrequency(String insuranceFrequency) {
        this.insuranceFrequency = insuranceFrequency;
    }
}
