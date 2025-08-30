-- Spring Session tables
DROP TABLE IF EXISTS SPRING_SESSION_ATTRIBUTES;
DROP TABLE IF EXISTS SPRING_SESSION;

CREATE TABLE SPRING_SESSION (
	PRIMARY_ID CHAR(36) NOT NULL,
	SESSION_ID CHAR(36) NOT NULL,
	CREATION_TIME BIGINT NOT NULL,
	LAST_ACCESS_TIME BIGINT NOT NULL,
	MAX_INACTIVE_INTERVAL INT NOT NULL,
	EXPIRY_TIME BIGINT NOT NULL,
	PRINCIPAL_NAME VARCHAR(100),
	CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
);

CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON SPRING_SESSION (SESSION_ID);
CREATE INDEX SPRING_SESSION_IX2 ON SPRING_SESSION (EXPIRY_TIME);
CREATE INDEX SPRING_SESSION_IX3 ON SPRING_SESSION (PRINCIPAL_NAME);

CREATE TABLE SPRING_SESSION_ATTRIBUTES (
	SESSION_PRIMARY_ID CHAR(36) NOT NULL,
	ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
	ATTRIBUTE_BYTES BYTEA NOT NULL,
	CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
	CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES SPRING_SESSION(PRIMARY_ID) ON DELETE CASCADE
);

-- Banking System Tables

-- Roles table
CREATE TABLE IF NOT EXISTS roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    enabled BOOLEAN DEFAULT true,
    account_non_expired BOOLEAN DEFAULT true,
    account_non_locked BOOLEAN DEFAULT true,
    credentials_non_expired BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- User roles mapping table
CREATE TABLE IF NOT EXISTS user_roles (
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    assigned_by INTEGER,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_by) REFERENCES users(id)
);

-- Branches table
CREATE TABLE IF NOT EXISTS branches (
    id SERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    manager_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    customer_number VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    kyc_status VARCHAR(20) DEFAULT 'PENDING',
    risk_rating VARCHAR(10) DEFAULT 'LOW',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- Accounts table
CREATE TABLE IF NOT EXISTS accounts (
    id SERIAL PRIMARY KEY,
    account_number VARCHAR(50) NOT NULL UNIQUE,
    customer_id INTEGER NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    balance DECIMAL(19,2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    opened_by INTEGER,
    branch_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (opened_by) REFERENCES users(id),
    FOREIGN KEY (branch_id) REFERENCES branches(id)
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id SERIAL PRIMARY KEY,
    transaction_id UUID NOT NULL UNIQUE,
    account_id INTEGER NOT NULL,
    amount DECIMAL(19,2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    direction VARCHAR(10) NOT NULL, -- CREDIT or DEBIT
    reference VARCHAR(100),
    description TEXT,
    status VARCHAR(20) DEFAULT 'PENDING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    FOREIGN KEY (account_id) REFERENCES accounts(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

-- Insert default roles
INSERT INTO roles (name, description) VALUES 
    ('ADMIN', 'System Administrator with full access'),
    ('MANAGER', 'Branch Manager with oversight capabilities'),
    ('TELLER', 'Bank Teller with transaction processing access'),
    ('LOAN_OFFICER', 'Loan Officer with loan processing access'),
    ('COMPLIANCE', 'Compliance Officer with regulatory oversight'),
    ('AUDITOR', 'Auditor with read-only access to reports')
ON CONFLICT (name) DO NOTHING;

-- Insert default branch
INSERT INTO branches (code, name, address, city, state, country) VALUES 
    ('HQ001', 'Headquarters', '123 Main Street', 'New York', 'NY', 'USA')
ON CONFLICT (code) DO NOTHING;