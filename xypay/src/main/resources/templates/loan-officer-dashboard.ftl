<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Loan Officer Workstation - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Loan Officer Workstation - Credit & Lending Management Interface</span>
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
            <span class="menu-item">Credit</span>
            <span class="menu-item">Portfolio</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Application</button>
            <button class="toolbar-btn">Search</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Credit Check</button>
            <button class="toolbar-btn">Risk Assessment</button>
            <button class="toolbar-btn">Approval</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Portfolio</button>
            <button class="toolbar-btn">Repayment</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Print</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Loan Operations</div>
                
                <div class="tree-node selected" onclick="selectLoanOperation(this, 'dashboard')">
                    <div class="tree-icon">🏠</div>
                    Dashboard
                </div>
                
                <div class="tree-node" onclick="selectLoanOperation(this, 'applications')">
                    <div class="tree-icon">📄</div>
                    Loan Applications
                </div>
                
                <div class="tree-node" onclick="selectLoanOperation(this, 'credit-check')">
                    <div class="tree-icon">🔍</div>
                    Credit Check
                </div>
                
                <div class="tree-node" onclick="selectLoanOperation(this, 'risk-assessment')">
                    <div class="tree-icon">⚠️</div>
                    Risk Assessment
                </div>
                
                <div class="tree-node" onclick="selectLoanOperation(this, 'portfolio')">
                    <div class="tree-icon">💼</div>
                    Loan Portfolio
                </div>
                
                <div class="tree-node" onclick="selectLoanOperation(this, 'repayment')">
                    <div class="tree-icon">💰</div>
                    Repayment Schedule
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Loan Operations Center</div>
                <div class="details-content" id="loan-content">
                    
                    <!-- Dashboard Content -->
                    <div class="config-section">
                        <div class="config-header">Welcome, Loan Officer</div>
                        <div class="config-content">
                            <p>Ready to process loan applications and manage credit portfolios. Select an operation from the left panel.</p>
                            <p><strong>Status:</strong> <span style="color: green;">Active</span> | <strong>Pending Applications:</strong> <span id="pendingApps">7</span></p>
                        </div>
                    </div>
                    
                    <!-- Quick Operations Panel -->
                    <div class="config-section">
                        <div class="config-header">Quick Operations Access</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Operation</th>
                                    <th>Description</th>
                                    <th>Priority</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <td>📄 New Applications</td>
                                    <td>Review new loan applications</td>
                                    <td style="color: red;">Urgent</td>
                                    <td><button class="java-btn" onclick="selectLoanOperation(null, 'applications')">Review</button></td>
                                </tr>
                                <tr>
                                    <td>🔍 Credit Verification</td>
                                    <td>Perform credit checks</td>
                                    <td style="color: orange;">High</td>
                                    <td><button class="java-btn" onclick="selectLoanOperation(null, 'credit-check')">Check</button></td>
                                </tr>
                                <tr>
                                    <td>⚠️ Risk Assessment</td>
                                    <td>Evaluate loan risk factors</td>
                                    <td style="color: orange;">High</td>
                                    <td><button class="java-btn" onclick="selectLoanOperation(null, 'risk-assessment')">Assess</button></td>
                                </tr>
                                <tr>
                                    <td>💼 Portfolio Review</td>
                                    <td>Monitor active loans</td>
                                    <td style="color: green;">Normal</td>
                                    <td><button class="java-btn" onclick="selectLoanOperation(null, 'portfolio')">View</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Recent Loan Activities -->
                    <div class="config-section">
                        <div class="config-header">Recent Loan Activities</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Time</th>
                                    <th>Applicant</th>
                                    <th>Loan Type</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                                <tr>
                                    <td id="loan1Time">--:--</td>
                                    <td>Sarah Johnson</td>
                                    <td>Personal Loan</td>
                                    <td>₦500,000</td>
                                    <td style="color: green;">Approved</td>
                                </tr>
                                <tr>
                                    <td id="loan2Time">--:--</td>
                                    <td>Michael Chen</td>
                                    <td>Business Loan</td>
                                    <td>₦2,000,000</td>
                                    <td style="color: orange;">Under Review</td>
                                </tr>
                                <tr>
                                    <td id="loan3Time">--:--</td>
                                    <td>Emma Davis</td>
                                    <td>Auto Loan</td>
                                    <td>₦1,200,000</td>
                                    <td style="color: red;">Rejected</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Loan Officer Station Ready | Pending: <span id="statusPendingApps">7</span> applications</span>
            <span>Officer: <span id="officerName">loan.officer@xypay.com</span> | Shift: <span id="shiftTime">08:30-16:30</span></span>
        </div>
    </div>
    
    <script>
        function selectLoanOperation(element, operationType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load operation content
            const content = document.getElementById('loan-content');
            
            switch(operationType) {
                case 'applications':
                    content.innerHTML = getApplicationsContent();
                    break;
                case 'credit-check':
                    content.innerHTML = getCreditCheckContent();
                    break;
                case 'risk-assessment':
                    content.innerHTML = getRiskAssessmentContent();
                    break;
                case 'portfolio':
                    content.innerHTML = getPortfolioContent();
                    break;
                case 'repayment':
                    content.innerHTML = getRepaymentContent();
                    break;
                default:
                    // Keep dashboard content
                    break;
            }
        }
        
        function getApplicationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Loan Application Review</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>App ID</th>
                                <th>Applicant</th>
                                <th>Loan Type</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <td>LA001234</td>
                                <td>John Smith</td>
                                <td>Personal</td>
                                <td>₦750,000</td>
                                <td>2024-01-15</td>
                                <td style="color: orange;">Pending</td>
                                <td><button class="java-btn">Review</button></td>
                            </tr>
                            <tr>
                                <td>LA001235</td>
                                <td>Mary Wilson</td>
                                <td>Business</td>
                                <td>₦3,000,000</td>
                                <td>2024-01-14</td>
                                <td style="color: orange;">Pending</td>
                                <td><button class="java-btn">Review</button></td>
                            </tr>
                            <tr>
                                <td>LA001236</td>
                                <td>David Brown</td>
                                <td>Auto</td>
                                <td>₦1,500,000</td>
                                <td>2024-01-13</td>
                                <td style="color: red;">Requires Documents</td>
                                <td><button class="java-btn">Contact</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Bulk Review</button>
                            <button class="java-btn">Export List</button>
                            <button class="java-btn">Filter Applications</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getCreditCheckContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Credit Check & Verification</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Application ID:</span>
                            <input type="text" class="form-input" placeholder="Enter application ID">
                            <button class="java-btn">Load Application</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Applicant Name:</span>
                            <input type="text" class="form-input" placeholder="Auto-filled" readonly>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Credit Bureau:</span>
                            <select class="form-select">
                                <option>CRC Credit Bureau</option>
                                <option>XDS Credit Bureau</option>
                                <option>FirstCentral Credit Bureau</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; padding: 12px; background: #f8f8f8; border: 1px inset #c0c0c0;">
                            <div class="form-row">
                                <span class="form-label">Credit Score:</span>
                                <span style="color: green; font-weight: bold; font-size: 14px;">720</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Credit Rating:</span>
                                <span style="color: green;">Excellent</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Default History:</span>
                                <span>None in last 5 years</span>
                            </div>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Run Credit Check</button>
                            <button class="java-btn">Generate Report</button>
                            <button class="java-btn">Clear</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRiskAssessmentContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Loan Risk Assessment</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Application ID:</span>
                            <input type="text" class="form-input" placeholder="Enter application ID">
                            <button class="java-btn">Load Data</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Income Verification:</span>
                            <select class="form-select">
                                <option>Verified</option>
                                <option>Pending</option>
                                <option>Failed</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Debt-to-Income Ratio:</span>
                            <input type="number" class="form-input" placeholder="0.00" step="0.01">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Collateral Value:</span>
                            <input type="number" class="form-input" placeholder="0.00">
                        </div>
                        <div style="margin-top: 16px; padding: 12px; background: #f8f8f8; border: 1px inset #c0c0c0;">
                            <div class="form-row">
                                <span class="form-label">Risk Score:</span>
                                <span style="color: orange; font-weight: bold;">Medium (65/100)</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Recommendation:</span>
                                <span>Approve with conditions</span>
                            </div>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Calculate Risk</button>
                            <button class="java-btn">Save Assessment</button>
                            <button class="java-btn">Clear</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getPortfolioContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Active Loan Portfolio</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Loan ID</th>
                                <th>Borrower</th>
                                <th>Principal</th>
                                <th>Outstanding</th>
                                <th>Next Payment</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <td>LN001234</td>
                                <td>Alice Johnson</td>
                                <td>₦1,000,000</td>
                                <td>₦750,000</td>
                                <td>2024-02-01</td>
                                <td style="color: green;">Current</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                            <tr>
                                <td>LN001235</td>
                                <td>Bob Smith</td>
                                <td>₦2,500,000</td>
                                <td>₦2,100,000</td>
                                <td>2024-01-28</td>
                                <td style="color: orange;">Late</td>
                                <td><button class="java-btn">Contact</button></td>
                            </tr>
                            <tr>
                                <td>LN001236</td>
                                <td>Carol Davis</td>
                                <td>₦800,000</td>
                                <td>₦200,000</td>
                                <td>2024-02-15</td>
                                <td style="color: green;">Current</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Portfolio Summary</button>
                            <button class="java-btn">Generate Report</button>
                            <button class="java-btn">Export Data</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRepaymentContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Repayment Schedule Management</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Loan ID:</span>
                            <input type="text" class="form-input" placeholder="Enter loan ID">
                            <button class="java-btn">Load Schedule</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Payment #</th>
                                <th>Due Date</th>
                                <th>Principal</th>
                                <th>Interest</th>
                                <th>Total Payment</th>
                                <th>Status</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>2024-02-01</td>
                                <td>₦41,667</td>
                                <td>₦8,333</td>
                                <td>₦50,000</td>
                                <td style="color: green;">Paid</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2024-03-01</td>
                                <td>₦41,667</td>
                                <td>₦8,333</td>
                                <td>₦50,000</td>
                                <td style="color: orange;">Due</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2024-04-01</td>
                                <td>₦41,667</td>
                                <td>₦8,333</td>
                                <td>₦50,000</td>
                                <td>Pending</td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Modify Schedule</button>
                            <button class="java-btn">Record Payment</button>
                            <button class="java-btn">Print Schedule</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize dashboard
        window.onload = function() {
            // Set current time for recent activities
            const now = new Date();
            document.getElementById('loan1Time').textContent = new Date(now.getTime() - 300000).toLocaleTimeString();
            document.getElementById('loan2Time').textContent = new Date(now.getTime() - 600000).toLocaleTimeString();
            document.getElementById('loan3Time').textContent = new Date(now.getTime() - 900000).toLocaleTimeString();
            
            // Set officer info
            document.getElementById('officerName').textContent = 'loan.officer@xypay.com';
            document.getElementById('shiftTime').textContent = '08:30-16:30';
            
            // Update pending applications count periodically
            setInterval(() => {
                const pendingCount = Math.floor(Math.random() * 15) + 3;
                document.getElementById('pendingApps').textContent = pendingCount;
                document.getElementById('statusPendingApps').textContent = pendingCount;
            }, 20000);
        };
        
        // Add notification simulation
        setInterval(() => {
            const notifications = [
                'New loan application received',
                'Credit check completed',
                'Risk assessment updated',
                'Payment received for active loan'
            ];
            const randomNotification = notifications[Math.floor(Math.random() * notifications.length)];
            console.log('[' + new Date().toLocaleTimeString() + '] ' + randomNotification);
        }, 15000);
    </script>
</body>
</html>
