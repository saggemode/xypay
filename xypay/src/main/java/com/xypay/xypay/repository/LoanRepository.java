package com.xypay.xypay.repository;

import com.xypay.xypay.domain.Loan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



@Repository
public interface LoanRepository extends JpaRepository<Loan, Long> {
}