package com.xypay.xypay.service;

import com.xypay.xypay.domain.BankTransfer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionPhase;
import org.springframework.transaction.event.TransactionalEventListener;

/**
 * Event listener for bank transfer events.
 */
@Component("serviceBankTransferEventListener")
public class BankTransferEventListener {
    
    private static final Logger logger = LoggerFactory.getLogger(BankTransferEventListener.class);
    
    @Autowired
    private BaseSignalHandler baseSignalHandler;
    
    /**
     * Handle bank transfer creation events.
     * This method is called after the transaction is committed.
     */
    @TransactionalEventListener(phase = TransactionPhase.AFTER_COMMIT)
    public void handleBankTransferCreated(BankTransfer transfer) {
        logger.info("Handling bank transfer created event for transfer ID: {}", transfer.getId());
        
        // Validate the transfer
        boolean isValid = baseSignalHandler.validateTransfer(transfer);
        if (!isValid) {
            logger.warn("Bank transfer validation failed for transfer ID: {}", transfer.getId());
            return;
        }
        
        // Additional processing after validation can be added here
        logger.info("Bank transfer validation passed for transfer ID: {}", transfer.getId());
    }
    
    /**
     * Handle bank transfer status update events.
     */
    @EventListener
    public void handleBankTransferStatusUpdated(BankTransfer transfer) {
        logger.info("Handling bank transfer status updated event for transfer ID: {}, status: {}", 
            transfer.getId(), transfer.getStatus());
        
        // Process successful transfers
        if ("successful".equals(transfer.getStatus()) || "completed".equals(transfer.getStatus())) {
            boolean processed = baseSignalHandler.processSuccessfulTransfer(transfer);
            if (processed) {
                logger.info("Successfully processed successful transfer ID: {}", transfer.getId());
            } else {
                logger.error("Failed to process successful transfer ID: {}", transfer.getId());
            }
        }
        // Handle failed transfers
        else if ("failed".equals(transfer.getStatus())) {
            // Additional handling for failed transfers can be added here
            logger.info("Processed failed transfer ID: {}", transfer.getId());
        }
    }
    
    /**
     * Handle bank transfer failure events.
     */
    @EventListener
    public void handleBankTransferFailed(BankTransferFailedEvent event) {
        logger.info("Handling bank transfer failed event for transfer ID: {}, error code: {}", 
            event.getTransferId(), event.getErrorCode());
        
        // In a real implementation, you would retrieve the transfer and handle the failure
        // For now, we'll just log the event
        logger.warn("Bank transfer {} failed with error code: {} and message: {}", 
            event.getTransferId(), event.getErrorCode(), event.getErrorMessage());
    }
}