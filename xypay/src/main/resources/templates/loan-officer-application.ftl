<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Loan Application Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Loan Application Console - Credit Processing Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Application</span>
            <span class="menu-item">Customer</span>
            <span class="menu-item">Credit</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Application</button>
            <button class="toolbar-btn">Search Customer</button>
            <button class="toolbar-btn">Credit Check</button>
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
                <div class="tree-header">Loan Processing</div>
                
                <div class="tree-node selected" onclick="selectLoanModule(this, 'application')">
                    <div class="tree-icon">📝</div>
                    New Application
                </div>
                
                <div class="tree-node" onclick="selectLoanModule(this, 'pending')">
                    <div class="tree-icon">⏳</div>
                    Pending Applications
                </div>
                
                <div class="tree-node" onclick="selectLoanModule(this, 'approved')">
                    <div class="tree-icon">✅</div>
                    Approved Loans
                </div>
                
                <div class="tree-node" onclick="selectLoanModule(this, 'rejected')">
                    <div class="tree-icon">❌</div>
                    Rejected Applications
                </div>
                
                <div class="tree-node" onclick="selectLoanModule(this, 'calculator')">
                    <div class="tree-icon">🧮</div>
                    Loan Calculator
                </div>
                
                <div class="tree-node" onclick="selectLoanModule(this, 'reports')">
                    <div class="tree-icon">📊</div>
                    Loan Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Loan Application Processing</div>
                <div class="details-content" id="loan-content">
                    
                    <!-- Loan Application Form -->
                    <div class="config-section">
                        <div class="config-header">New Loan Application</div>
                        <div class="config-content">
                            <form action="/loan-officer/application" method="post">
                                <!-- Customer Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Customer Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer ID:</span>
                                        <input type="text" class="form-input" id="customerId" name="customerId" placeholder="Enter customer ID or search">
                                        <button type="button" class="java-btn" onclick="searchCustomer()">Search</button>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Name:</span>
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
                                </fieldset>
                                
                                <!-- Loan Details -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Loan Details</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Loan Type:</span>
                                        <select class="form-select" id="loanType" name="loanType" required onchange="updateLoanTerms()">
                                            <option value="">Select Loan Type</option>
                                            <option value="PERSONAL">Personal Loan</option>
                                            <option value="BUSINESS">Business Loan</option>
                                            <option value="MORTGAGE">Mortgage Loan</option>
                                            <option value="AUTO">Auto Loan</option>
                                            <option value="EDUCATION">Education Loan</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Loan Amount (₦):</span>
                                        <input type="number" class="form-input" id="amount" name="amount" required min="10000" max="50000000" onchange="calculateLoan()">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Loan Term (months):</span>
                                        <select class="form-select" id="loanTerm" name="loanTerm" required onchange="calculateLoan()">
                                            <option value="">Select Term</option>
                                            <option value="6">6 months</option>
                                            <option value="12">12 months</option>
                                            <option value="18">18 months</option>
                                            <option value="24">24 months</option>
                                            <option value="36">36 months</option>
                                            <option value="48">48 months</option>
                                            <option value="60">60 months</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Interest Rate (%):</span>
                                        <input type="number" class="form-input" id="interestRate" name="interestRate" step="0.01" readonly>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Monthly Payment (₦):</span>
                                        <input type="text" class="form-input" id="monthlyPayment" name="monthlyPayment" readonly>
                                    </div>
                                </fieldset>
                                
                                <!-- Employment Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Employment Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Employment Status:</span>
                                        <select class="form-select" id="employmentStatus" name="employmentStatus" required>
                                            <option value="">Select Status</option>
                                            <option value="EMPLOYED">Employed</option>
                                            <option value="SELF_EMPLOYED">Self Employed</option>
                                            <option value="BUSINESS_OWNER">Business Owner</option>
                                            <option value="RETIRED">Retired</option>
                                            <option value="UNEMPLOYED">Unemployed</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Monthly Income (₦):</span>
                                        <input type="number" class="form-input" id="monthlyIncome" name="monthlyIncome" required min="50000">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Employer Name:</span>
                                        <input type="text" class="form-input" id="employerName" name="employerName">
                                    </div>
                                </fieldset>
                                
                                <!-- Additional Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Additional Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Purpose of Loan:</span>
                                        <textarea class="form-input" id="loanPurpose" name="loanPurpose" rows="3" placeholder="Describe the purpose of this loan"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Collateral (if any):</span>
                                        <input type="text" class="form-input" id="collateral" name="collateral" placeholder="Describe any collateral offered">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Officer Notes:</span>
                                        <textarea class="form-input" id="officerNotes" name="officerNotes" rows="3" placeholder="Internal notes and observations"></textarea>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="submit" class="java-btn primary">Submit Application</button>
                                    <button type="button" class="java-btn" onclick="saveDraft()">Save as Draft</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                    <button type="button" class="java-btn" onclick="runCreditCheck()">Run Credit Check</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <!-- Application Result -->
                    <#if result??>
                    <div class="config-section">
                        <div class="config-header">Application Status</div>
                        <div class="config-content">
                            <div class="alert-info" style="padding: 12px; background: #e6f3ff; border: 1px inset #c0c0c0; margin-top: 16px;">
                                ${result}
                            </div>
                        </div>
                    </div>
                    </#if>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Loan Application Console Ready | Applications Today: <span id="applicationsToday">5</span> | Pending Review: <span id="pendingReview">12</span></span>
            <span>Loan Officer: loan.officer@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectLoanModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content based on selection
            const content = document.getElementById('loan-content');
            
            switch(moduleType) {
                case 'pending':
                    content.innerHTML = getPendingApplicationsContent();
                    break;
                case 'approved':
                    content.innerHTML = getApprovedLoansContent();
                    break;
                case 'rejected':
                    content.innerHTML = getRejectedApplicationsContent();
                    break;
                case 'calculator':
                    content.innerHTML = getLoanCalculatorContent();
                    break;
                case 'reports':
                    content.innerHTML = getLoanReportsContent();
                    break;
                default:
                    // Keep default application form
                    break;
            }
        }
        
        function searchCustomer() {
            const customerId = document.getElementById('customerId').value;
            if (customerId) {
                alert('Searching for customer: ' + customerId);
                // Simulate customer data loading
                document.getElementById('customerName').value = 'John Doe';
                document.getElementById('phoneNumber').value = '+234-xxx-xxxx';
                document.getElementById('emailAddress').value = 'john.doe@email.com';
                document.getElementById('monthlyIncome').value = '250000';
                document.getElementById('employerName').value = 'ABC Company Ltd';
            }
        }
        
        function updateLoanTerms() {
            const loanType = document.getElementById('loanType').value;
            const interestRateField = document.getElementById('interestRate');
            
            // Set interest rates based on loan type
            const rates = {
                'PERSONAL': 15.5,
                'BUSINESS': 12.0,
                'MORTGAGE': 8.5,
                'AUTO': 10.0,
                'EDUCATION': 6.5
            };
            
            if (rates[loanType]) {
                interestRateField.value = rates[loanType];
                calculateLoan();
            }
        }
        
        function calculateLoan() {
            const amount = parseFloat(document.getElementById('amount').value);
            const term = parseInt(document.getElementById('loanTerm').value);
            const rate = parseFloat(document.getElementById('interestRate').value);
            
            if (amount && term && rate) {
                const monthlyRate = rate / 100 / 12;
                const monthlyPayment = amount * (monthlyRate * Math.pow(1 + monthlyRate, term)) / (Math.pow(1 + monthlyRate, term) - 1);
                
                document.getElementById('monthlyPayment').value = '₦' + monthlyPayment.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
            }
        }
        
        function saveDraft() {
            alert('Application saved as draft');
        }
        
        function clearForm() {
            document.querySelector('form').reset();
            document.getElementById('interestRate').value = '';
            document.getElementById('monthlyPayment').value = '';
        }
        
        function runCreditCheck() {
            const customerName = document.getElementById('customerName').value;
            if (customerName) {
                alert('Running credit check for: ' + customerName);
            } else {
                alert('Please enter customer information first');
            }
        }
        
        function getPendingApplicationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Pending Loan Applications</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Application ID</th>
                                <th>Customer Name</th>
                                <th>Loan Type</th>
                                <th>Amount</th>
                                <th>Submitted Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>LA001234</td>
                                <td>Jane Smith</td>
                                <td>Personal</td>
                                <td>₦500,000</td>
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
        
        function getApprovedLoansContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Approved Loans</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Loan ID</th>
                                <th>Customer</th>
                                <th>Amount</th>
                                <th>Term</th>
                                <th>Approved Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>LN001234</td>
                                <td>John Doe</td>
                                <td>₦1,000,000</td>
                                <td>24 months</td>
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
                                <th>Customer</th>
                                <th>Amount</th>
                                <th>Rejected Date</th>
                                <th>Reason</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>LA001235</td>
                                <td>Mike Johnson</td>
                                <td>₦2,000,000</td>
                                <td>2024-01-12</td>
                                <td>Insufficient income</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getLoanCalculatorContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Loan Calculator</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Principal Amount (₦):</span>
                            <input type="number" class="form-input" id="calcAmount" onchange="calculateLoanPayment()">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Interest Rate (%):</span>
                            <input type="number" class="form-input" id="calcRate" step="0.01" onchange="calculateLoanPayment()">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Term (months):</span>
                            <input type="number" class="form-input" id="calcTerm" onchange="calculateLoanPayment()">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Monthly Payment:</span>
                            <input type="text" class="form-input" id="calcPayment" readonly>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Total Interest:</span>
                            <input type="text" class="form-input" id="calcInterest" readonly>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getLoanReportsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Loan Reports</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Loan Portfolio Summary</option>
                                <option>Default Risk Analysis</option>
                                <option>Monthly Disbursement Report</option>
                                <option>Interest Income Report</option>
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
        
        // Initialize
        window.onload = function() {
            document.getElementById('applicationsToday').textContent = '5';
            document.getElementById('pendingReview').textContent = '12';
        };
    </script>
</body>
</html>
