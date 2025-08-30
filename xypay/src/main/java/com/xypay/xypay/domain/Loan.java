package com.xypay.xypay.domain;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDateTime;


@Data
@Entity
@Table(name = "loans")
public class Loan {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "account_id")
    private Long accountId;
    
    @Column(name = "customer_id")
    private Long customerId;
    
    private BigDecimal amount;
    
    private String currency;
    
    @Column(name = "interest_rate")
    private BigDecimal interestRate;
    
    @Column(name = "loan_term_months")
    private Integer loanTermMonths;
    
    @Column(name = "start_date")
    private LocalDateTime startDate;
    
    @Column(name = "end_date")
    private LocalDateTime endDate;
    
    private String status;
    
    private String customerName;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
}