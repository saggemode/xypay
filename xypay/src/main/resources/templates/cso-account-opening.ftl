<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Account Opening Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Account Opening Console - Customer Service Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Customer</span>
            <span class="menu-item">Account</span>
            <span class="menu-item">KYC</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Account</button>
            <button class="toolbar-btn">Search Customer</button>
            <button class="toolbar-btn">KYC Check</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Save Draft</button>
            <button class="toolbar-btn">Submit</button>
            <button class="toolbar-btn">Print</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Calculator</button>
            <button class="toolbar-btn">Documents</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Account Services</div>
                
                <div class="tree-node selected" onclick="selectAccountModule(this, 'opening')">
                    <div class="tree-icon">🆕</div>
                    New Account Opening
                </div>
                
                <div class="tree-node" onclick="selectAccountModule(this, 'pending')">
                    <div class="tree-icon">⏳</div>
                    Pending Applications
                </div>
                
                <div class="tree-node" onclick="selectAccountModule(this, 'approved')">
                    <div class="tree-icon">✅</div>
                    Approved Accounts
                </div>
                
                <div class="tree-node" onclick="selectAccountModule(this, 'rejected')">
                    <div class="tree-icon">❌</div>
                    Rejected Applications
                </div>
                
                <div class="tree-node" onclick="selectAccountModule(this, 'types')">
                    <div class="tree-icon">📋</div>
                    Account Types
                </div>
                
                <div class="tree-node" onclick="selectAccountModule(this, 'reports')">
                    <div class="tree-icon">📊</div>
                    Opening Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Account Opening Processing</div>
                <div class="details-content" id="account-content">
                    
                    <!-- Account Opening Form -->
                    <div class="config-section">
                        <div class="config-header">New Account Application</div>
                        <div class="config-content">
                            <form action="/cso/account-opening" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                
                                <!-- Customer Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Customer Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Search:</span>
                                        <input type="text" class="form-input" id="customerSearch" placeholder="Search by phone, email, or ID">
                                        <button type="button" class="java-btn" onclick="searchExistingCustomer()">Search</button>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">First Name:</span>
                                        <input type="text" class="form-input" id="firstName" name="firstName" required>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Last Name:</span>
                                        <input type="text" class="form-input" id="lastName" name="lastName" required>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Full Name (Display):</span>
                                        <input type="text" class="form-input" id="customerName" name="customerName" required>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Phone Number:</span>
                                        <input type="tel" class="form-input" id="phoneNumber" name="phoneNumber" required>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Email Address:</span>
                                        <input type="email" class="form-input" id="emailAddress" name="emailAddress">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Date of Birth:</span>
                                        <input type="date" class="form-input" id="dateOfBirth" name="dateOfBirth" required>
                                    </div>
                                </fieldset>
                                
                                <!-- Account Details -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Account Details</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Type:</span>
                                        <select class="form-select" id="accountType" name="accountType" required onchange="updateAccountFeatures()">
                                            <option value="">Select Account Type</option>
                                            <option value="savings">Savings Account</option>
                                            <option value="current">Current Account</option>
                                            <option value="fixed_deposit">Fixed Deposit</option>
                                            <option value="student">Student Account</option>
                                            <option value="business">Business Account</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Currency:</span>
                                        <select class="form-select" id="currency" name="currency" required>
                                            <option value="NGN">Nigerian Naira (NGN)</option>
                                            <option value="USD">US Dollar (USD)</option>
                                            <option value="EUR">Euro (EUR)</option>
                                            <option value="GBP">British Pound (GBP)</option>
                                            <option value="KES">Kenyan Shilling (KES)</option>
                                            <option value="GHS">Ghanaian Cedi (GHS)</option>
                                            <option value="ZAR">South African Rand (ZAR)</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Initial Deposit:</span>
                                        <input type="number" class="form-input" id="initialDeposit" name="initialDeposit" min="0" step="0.01">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Branch:</span>
                                        <select class="form-select" id="branch" name="branch" required>
                                            <option value="">Select Branch</option>
                                            <option value="MAIN">Main Branch - Lagos</option>
                                            <option value="ABUJA">Abuja Branch</option>
                                            <option value="KANO">Kano Branch</option>
                                            <option value="PHC">Port Harcourt Branch</option>
                                            <option value="IBADAN">Ibadan Branch</option>
                                        </select>
                                    </div>
                                </fieldset>
                                
                                <!-- KYC Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">KYC Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Legal ID Type:</span>
                                        <select class="form-select" id="legalIdType" name="legalIdType" required>
                                            <option value="">Select ID Type</option>
                                            <option value="BVN">Bank Verification Number (BVN)</option>
                                            <option value="NIN">National ID Number (NIN)</option>
                                            <option value="PASSPORT">International Passport</option>
                                            <option value="DRIVERS_LICENSE">Driver's License</option>
                                            <option value="VOTERS_CARD">Voter's Registration Card</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Legal ID Number:</span>
                                        <input type="text" class="form-input" id="legalId" name="legalId" required>
                                        <button type="button" class="java-btn" onclick="verifyLegalId()">Verify</button>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">KYC Status:</span>
                                        <select class="form-select" id="kycStatus" name="kycStatus" required>
                                            <option value="BASIC">Basic KYC</option>
                                            <option value="ENHANCED">Enhanced KYC</option>
                                            <option value="PREMIUM">Premium KYC</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Address:</span>
                                        <textarea class="form-input" id="address" name="address" rows="3" placeholder="Enter full address"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Occupation:</span>
                                        <input type="text" class="form-input" id="occupation" name="occupation">
                                    </div>
                                </fieldset>
                                
                                <!-- Additional Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Additional Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Referral Source:</span>
                                        <select class="form-select" id="referralSource" name="referralSource">
                                            <option value="">Select Source</option>
                                            <option value="WALK_IN">Walk-in Customer</option>
                                            <option value="ONLINE">Online Application</option>
                                            <option value="REFERRAL">Customer Referral</option>
                                            <option value="AGENT">Agent Referral</option>
                                            <option value="MARKETING">Marketing Campaign</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Special Instructions:</span>
                                        <textarea class="form-input" id="specialInstructions" name="specialInstructions" rows="3" placeholder="Any special instructions or notes"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">CSO Notes:</span>
                                        <textarea class="form-input" id="csoNotes" name="csoNotes" rows="3" placeholder="Internal notes and observations"></textarea>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="submit" class="java-btn primary">Submit Application</button>
                                    <button type="button" class="java-btn" onclick="saveDraft()">Save as Draft</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                    <button type="button" class="java-btn" onclick="previewAccount()">Preview</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Account Opening Console Ready | Applications Today: <span id="applicationsToday">8</span> | Pending Approval: <span id="pendingApproval">15</span></span>
            <span>CSO: cso@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectAccountModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('account-content');
            
            switch(moduleType) {
                case 'pending':
                    content.innerHTML = getPendingApplicationsContent();
                    break;
                case 'approved':
                    content.innerHTML = getApprovedAccountsContent();
                    break;
                case 'rejected':
                    content.innerHTML = getRejectedApplicationsContent();
                    break;
                case 'types':
                    content.innerHTML = getAccountTypesContent();
                    break;
                case 'reports':
                    content.innerHTML = getOpeningReportsContent();
                    break;
                default:
                    // Keep default opening form
                    break;
            }
        }
        
        function searchExistingCustomer() {
            const searchTerm = document.getElementById('customerSearch').value;
            if (searchTerm) {
                alert('Searching for existing customer: ' + searchTerm);
                // Simulate customer data loading
                document.getElementById('firstName').value = 'John';
                document.getElementById('lastName').value = 'Doe';
                document.getElementById('customerName').value = 'John Doe';
                document.getElementById('phoneNumber').value = '+234-xxx-xxxx';
                document.getElementById('emailAddress').value = 'john.doe@email.com';
                document.getElementById('legalId').value = '12345678901';
                document.getElementById('address').value = '123 Main Street, Lagos, Nigeria';
                document.getElementById('occupation').value = 'Software Engineer';
            }
        }
        
        function updateAccountFeatures() {
            const accountType = document.getElementById('accountType').value;
            const initialDepositField = document.getElementById('initialDeposit');
            
            // Set minimum deposit based on account type
            const minimumDeposits = {
                'savings': 1000,
                'current': 5000,
                'fixed_deposit': 50000,
                'student': 500,
                'business': 10000
            };
            
            if (minimumDeposits[accountType]) {
                initialDepositField.min = minimumDeposits[accountType];
                initialDepositField.placeholder = 'Minimum: ₦' + minimumDeposits[accountType].toLocaleString();
            }
        }
        
        function verifyLegalId() {
            const legalId = document.getElementById('legalId').value;
            const idType = document.getElementById('legalIdType').value;
            
            if (legalId && idType) {
                alert('Verifying ' + idType + ': ' + legalId);
                // Simulate verification result
                setTimeout(() => {
                    alert('ID verification successful');
                }, 1000);
            } else {
                alert('Please select ID type and enter ID number');
            }
        }
        
        function saveDraft() {
            alert('Account application saved as draft');
        }
        
        function clearForm() {
            document.querySelector('form').reset();
        }
        
        function previewAccount() {
            const customerName = document.getElementById('customerName').value;
            const accountType = document.getElementById('accountType').value;
            
            if (customerName && accountType) {
                alert('Preview: ' + accountType + ' account for ' + customerName);
            } else {
                alert('Please fill in customer name and account type first');
            }
        }
        
        function getPendingApplicationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Pending Account Applications</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Application ID</th>
                                <th>Customer Name</th>
                                <th>Account Type</th>
                                <th>Currency</th>
                                <th>Submitted Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>ACC001234</td>
                                <td>Jane Smith</td>
                                <td>Savings</td>
                                <td>NGN</td>
                                <td>2024-01-15</td>
                                <td style="color: orange;">Under Review</td>
                                <td>
                                    <button class="java-btn primary">Review</button>
                                    <button class="java-btn">View Details</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getApprovedAccountsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Recently Approved Accounts</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Account Number</th>
                                <th>Customer Name</th>
                                <th>Account Type</th>
                                <th>Balance</th>
                                <th>Opened Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>1234567890</td>
                                <td>John Doe</td>
                                <td>Savings</td>
                                <td>₦5,000</td>
                                <td>2024-01-10</td>
                                <td style="color: green;">Active</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getRejectedApplicationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Rejected Applications</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Application ID</th>
                                <th>Customer Name</th>
                                <th>Account Type</th>
                                <th>Rejected Date</th>
                                <th>Reason</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>ACC001235</td>
                                <td>Mike Johnson</td>
                                <td>Business</td>
                                <td>2024-01-12</td>
                                <td>Incomplete KYC</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getAccountTypesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Available Account Types</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Account Type</th>
                                <th>Minimum Deposit</th>
                                <th>Monthly Fee</th>
                                <th>Interest Rate</th>
                                <th>Features</th>
                            </tr>
                            <tr>
                                <td>Savings</td>
                                <td>₦1,000</td>
                                <td>₦100</td>
                                <td>2.5% p.a.</td>
                                <td>ATM Card, Online Banking</td>
                            </tr>
                            <tr>
                                <td>Current</td>
                                <td>₦5,000</td>
                                <td>₦500</td>
                                <td>0.5% p.a.</td>
                                <td>Checkbook, Overdraft Facility</td>
                            </tr>
                            <tr>
                                <td>Fixed Deposit</td>
                                <td>₦50,000</td>
                                <td>₦0</td>
                                <td>8.0% p.a.</td>
                                <td>Fixed Term, Higher Interest</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getOpeningReportsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Account Opening Reports</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Daily Account Opening Summary</option>
                                <option>Account Type Analysis</option>
                                <option>KYC Compliance Report</option>
                                <option>Branch Performance Report</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Date Range:</span>
                            <input type="date" class="form-input" style="width: 150px;">
                            <span>to</span>
                            <input type="date" class="form-input" style="width: 150px;">
                        </div>
                        <div style="text-align: center; margin-top: 16px;">
                            <button class="java-btn primary">Generate Report</button>
                            <button class="java-btn">Export to Excel</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Auto-populate full name when first/last name changes
        document.getElementById('firstName').addEventListener('input', updateFullName);
        document.getElementById('lastName').addEventListener('input', updateFullName);
        
        function updateFullName() {
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            document.getElementById('customerName').value = (firstName + ' ' + lastName).trim();
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('applicationsToday').textContent = '8';
            document.getElementById('pendingApproval').textContent = '15';
        };
    </script>
</body>
</html>
                <option value="STANDARD">Standard</option>
                <option value="ENHANCED">Enhanced</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Open Account</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
