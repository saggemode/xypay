package com.xypay.xypay.service;

import com.xypay.xypay.domain.Loan;
import com.xypay.xypay.repository.LoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;

@Service
public class LoanService {
    @Autowired
    private LoanRepository loanRepository;
    @Autowired
    private AuditTrailService auditTrailService;
    @Autowired(required = false)
    private KafkaEventService kafkaEventService;
    private long nextId = 1;

    public Loan originateLoan(Long customerId, BigDecimal amount, String currency, int termMonths) {
        Loan loan = new Loan();
        loan.setCustomerId(customerId);
        loan.setAmount(amount);
        loan.setCurrency(currency);
        loan.setStatus("ACTIVE");
        Loan saved = loanRepository.save(loan);
        auditTrailService.logEvent("LOAN_ORIGINATED", "Loan originated: " + saved.getId() + ", amount: " + amount);
        if (kafkaEventService != null) {
            kafkaEventService.publishEvent("loans", String.valueOf(saved.getId()), "Loan originated: " + saved.getId());
        }
        return saved;
    }
    public Loan getLoan(Long loanId) {
        return loanRepository.findById(loanId).orElse(null);
    }
    public void disburseLoan(Long loanId) {
        Loan loan = getLoan(loanId);
        if (loan != null) {
            loan.setStatus("DISBURSED");
            loanRepository.save(loan);
            auditTrailService.logEvent("LOAN_DISBURSED", "Loan disbursed: " + loanId);
            if (kafkaEventService != null) {
                kafkaEventService.publishEvent("loans", String.valueOf(loanId), "Loan disbursed: " + loanId);
            }
        }
    }
}