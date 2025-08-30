# XY Pay Core Banking System

A comprehensive core banking system built with Spring Boot, implementing modern banking features and architectural patterns. XY Pay provides a FLEXCUBE-like configuration system that allows banks to customize all aspects of their operations without writing code.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Getting Started](#getting-started)
- [Admin Console](#admin-console)
- [API Documentation](#api-documentation)
- [Deployment](#deployment)
- [Security Considerations](#security-considerations)
- [Monitoring and Observability](#monitoring-and-observability)

## Overview

XY Pay Core Banking System is a modern, scalable banking platform designed to support multi-branch operations with configurable settings for deployment across different banks. The system implements industry-standard practices for security, compliance, and performance.

XY Pay provides a comprehensive configuration management system similar to Oracle FLEXCUBE, allowing banks to customize all aspects of their banking operations without writing code.

## Features

### Core Banking Features
- **Customer Management**: KYC verification, customer onboarding
- **Account Management**: Multi-currency accounts, account lifecycle
- **Transaction Processing**: Deposits, withdrawals, transfers with idempotency support
- **Balance Management**: Real-time balance calculation with caching
- **General Ledger**: Double-entry bookkeeping system
- **Loan Processing**: Loan origination and management
- **Reconciliation**: Transaction matching and reporting

### Advanced Features
- **AML Monitoring**: Threshold-based alerts for suspicious transactions
- **Audit Trail**: Immutable logs for all financial operations
- **Multi-Branch Support**: Configurable branch system
- **Regulatory Compliance**: ISO 20022 reporting format
- **PII Protection**: Encryption of personally identifiable information
- **Event-Driven Architecture**: Kafka-based event streaming

### Configuration Capabilities
- **Customer & Account Setup**: Configure customer types, KYC levels, and account parameters
- **Product Definition**: Define loan products with interest rates and repayment schedules
- **Interest & Charges Setup**: Configure interest rates and fee structures
- **Transaction Rules**: Set limits and validation rules for transactions
- **Risk & Compliance**: Configure risk ratings and compliance parameters
- **Branch & Entity Setup**: Multi-branch configuration support
- **Reporting & Analytics**: Customizable reporting capabilities
- **Workflow & Authorization**: Configure approval workflows
- **Alerts & Notifications**: Set up alerting mechanisms
- **Integration Management**: Configure external system integrations
- **Parameter Maintenance**: System-wide parameter configuration
- **Database Query Tools**: Query database without writing SQL
- **Scripting Capabilities**: Custom scripting for business logic

### Security & Compliance
- **Authentication**: OAuth2/OIDC integration
- **Authorization**: RBAC with scope-based API access
- **Encryption**: PII encryption at rest and in transit
- **Auditing**: Immutable audit logs with separate pipeline
- **Regulatory Reporting**: KYC records, transaction reporting

### Observability & Monitoring
- **Metrics**: Prometheus integration with Grafana dashboards
- **Tracing**: OpenTelemetry with Jaeger
- **Logging**: ELK/Loki stack integration
- **Health Checks**: Comprehensive system health monitoring

## Architecture

The system follows a modular microservices architecture based on Hexagonal/Clean Architecture principles:

```
┌─────────────────────────────────────────────────────────────┐
│                    API Gateway Layer                        │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│                   Services Layer                            │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌──────────┐│
│ │Customer/KYC │ │Accounts &   │ │Transaction/ │ │General   ││
│ │Service      │ │Balances     │ │Payments     │ │Ledger    ││
│ │             │ │Service      │ │Service      │ │Service   ││
│ └─────────────┘ └─────────────┘ └─────────────┘ └──────────┘│
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌──────────┐│
│ │Loans        │ │Reconciliation│ │Channels     │ │Auth/     ││
│ │Service      │ │Service      │ │(ATM,IB,Mobile)│ │Identity  ││
│ └─────────────┘ └─────────────┘ └─────────────┘ │Service   ││
│ ┌───────────────────────────────────────────────┤          ││
│ │            Integration/Adapter Layer          │          ││
│ │ (SWIFT, NIBSS, ISO 20022, external banks)     │          ││
│ └───────────────────────────────────────────────┴──────────┘│
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│                    Event Bus (Kafka)                        │
└─────────────────────────┬───────────────────────────────────┘
                          │
┌─────────────────────────▼───────────────────────────────────┐
│                   Data Layer                                │
├─────────────────────────────────────────────────────────────┤
│ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌──────────┐│
│ │   PostgreSQL│ │    Redis    │ │   Kafka     │ │Elasticsearch│
│ │   (Primary) │ │  (Cache)    │ │  (Events)   │ │(Search)  ││
│ └─────────────┘ └─────────────┘ └─────────────┘ └──────────┘│
└─────────────────────────────────────────────────────────────┘
```

### Key Design Patterns

1. **Hexagonal Architecture**: Clean separation of business logic from infrastructure
2. **Saga Pattern**: For distributed transactions across services
3. **Event Sourcing**: Immutable event logs for audit trail
4. **CQRS**: Separate read and write models for performance
5. **Caching**: Redis for hot data reads

## Technology Stack

### Core Technologies
- **Framework**: Spring Boot 3.5.5
- **Language**: Java 17
- **Build Tool**: Maven

### Backend
- **ORM**: Spring Data JPA
- **Security**: Spring Security
- **Templates**: FreeMarker
- **Session Management**: Spring Session with JDBC
- **Email**: Spring Mail
- **API Documentation**: SpringDoc OpenAPI/Swagger
- **Messaging**: Spring Kafka

### Databases
- **Primary Database**: PostgreSQL
- **Cache**: Redis
- **Test Database**: H2 (in-memory)

### Frontend
- **UI Framework**: Bootstrap 5
- **Template Engine**: FreeMarker

### Observability
- **Metrics**: Prometheus, Grafana
- **Tracing**: OpenTelemetry
- **Logging**: ELK Stack/Loki

### Development Tools
- **Lombok**: Reduces boilerplate code
- **Spring DevTools**: Enhances development experience

## Getting Started

### Prerequisites

- Java 24
- Maven 3.8+
- PostgreSQL
- Redis
- Apache Kafka
- Docker (optional, for containerized deployment)

### Initial Setup for Banks

When a bank first deploys XY Pay, they need to go through an initialization process:

1. Start the application
2. Navigate to `http://localhost:8080` in your browser
3. Click "Begin Setup Process"
4. Complete the initialization form with:
   - Your bank's legal name
   - Your main branch code
   - Administrator account details
5. Submit the form to initialize the system
6. Login with your administrator credentials

This process creates the initial database structure, sets up the main branch, and creates the first administrator account with full system access.

### Default Access

After initialization, administrators can access the system at:
- URL: `http://localhost:8080/login`
- Use the credentials created during the setup process

### Installation

#### Prerequisites
- Java 17 or higher
- Maven 3.6 or higher
- PostgreSQL 12 or higher
- Redis 6 or higher

1. Clone the repository:
```bash
git clone <repository-url>
cd xypay
```

2. Configure the application:
```bash
# Update src/main/resources/application.properties with your database and service configurations
```

3. Build the project:
```bash
mvn clean package
```

4. Run the application:
```bash
mvn spring-boot:run
```

Or run the JAR file:
```bash
java -jar target/xypay-0.0.1-SNAPSHOT.jar
```

### Configuration

Key configuration properties in `application.properties`:

```properties
# Application configuration
spring.application.name=xypay

# Database configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/xypay_db
spring.datasource.username=postgres
spring.datasource.password=123
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

# Redis configuration
spring.data.redis.host=localhost
spring.data.redis.port=6379

# Server configuration
server.port=8080

# Enable SQL script execution
spring.sql.init.mode=always

# Branch configuration
branch.default.code=HQ001
branch.default.name=Headquarters

# Regulatory configuration
regulatory.reporting.format=ISO20022
regulatory.reporting.enabled=true

# FreeMarker configuration
spring.freemarker.template-loader-path=classpath:/templates/
spring.freemarker.suffix=.ftl
spring.freemarker.enabled=true
```

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── xypay/
│   │           └── xypay/
│   │               ├── admin/           # Admin controllers for configuration
│   │               ├── config/          # Application configuration classes
│   │               ├── controller/      # Web controllers
│   │               ├── domain/          # Domain entities
│   │               ├── exception/       # Custom exceptions
│   │               ├── repository/      # Data access interfaces
│   │               ├── service/         # Business logic services
│   │               └── XypayApplication.java  # Main application class
│   └── resources/
│       ├── static/                      # Static resources (CSS, JS)
│       ├── templates/                   # FreeMarker templates
│       └── application.properties       # Application configuration
└── test/                                # Test classes
```

## Development Guidelines

### Code Style
- Follow standard Java coding conventions
- Use meaningful variable and method names
- Add appropriate JavaDoc comments for public methods
- Follow the existing architectural patterns

### Testing
- Write unit tests for all business logic
- Use H2 in-memory database for testing
- Run tests before submitting pull requests

### Security Best Practices
- Never hardcode credentials
- Use parameterized queries to prevent SQL injection
- Apply proper input validation
- Follow the principle of least privilege

## Admin Console

XY Pay provides a comprehensive admin console accessible via RESTful APIs that allows banks to configure all aspects of the system without writing code. The admin console includes the following modules:

### Modules Overview

1. **Customer & Account Setup**: Configure customer types, KYC requirements, and account parameters
2. **Product Definition**: Define loan products with interest rates and repayment schedules
3. **Interest & Charges Setup**: Configure interest rates and fee structures
4. **Transaction Rules**: Set limits and validation rules for transactions
5. **Risk & Compliance**: Configure risk ratings and compliance parameters
6. **Branch & Entity Setup**: Multi-branch configuration support
7. **Reporting & Analytics**: Customizable reporting capabilities
8. **Workflow & Authorization**: Configure approval workflows
9. **Alerts & Notifications**: Set up alerting mechanisms
10. **Integration Management**: Configure external system integrations
11. **Parameter Maintenance**: System-wide parameter configuration
12. **Database Query Tools**: Query database without writing SQL
13. **Scripting Capabilities**: Custom scripting for business logic

### Accessing Admin Console

After completing the initial setup, administrators can access the admin console at:
- Dashboard: `http://localhost:8080/admin/ui/dashboard`

The admin console provides a FLEXCUBE-like experience for configuring all aspects of the banking system.

## API Documentation

XY Pay provides comprehensive API documentation for all endpoints using SpringDoc OpenAPI. The documentation is available at:

- `/swagger-ui/index.html` - Swagger UI for interactive API exploration
- `/v3/api-docs` - OpenAPI specification in JSON format
- `/v3/api-docs.yaml` - OpenAPI specification in YAML format

The API is organized into the following groups:
- Public API: `/api/**` - Endpoints for external integrations
- Admin API: `/admin/**` - Endpoints for system configuration

The API documentation includes detailed information about all endpoints, request/response formats, and authentication requirements.

### API Security

All API endpoints are secured using Spring Security with the following mechanisms:
- Form-based authentication for web interface
- OAuth2/OIDC for API access
- Role-based access control for authorization

### Core API Endpoints

#### Customer Management
- `POST /api/customers` - Create a new customer
- `GET /api/customers/{customerId}` - Get customer details

#### Account Management
- `POST /api/accounts` - Create a new account
- `GET /api/accounts/{accountId}` - Get account details

#### Transaction Processing
- `POST /api/transactions` - Process a transaction
- `POST /api/transactions/{transactionId}/reverse` - Reverse a transaction

#### Balance Management
- `GET /api/balances/account/{accountId}` - Get account balance

#### Loan Processing
- `POST /api/loans` - Create a new loan
- `POST /api/loans/{loanId}/approve` - Approve a loan

#### Branch/Channel Management
- `POST /api/channels` - Create a new channel
- `GET /api/channels/{channelId}` - Get channel details

#### Reporting & Compliance
- `GET /api/reports/transactions/iso20022` - Generate ISO 20022 transaction report

## Deployment

### Containerized Deployment

Docker images can be built using the provided Dockerfile:

```bash
docker build -t xypay-core-banking .
docker run -p 8080:8080 xypay-core-banking
```

### Kubernetes Deployment

Helm charts are available for Kubernetes deployment:

```bash
helm install xypay-core-banking ./helm/xypay
```

### Configuration for Different Banks

The system supports multi-tenancy through externalized configuration:

1. **Branch Configuration**: Define branches in `application.properties`
2. **Database per Tenant**: Configure separate databases for each bank
3. **Custom Business Rules**: Implement tenant-specific business logic
4. **Regulatory Compliance**: Adapt to local regulatory requirements

## Security Considerations

- All PII data is encrypted at rest using Spring Security's encryption utilities
- Transport Layer Security (TLS) for all external communications
- Mutual TLS (mTLS) for internal service-to-service communication
- OAuth2/OIDC for API authentication and authorization
- Role-Based Access Control (RBAC) with fine-grained permissions
- Regular security audits and penetration testing recommended

## Monitoring and Observability

- Metrics exposed via Prometheus endpoint at `/actuator/prometheus`
- Distributed tracing with OpenTelemetry and Jaeger
- Health checks available at `/api/health`
- Structured logging for ELK/Loki integration
- Alerting through Prometheus Alertmanager

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a pull request

## License

This project is licensed under the Apache 2.0 License - see the LICENSE file for details.

## Contact

For support or questions, please open an issue in the repository.