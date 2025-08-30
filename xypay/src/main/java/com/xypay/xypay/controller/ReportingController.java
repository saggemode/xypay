package com.xypay.xypay.controller;

import com.xypay.xypay.domain.Transaction;
import com.xypay.xypay.service.TransactionReportingService;
import com.xypay.xypay.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/reports")
public class ReportingController {
    
    @Autowired
    private TransactionRepository transactionRepository;
    
    @Autowired
    private TransactionReportingService transactionReportingService;
    
    @GetMapping("/transactions/iso20022")
    public ResponseEntity<String> getTransactionsISO20022(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime from,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime to) {
        
        List<Transaction> transactions = transactionRepository.findByCreatedAtBetween(from, to);
        
        String iso20022Report = transactionReportingService.generateISO20022Report(transactions);
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attachment; filename=transactions-report.xml");
        
        return ResponseEntity.ok()
                .headers(headers)
                .body(iso20022Report);
    }
}