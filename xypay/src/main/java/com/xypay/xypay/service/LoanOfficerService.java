package com.xypay.xypay.service;

import com.xypay.xypay.domain.Loan;
import com.xypay.xypay.repository.LoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class LoanOfficerService {
    @Autowired
    private LoanRepository loanRepository;

    public String applyForLoan(String customerName, BigDecimal amount) {
        Loan loan = new Loan();
        loan.setCustomerName(customerName);
        loan.setAmount(amount);
        loan.setStatus("PENDING");
        loanRepository.save(loan);
        return "Loan application submitted for " + customerName + ".";
    }

    public String creditCheck(String customerName) {
        // For demo, just return a placeholder message.
        return "Credit check completed for " + customerName + ".";
    }

    public List<Loan> getPortfolio() {
        return loanRepository.findAll();
    }

    public String riskAssessment(String customerName) {
        // For demo, just return a placeholder message.
        return "Risk assessment completed for " + customerName + ".";
    }

    public void approveLoan(Long loanId) {
        Loan loan = loanRepository.findById(loanId)
                .orElseThrow(() -> new RuntimeException("Loan not found"));
        loan.setStatus("APPROVED");
        loanRepository.save(loan);
    }

    public void rejectLoan(Long loanId) {
        Loan loan = loanRepository.findById(loanId)
                .orElseThrow(() -> new RuntimeException("Loan not found"));
        loan.setStatus("REJECTED");
        loanRepository.save(loan);
    }

    public String getRepaymentSchedule(Long loanId) {
        return "Repayment schedule for loan " + loanId + " will be displayed here.";
    }

    public int getCreditScore(String customerName) {
        // Mock credit score: random between 600 and 800
        return 600 + (int)(Math.random() * 200);
    }
}
