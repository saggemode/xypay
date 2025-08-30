package com.xypay.xypay.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "banks")
public class Bank extends BaseEntity {
    
    @Column(name = "name", length = 100)
    private String name;
    
    @Column(name = "code", length = 10)
    private String code;
    
    @Column(name = "slug")
    private String slug;
    
    @Column(name = "ussd", length = 20)
    private String ussd;
    
    @Column(name = "logo")
    private String logo;
    
    @Column(name = "is_active")
    private Boolean isActive = true;
    
    // Additional Configuration
    @Column(name = "applies_to_fees")
    private Boolean appliesToFees = true;
    
    @Column(name = "applies_to_levies")
    private Boolean appliesToLevies = false;
    
    @Column(name = "minimum_vatable_amount", precision = 19, scale = 4)
    private BigDecimal minimumVatableAmount = BigDecimal.ZERO;
    
    // Exemption Settings
    @Column(name = "exempt_internal_transfers")
    private Boolean exemptInternalTransfers = false;
    
    @Column(name = "exempt_international_transfers")
    private Boolean exemptInternationalTransfers = false;
    
    // Rounding Configuration
    @Column(name = "rounding_method", length = 20)
    private String roundingMethod = "none"; // none, nearest, up, down
    
    // Constructors
    public Bank() {}
    
    // Getters and Setters
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getCode() {
        return code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    
    public String getSlug() {
        return slug;
    }
    
    public void setSlug(String slug) {
        this.slug = slug;
    }
    
    public String getUssd() {
        return ussd;
    }
    
    public void setUssd(String ussd) {
        this.ussd = ussd;
    }
    
    public String getLogo() {
        return logo;
    }
    
    public void setLogo(String logo) {
        this.logo = logo;
    }
    
    public Boolean getActive() {
        return isActive;
    }
    
    public void setActive(Boolean active) {
        isActive = active;
    }
    
    public Boolean getAppliesToFees() {
        return appliesToFees;
    }
    
    public void setAppliesToFees(Boolean appliesToFees) {
        this.appliesToFees = appliesToFees;
    }
    
    public Boolean getAppliesToLevies() {
        return appliesToLevies;
    }
    
    public void setAppliesToLevies(Boolean appliesToLevies) {
        this.appliesToLevies = appliesToLevies;
    }
    
    public BigDecimal getMinimumVatableAmount() {
        return minimumVatableAmount;
    }
    
    public void setMinimumVatableAmount(BigDecimal minimumVatableAmount) {
        this.minimumVatableAmount = minimumVatableAmount;
    }
    
    public Boolean getExemptInternalTransfers() {
        return exemptInternalTransfers;
    }
    
    public void setExemptInternalTransfers(Boolean exemptInternalTransfers) {
        this.exemptInternalTransfers = exemptInternalTransfers;
    }
    
    public Boolean getExemptInternationalTransfers() {
        return exemptInternationalTransfers;
    }
    
    public void setExemptInternationalTransfers(Boolean exemptInternationalTransfers) {
        this.exemptInternationalTransfers = exemptInternationalTransfers;
    }
    
    public String getRoundingMethod() {
        return roundingMethod;
    }
    
    public void setRoundingMethod(String roundingMethod) {
        this.roundingMethod = roundingMethod;
    }
}