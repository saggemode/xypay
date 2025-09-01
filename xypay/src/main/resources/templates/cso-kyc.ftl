<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay KYC Verification Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay KYC Verification Console - Customer Service Interface</span>
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
            <span class="menu-item">KYC</span>
            <span class="menu-item">Documents</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New KYC</button>
            <button class="toolbar-btn">Search Customer</button>
            <button class="toolbar-btn">Upload Document</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Verify</button>
            <button class="toolbar-btn">Approve</button>
            <button class="toolbar-btn">Reject</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Print</button>
            <button class="toolbar-btn">Export</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">KYC Operations</div>
                
                <div class="tree-node selected" onclick="selectKYCModule(this, 'verification')">
                    <div class="tree-icon">✅</div>
                    KYC Verification
                </div>
                
                <div class="tree-node" onclick="selectKYCModule(this, 'pending')">
                    <div class="tree-icon">⏳</div>
                    Pending Reviews
                </div>
                
                <div class="tree-node" onclick="selectKYCModule(this, 'approved')">
                    <div class="tree-icon">✔️</div>
                    Approved KYCs
                </div>
                
                <div class="tree-node" onclick="selectKYCModule(this, 'rejected')">
                    <div class="tree-icon">❌</div>
                    Rejected KYCs
                </div>
                
                <div class="tree-node" onclick="selectKYCModule(this, 'documents')">
                    <div class="tree-icon">📄</div>
                    Document Types
                </div>
                
                <div class="tree-node" onclick="selectKYCModule(this, 'reports')">
                    <div class="tree-icon">📊</div>
                    KYC Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">KYC Verification Console</div>
                <div class="details-content" id="kyc-content">
                    
                    <!-- KYC Verification Form -->
                    <div class="config-section">
                        <div class="config-header">Customer KYC Verification</div>
                        <div class="config-content">
                            <form action="/cso/kyc" method="post" enctype="multipart/form-data">
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
                                
                                <div class="form-row">
                                    <span class="form-label">Document Type:</span>
                                    <select class="form-select" id="documentType" name="documentType" required>
                                        <option value="">Select Document Type</option>
                                        <option value="NIN">National ID Number (NIN)</option>
                                        <option value="BVN">Bank Verification Number (BVN)</option>
                                        <option value="PASSPORT">International Passport</option>
                                        <option value="DRIVERS_LICENSE">Driver's License</option>
                                        <option value="VOTERS_CARD">Voter's Registration Card</option>
                                    </select>
                                </div>
                                
                                <div class="form-row">
                                    <span class="form-label">Document Number:</span>
                                    <input type="text" class="form-input" id="documentNumber" name="documentNumber" required>
                                </div>
                                
                                <div class="form-row">
                                    <span class="form-label">KYC Document:</span>
                                    <input type="file" class="form-input" id="kycDocument" name="kycDocument" accept=".pdf,.jpg,.jpeg,.png" required>
                                </div>
                                
                                <div class="form-row">
                                    <span class="form-label">Additional Notes:</span>
                                    <textarea class="form-input" id="notes" name="notes" rows="3" placeholder="Enter any additional verification notes"></textarea>
                                </div>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="submit" class="java-btn primary">Verify KYC</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                    <button type="button" class="java-btn" onclick="saveAsDraft()">Save as Draft</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <!-- Verification Result -->
                    <#if result??>
                    <div class="config-section">
                        <div class="config-header">Verification Result</div>
                        <div class="config-content">
                            <div class="alert-info" style="padding: 12px; background: #e6f3ff; border: 1px inset #c0c0c0; margin-top: 16px;">
                                ${result}
                            </div>
                        </div>
                    </div>
                    </#if>
                    
                    <!-- Recent KYC Activities -->
                    <div class="config-section">
                        <div class="config-header">Recent KYC Activities</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Customer</th>
                                    <th>Document Type</th>
                                    <th>Status</th>
                                    <th>Submitted</th>
                                    <th>Actions</th>
                                </tr>
                                <tr>
                                    <td>John Doe</td>
                                    <td>NIN</td>
                                    <td style="color: green;">Verified</td>
                                    <td>2024-01-15 10:30</td>
                                    <td><button class="java-btn">View</button></td>
                                </tr>
                                <tr>
                                    <td>Jane Smith</td>
                                    <td>BVN</td>
                                    <td style="color: orange;">Pending</td>
                                    <td>2024-01-15 09:45</td>
                                    <td><button class="java-btn">Review</button></td>
                                </tr>
                                <tr>
                                    <td>Michael Johnson</td>
                                    <td>Passport</td>
                                    <td style="color: red;">Rejected</td>
                                    <td>2024-01-14 16:20</td>
                                    <td><button class="java-btn">Details</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>KYC Console Ready | Pending Reviews: <span id="pendingCount">12</span> | Verified Today: <span id="verifiedToday">8</span></span>
            <span>CSO: cso@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectKYCModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('kyc-content');
            
            switch(moduleType) {
                case 'pending':
                    content.innerHTML = getPendingKYCContent();
                    break;
                case 'approved':
                    content.innerHTML = getApprovedKYCContent();
                    break;
                case 'rejected':
                    content.innerHTML = getRejectedKYCContent();
                    break;
                case 'documents':
                    content.innerHTML = getDocumentTypesContent();
                    break;
                case 'reports':
                    content.innerHTML = getKYCReportsContent();
                    break;
                default:
                    // Keep default verification content
                    break;
            }
        }
        
        function getPendingKYCContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Pending KYC Reviews</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Customer Name</th>
                                <th>Document Type</th>
                                <th>Submitted Date</th>
                                <th>Priority</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>Jane Smith</td>
                                <td>BVN</td>
                                <td>2024-01-15 09:45</td>
                                <td style="color: orange;">High</td>
                                <td>
                                    <button class="java-btn primary">Review</button>
                                    <button class="java-btn">View Document</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Robert Brown</td>
                                <td>NIN</td>
                                <td>2024-01-15 08:30</td>
                                <td style="color: green;">Normal</td>
                                <td>
                                    <button class="java-btn primary">Review</button>
                                    <button class="java-btn">View Document</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getApprovedKYCContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Approved KYC Records</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Customer Name</th>
                                <th>Document Type</th>
                                <th>Approved Date</th>
                                <th>Approved By</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>John Doe</td>
                                <td>NIN</td>
                                <td>2024-01-15 10:30</td>
                                <td>cso@xypay.com</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                            <tr>
                                <td>Alice Wilson</td>
                                <td>BVN</td>
                                <td>2024-01-14 14:15</td>
                                <td>cso@xypay.com</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getRejectedKYCContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Rejected KYC Records</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Customer Name</th>
                                <th>Document Type</th>
                                <th>Rejected Date</th>
                                <th>Reason</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>Michael Johnson</td>
                                <td>Passport</td>
                                <td>2024-01-14 16:20</td>
                                <td>Document unclear</td>
                                <td>
                                    <button class="java-btn">View Details</button>
                                    <button class="java-btn">Request Resubmission</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getDocumentTypesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Accepted Document Types</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Document Type</th>
                                <th>Code</th>
                                <th>Verification Method</th>
                                <th>Processing Time</th>
                                <th>Status</th>
                            </tr>
                            <tr>
                                <td>National ID Number</td>
                                <td>NIN</td>
                                <td>NIMC API</td>
                                <td>Instant</td>
                                <td style="color: green;">Active</td>
                            </tr>
                            <tr>
                                <td>Bank Verification Number</td>
                                <td>BVN</td>
                                <td>CBN API</td>
                                <td>Instant</td>
                                <td style="color: green;">Active</td>
                            </tr>
                            <tr>
                                <td>International Passport</td>
                                <td>PASSPORT</td>
                                <td>Manual Review</td>
                                <td>24 hours</td>
                                <td style="color: green;">Active</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getKYCReportsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">KYC Reports</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Daily KYC Summary</option>
                                <option>Pending KYC Report</option>
                                <option>Rejection Analysis</option>
                                <option>Document Type Statistics</option>
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
        
        function searchCustomer() {
            const customerId = document.getElementById('customerId').value;
            if (customerId) {
                alert('Searching for customer: ' + customerId);
                // Simulate customer data loading
                document.getElementById('customerName').value = 'John Doe';
                document.getElementById('phoneNumber').value = '+234-xxx-xxxx';
                document.getElementById('emailAddress').value = 'john.doe@email.com';
            }
        }
        
        function clearForm() {
            document.getElementById('customerId').value = '';
            document.getElementById('customerName').value = '';
            document.getElementById('phoneNumber').value = '';
            document.getElementById('emailAddress').value = '';
            document.getElementById('documentType').value = '';
            document.getElementById('documentNumber').value = '';
            document.getElementById('kycDocument').value = '';
            document.getElementById('notes').value = '';
        }
        
        function saveAsDraft() {
            alert('KYC form saved as draft');
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('pendingCount').textContent = '12';
            document.getElementById('verifiedToday').textContent = '8';
        };
    </script>
</body>
</html>
