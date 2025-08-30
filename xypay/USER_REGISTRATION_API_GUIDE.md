# XyPay User Registration API Guide

This guide explains how to use the new user registration system that uses phone numbers as account numbers and implements a 3-tier KYC system.

## Overview

The registration system creates users with phone-number-based account numbers (using the last 10 digits) and implements a tiered KYC system similar to your Python Django implementation.

## API Endpoints

### 1. User Registration

**Endpoint:** `POST /api/auth/register`

**Request Body:**
```json
{
    "username": "austin",
    "email": "lidov27389@percyfx.com",
    "password": "Readings123",
    "phone": "+2347038655955"
}
```

**Response (Success):**
```json
{
    "success": true,
    "message": "Registration successful. Please verify your phone number with the OTP sent.",
    "user_id": 1,
    "account_number": "7038655955",
    "phone": "+2347038655955",
    "otp_sent": true
}
```

**Response (Error):**
```json
{
    "success": false,
    "message": "Phone number already exists",
    "errors": {
        "phone": "Invalid Nigerian phone number format"
    }
}
```

### 2. Phone Number Verification

**Endpoint:** `POST /api/auth/verify-phone`

**Request Body:**
```json
{
    "phone": "+2347038655955",
    "otp": "123456"
}
```

**Response (Success):**
```json
{
    "success": true,
    "message": "Phone number verified successfully",
    "account_number": "7038655955",
    "kyc_level": "TIER_1"
}
```

### 3. Resend OTP

**Endpoint:** `POST /api/auth/resend-otp`

**Request Body:**
```json
{
    "phone": "+2347038655955"
}
```

**Response:**
```json
{
    "success": true,
    "message": "OTP sent successfully",
    "otp_sent": true
}
```

### 4. Get User by Account Number

**Endpoint:** `GET /api/auth/user/{accountNumber}`

**Example:** `GET /api/auth/user/7038655955`

**Response:**
```json
{
    "success": true,
    "user": {
        "username": "austin",
        "email": "lidov27389@percyfx.com",
        "phone": "+2347038655955",
        "account_number": "7038655955",
        "is_verified": true,
        "enabled": true,
        "created_at": "2024-01-01T10:00:00",
        "kyc_level": "Tier 1",
        "kyc_approved": false,
        "daily_limit": 50000.0,
        "max_balance": 300000.0
    }
}
```

## KYC Management APIs

### 1. Update KYC Profile

**Endpoint:** `PUT /api/kyc/profile/{userId}`

**Request Body:**
```json
{
    "bvn": "12345678901",
    "nin": "12345678901",
    "dateOfBirth": "1990-01-01",
    "address": "123 Main Street, Lagos",
    "state": "Lagos",
    "lga": "Lagos Island",
    "gender": "MALE",
    "telephoneNumber": "08012345678",
    "passportPhoto": "path/to/passport.jpg",
    "selfie": "path/to/selfie.jpg",
    "idDocument": "path/to/id.jpg",
    "govtIdType": "NATIONAL_ID",
    "govtIdDocument": "path/to/govt_id.jpg",
    "proofOfAddress": "path/to/address_proof.jpg"
}
```

### 2. Request Tier Upgrade

**Endpoint:** `POST /api/kyc/upgrade/{userId}`

**Request Body:**
```json
{
    "target_tier": "TIER_2"
}
```

**Response:**
```json
{
    "success": true,
    "message": "Tier upgrade request submitted successfully",
    "current_tier": "Tier 1",
    "requested_tier": "Tier 2"
}
```

### 3. Get KYC Tier Information

**Endpoint:** `GET /api/kyc/tiers`

**Response:**
```json
{
    "success": true,
    "tiers": {
        "TIER_1": {
            "daily_transaction_limit": 50000.0,
            "max_balance_limit": 300000.0,
            "description": "Basic tier with limited transactions",
            "requirements": [
                "Phone number verification",
                "Basic personal information"
            ]
        },
        "TIER_2": {
            "daily_transaction_limit": 200000.0,
            "max_balance_limit": 500000.0,
            "description": "Enhanced tier with moderate limits",
            "requirements": [
                "Tier 1 completion",
                "BVN or NIN verification",
                "Address verification"
            ]
        },
        "TIER_3": {
            "daily_transaction_limit": 5000000.0,
            "max_balance_limit": null,
            "description": "Premium tier with high limits",
            "requirements": [
                "Tier 2 completion",
                "Both BVN and NIN verification",
                "Government ID document",
                "Proof of address",
                "Additional documentation"
            ]
        }
    }
}
```

## Registration Flow Example

### Step 1: Register User
```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "austin",
    "email": "lidov27389@percyfx.com",
    "password": "Readings123",
    "phone": "+2347038655955"
  }'
```

### Step 2: Verify Phone (Check logs for OTP)
```bash
curl -X POST http://localhost:8080/api/auth/verify-phone \
  -H "Content-Type: application/json" \
  -d '{
    "phone": "+2347038655955",
    "otp": "123456"
  }'
```

### Step 3: Update KYC Profile
```bash
curl -X PUT http://localhost:8080/api/kyc/profile/1 \
  -H "Content-Type: application/json" \
  -d '{
    "bvn": "12345678901",
    "dateOfBirth": "1990-01-01",
    "address": "123 Main Street, Lagos",
    "state": "Lagos",
    "gender": "MALE"
  }'
```

### Step 4: Request Tier Upgrade
```bash
curl -X POST http://localhost:8080/api/kyc/upgrade/1 \
  -H "Content-Type: application/json" \
  -d '{
    "target_tier": "TIER_2"
  }'
```

## Key Features Implemented

### 1. Phone-Based Account Numbers
- Phone number `+2347038655955` becomes account number `7038655955`
- Automatic generation using last 10 digits
- Unique constraint ensures no duplicates

### 2. OTP Verification System
- 6-digit OTP generated automatically
- 10-minute expiry time
- SMS sending simulation (logs OTP for testing)
- Resend OTP functionality

### 3. Transaction PIN System
- Secure PIN storage using BCrypt
- PIN validation methods
- Separate from login password

### 4. 3-Tier KYC System
- **Tier 1**: Basic (₦50,000 daily, ₦300,000 max balance)
- **Tier 2**: Enhanced (₦200,000 daily, ₦500,000 max balance)
- **Tier 3**: Premium (₦5,000,000 daily, unlimited balance)

### 5. Nigerian Phone Number Validation
- Supports formats: `+2347038655955`, `07038655955`, `2347038655955`
- Validates Nigerian mobile prefixes (070, 080, 081, 090, 091)
- Automatic normalization to international format

### 6. Comprehensive Audit Trail
- All registration events logged
- KYC updates tracked
- Phone verification events recorded
- Error logging for debugging

## Integration with Existing Banking System

The new registration system integrates seamlessly with your existing XyPay core banking system:

### 1. Account Creation
- Automatically creates banking account after phone verification
- Links to existing Account entity
- Inherits all banking functionality

### 2. Transaction Processing
- Uses existing TransactionService
- Applies KYC tier limits automatically
- Maintains audit trail

### 3. Open Banking Integration
- Phone-based account numbers work with existing Open Banking APIs
- KYC tier information available through APIs
- Maintains compliance with banking standards

### 4. Admin Console Integration
- KYC approval workflows
- User management through existing admin system
- Reporting and analytics integration

## Security Features

### 1. Input Validation
- Phone number format validation
- Email format validation
- Password strength requirements
- SQL injection prevention

### 2. Rate Limiting (Recommended)
- OTP request limiting
- Registration attempt limiting
- API rate limiting

### 3. Data Protection
- PII encryption capabilities
- Secure password hashing
- Transaction PIN encryption

## Testing the System

### 1. Start the Application
```bash
mvn spring-boot:run
```

### 2. Check Health Endpoints
```bash
curl http://localhost:8080/api/auth/health
curl http://localhost:8080/api/kyc/health
```

### 3. Register Test User
Use the example registration request above and check the application logs for the OTP code.

### 4. Verify and Test KYC
Follow the complete registration flow to test all functionality.

## Production Considerations

### 1. SMS Integration
- Replace mock SMS service with real provider (Twilio, AWS SNS)
- Add SMS delivery status tracking
- Implement SMS rate limiting

### 2. File Upload Handling
- Implement actual file upload for KYC documents
- Add file validation and virus scanning
- Use cloud storage (AWS S3, Google Cloud Storage)

### 3. Enhanced Security
- Add CAPTCHA for registration
- Implement device fingerprinting
- Add fraud detection rules

### 4. Performance Optimization
- Add Redis caching for OTP codes
- Implement database connection pooling
- Add API response caching

This registration system provides a solid foundation for fintech integration while maintaining the robustness and compliance features of your core banking system.