package com.xypay.xypay.repository;

import com.xypay.xypay.domain.User;
import com.xypay.xypay.domain.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WalletRepository extends JpaRepository<Wallet, Long> {
    List<Wallet> findByUser(User user);
    Optional<Wallet> findByAccountNumber(String accountNumber);
    Optional<Wallet> findByAccountNumberOrAlternativeAccountNumber(String accountNumber, String alternativeAccountNumber);
}