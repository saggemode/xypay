package com.xypay.xypay.domain;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "bank_scheduled_transfer")
public class ScheduledTransfer extends BaseEntity {
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    
    @Column(name = "transfer_type", length = 20)
    private String transferType = "external"; // internal, external
    
    @Column(name = "amount", precision = 19, scale = 4)
    private BigDecimal amount;
    
    @Column(name = "recipient_account", length = 20)
    private String recipientAccount;
    
    @Column(name = "recipient_bank_code", length = 10)
    private String recipientBankCode;
    
    @Column(name = "recipient_name", length = 255)
    private String recipientName;
    
    @Column(name = "description")
    private String description;
    
    @Column(name = "frequency", length = 20)
    private String frequency = "once"; // once, daily, weekly, monthly, yearly
    
    @Column(name = "start_date")
    private LocalDateTime startDate;
    
    @Column(name = "end_date")
    private LocalDateTime endDate;
    
    @Column(name = "next_execution")
    private LocalDateTime nextExecution;
    
    @Column(name = "is_active")
    private Boolean isActive = true;
    
    @Column(name = "status", length = 20)
    private String status = "pending"; // pending, processing, completed, failed, cancelled
    
    // Constructors
    public ScheduledTransfer() {}
    
    // Getters and Setters
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public String getTransferType() {
        return transferType;
    }
    
    public void setTransferType(String transferType) {
        this.transferType = transferType;
    }
    
    public BigDecimal getAmount() {
        return amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }
    
    public String getRecipientAccount() {
        return recipientAccount;
    }
    
    public void setRecipientAccount(String recipientAccount) {
        this.recipientAccount = recipientAccount;
    }
    
    public String getRecipientBankCode() {
        return recipientBankCode;
    }
    
    public void setRecipientBankCode(String recipientBankCode) {
        this.recipientBankCode = recipientBankCode;
    }
    
    public String getRecipientName() {
        return recipientName;
    }
    
    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getFrequency() {
        return frequency;
    }
    
    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
    
    public LocalDateTime getStartDate() {
        return startDate;
    }
    
    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }
    
    public LocalDateTime getEndDate() {
        return endDate;
    }
    
    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }
    
    public LocalDateTime getNextExecution() {
        return nextExecution;
    }
    
    public void setNextExecution(LocalDateTime nextExecution) {
        this.nextExecution = nextExecution;
    }
    
    public Boolean getActive() {
        return isActive;
    }
    
    public void setActive(Boolean active) {
        isActive = active;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}