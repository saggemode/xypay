package com.xypay.xypay.service;

import com.xypay.xypay.domain.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

/**
 * Event listener for handling various notification events.
 */
@Component
public class NotificationEventListener {
    
    private static final Logger logger = LoggerFactory.getLogger(NotificationEventListener.class);
    
    @Autowired
    private NotificationService notificationService;
    
    /**
     * Handle transaction creation events.
     * This method is called after the transaction is committed.
     */
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handleTransactionCreated(Transaction transaction) {
        logger.info("Handling transaction created event for transaction ID: {}", transaction.getId());
        notificationService.handleTransactionNotifications(transaction);
    }
    
    /**
     * Handle customer escalation events.
     */
    @EventListener
    public void handleCustomerEscalationEvent(CustomerEscalationEvent event) {
        logger.info("Handling customer escalation event for escalation ID: {}", event.getEscalation().getId());
        notificationService.handleEscalationStatusChange(event.getEscalation(), event.isCreated());
    }
    
    /**
     * Handle bank transfer events.
     */
    @EventListener
    public void handleBankTransferEvent(BankTransferEvent event) {
        logger.info("Handling bank transfer event for transfer ID: {}", event.getTransfer().getId());
        notificationService.handleBankTransferNotifications(event.getTransfer(), event.isCreated());
    }
}