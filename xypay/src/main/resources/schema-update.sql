-- Additional tables for the new user registration system
-- Add these to your existing data.sql or run separately

-- User Profiles table
CREATE TABLE IF NOT EXISTS user_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id BIGINT NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    account_number VARCHAR(10) NOT NULL UNIQUE,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    otp_code VARCHAR(6),
    otp_expiry TIMESTAMP,
    notify_email BOOLEAN NOT NULL DEFAULT TRUE,
    notify_sms BOOLEAN NOT NULL DEFAULT FALSE,
    notify_push BOOLEAN NOT NULL DEFAULT FALSE,
    notify_in_app BOOLEAN NOT NULL DEFAULT TRUE,
    fcm_token VARCHAR(255),
    transaction_pin VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- KYC Profiles table
CREATE TABLE IF NOT EXISTS kyc_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id BIGINT NOT NULL UNIQUE,
    bvn VARCHAR(11) UNIQUE,
    nin VARCHAR(11) UNIQUE,
    date_of_birth DATE NOT NULL,
    state VARCHAR(100),
    gender VARCHAR(10),
    lga VARCHAR(100),
    area VARCHAR(100),
    address TEXT NOT NULL,
    telephone_number VARCHAR(15),
    passport_photo VARCHAR(255),
    selfie VARCHAR(255),
    id_document VARCHAR(255),
    kyc_level VARCHAR(10) NOT NULL DEFAULT 'TIER_1',
    is_approved BOOLEAN NOT NULL DEFAULT FALSE,
    approved_by BIGINT,
    approved_at TIMESTAMP,
    rejection_reason TEXT,
    last_upgrade_check TIMESTAMP,
    upgrade_eligibility_score INTEGER NOT NULL DEFAULT 0,
    upgrade_requested BOOLEAN NOT NULL DEFAULT FALSE,
    upgrade_request_date TIMESTAMP,
    govt_id_type VARCHAR(20),
    govt_id_document VARCHAR(255),
    proof_of_address VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES users(id)
);

-- Indexes for better performance
CREATE INDEX IF NOT EXISTS idx_user_profiles_phone ON user_profiles(phone);
CREATE INDEX IF NOT EXISTS idx_user_profiles_account_number ON user_profiles(account_number);
CREATE INDEX IF NOT EXISTS idx_user_profiles_user_id ON user_profiles(user_id);

CREATE INDEX IF NOT EXISTS idx_kyc_profiles_user_id ON kyc_profiles(user_id);
CREATE INDEX IF NOT EXISTS idx_kyc_profiles_bvn ON kyc_profiles(bvn);
CREATE INDEX IF NOT EXISTS idx_kyc_profiles_nin ON kyc_profiles(nin);
CREATE INDEX IF NOT EXISTS idx_kyc_profiles_kyc_level ON kyc_profiles(kyc_level);
CREATE INDEX IF NOT EXISTS idx_kyc_profiles_is_approved ON kyc_profiles(is_approved);
CREATE INDEX IF NOT EXISTS idx_kyc_profiles_upgrade_requested ON kyc_profiles(upgrade_requested);