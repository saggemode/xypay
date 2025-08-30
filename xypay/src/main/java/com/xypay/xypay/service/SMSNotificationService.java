package com.xypay.xypay.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * Mock SMS notification service.
 * In production, this would integrate with an SMS provider like Twilio.
 */
@Service
public class SMSNotificationService {
    
    private static final Logger logger = LoggerFactory.getLogger(SMSNotificationService.class);
    
    
    /**
     * Mock SMS notification sender.
     * In production, this would integrate with an SMS provider like Twilio.
     *
     * @param phoneNumber The recipient's phone number
     * @param message The message to send
     * @return true if successful, false otherwise
     */
    public boolean sendSMSNotification(String phoneNumber, String message) {
        // Mock implementation - logs the SMS instead of sending
        logger.info("[MOCK SMS] To: {} | Message: {}", phoneNumber, message);
        return true;
    }
}