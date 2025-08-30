package com.xypay.xypay.repository;

import com.xypay.xypay.domain.Transaction;
import com.xypay.xypay.domain.Wallet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface TransactionRepository extends JpaRepository<Transaction, Long> {

    Optional<Transaction> findByIdempotencyKey(String idempotencyKey);
    
    Page<Transaction> findByWalletId(Long walletId, Pageable pageable);    
    
    List<Transaction> findByWalletAndChannelAndTimestampBetweenAndStatus(
            Wallet wallet, String channel, LocalDateTime startDate, LocalDateTime endDate, String status);
    
    @Query("SELECT t FROM Transaction t WHERE t.createdAt BETWEEN :from AND :to")
    Page<Transaction> findByCreatedAtBetween(
        @Param("from") LocalDateTime from, 
        @Param("to") LocalDateTime to, 
        Pageable pageable);
    
    @Query("SELECT t FROM Transaction t WHERE t.createdAt BETWEEN :from AND :to")
    List<Transaction> findByCreatedAtBetween(
        @Param("from") LocalDateTime from, 
        @Param("to") LocalDateTime to);
}