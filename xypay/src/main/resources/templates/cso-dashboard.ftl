<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay CSO Workstation - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Customer Service Officer Workstation - Service Management Interface</span>
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
            <span class="menu-item">Service</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Customer</button>
            <button class="toolbar-btn">Search</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Account Opening</button>
            <button class="toolbar-btn">KYC</button>
            <button class="toolbar-btn">Complaints</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">CRM</button>
            <button class="toolbar-btn">Reports</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Print</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">CSO Operations</div>
                
                <div class="tree-node selected" onclick="selectService(this, 'dashboard')">
                    <div class="tree-icon">🏠</div>
                    Dashboard
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'account-opening')">
                    <div class="tree-icon">👤</div>
                    Account Opening
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'kyc')">
                    <div class="tree-icon">🔍</div>
                    KYC Verification
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'complaints')">
                    <div class="tree-icon">📞</div>
                    Customer Complaints
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'crm')">
                    <div class="tree-icon">📊</div>
                    CRM Management
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'registrations')">
                    <div class="tree-icon">📝</div>
                    User Registrations
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Customer Service Operations Center</div>
                <div class="details-content" id="service-content">
                    
                    <!-- Dashboard Content -->
                    <div class="config-section">
                        <div class="config-header">Welcome, Customer Service Officer</div>
                        <div class="config-content">
                            <p>Ready to assist customers with account services and inquiries. Select a service from the left panel.</p>
                            <p><strong>Service Status:</strong> <span style="color: green;">Online</span> | <strong>Queue:</strong> <span id="queueCount">3</span> customers waiting</p>
                        </div>
                    </div>
                    
                    <!-- Quick Service Panel -->
                    <div class="config-section">
                        <div class="config-header">Quick Service Access</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Service</th>
                                    <th>Description</th>
                                    <th>Priority</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <td>👤 Account Opening</td>
                                    <td>Open new customer accounts</td>
                                    <td style="color: orange;">High</td>
                                    <td><button class="java-btn" onclick="selectService(null, 'account-opening')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>🔍 KYC Verification</td>
                                    <td>Verify customer identity documents</td>
                                    <td style="color: red;">Urgent</td>
                                    <td><button class="java-btn" onclick="selectService(null, 'kyc')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>📞 Customer Complaints</td>
                                    <td>Handle customer service issues</td>
                                    <td style="color: green;">Normal</td>
                                    <td><button class="java-btn" onclick="selectService(null, 'complaints')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>📊 CRM Management</td>
                                    <td>Manage customer relationships</td>
                                    <td style="color: green;">Normal</td>
                                    <td><button class="java-btn" onclick="selectService(null, 'crm')">Start</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Recent Activities -->
                    <div class="config-section">
                        <div class="config-header">Recent Customer Activities</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Time</th>
                                    <th>Customer</th>
                                    <th>Service</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                </tr>
                                <tr>
                                    <td id="activity1Time">--:--</td>
                                    <td>John Doe</td>
                                    <td>Account Opening</td>
                                    <td style="color: green;">Completed</td>
                                    <td>High</td>
                                </tr>
                                <tr>
                                    <td id="activity2Time">--:--</td>
                                    <td>Jane Smith</td>
                                    <td>KYC Verification</td>
                                    <td style="color: orange;">In Progress</td>
                                    <td>Urgent</td>
                                </tr>
                                <tr>
                                    <td id="activity3Time">--:--</td>
                                    <td>Bob Johnson</td>
                                    <td>Complaint Resolution</td>
                                    <td style="color: green;">Resolved</td>
                                    <td>Normal</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>CSO Station Ready | Queue: <span id="statusQueueCount">3</span> customers</span>
            <span>CSO: <span id="csoName">cso@xypay.com</span> | Shift: <span id="shiftTime">09:00-17:00</span></span>
        </div>
    </div>
    
    <script>
        function selectService(element, serviceType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load service content
            const content = document.getElementById('service-content');
            
            switch(serviceType) {
                case 'account-opening':
                    content.innerHTML = getAccountOpeningContent();
                    break;
                case 'kyc':
                    content.innerHTML = getKYCContent();
                    break;
                case 'complaints':
                    content.innerHTML = getComplaintsContent();
                    break;
                case 'crm':
                    content.innerHTML = getCRMContent();
                    break;
                case 'registrations':
                    content.innerHTML = getRegistrationsContent();
                    break;
                default:
                    // Keep dashboard content
                    break;
            }
        }
        
        function getAccountOpeningContent() {
            return `
                <div class="config-section">
                    <div class="config-header">New Account Opening</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Customer Type:</span>
                            <select class="form-select">
                                <option>Individual</option>
                                <option>Business</option>
                                <option>Corporate</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Full Name:</span>
                            <input type="text" class="form-input" placeholder="Enter customer full name">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Phone Number:</span>
                            <input type="tel" class="form-input" placeholder="+234-xxx-xxx-xxxx">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Email Address:</span>
                            <input type="email" class="form-input" placeholder="customer@email.com">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Account Type:</span>
                            <select class="form-select">
                                <option>Savings Account</option>
                                <option>Current Account</option>
                                <option>Fixed Deposit</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Create Account</button>
                            <button class="java-btn">Validate Info</button>
                            <button class="java-btn">Clear Form</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getKYCContent() {
            return `
                <div class="config-section">
                    <div class="config-header">KYC Document Verification</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Customer ID:</span>
                            <input type="text" class="form-input" placeholder="Enter customer ID">
                            <button class="java-btn">Load Customer</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Document Type:</span>
                            <select class="form-select">
                                <option>National ID Card</option>
                                <option>Driver's License</option>
                                <option>International Passport</option>
                                <option>Voter's Card</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Document Number:</span>
                            <input type="text" class="form-input" placeholder="Enter document number">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Verification Status:</span>
                            <select class="form-select">
                                <option>Pending</option>
                                <option>Verified</option>
                                <option>Rejected</option>
                                <option>Requires Review</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Verify Document</button>
                            <button class="java-btn">Upload Scan</button>
                            <button class="java-btn">Reject</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getComplaintsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Complaint Management</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Complaint ID:</span>
                            <input type="text" class="form-input" placeholder="Auto-generated" readonly>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Customer Account:</span>
                            <input type="text" class="form-input" placeholder="Enter account number">
                            <button class="java-btn">Verify</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Complaint Type:</span>
                            <select class="form-select">
                                <option>Transaction Issue</option>
                                <option>Account Access</option>
                                <option>Service Quality</option>
                                <option>Technical Problem</option>
                                <option>Other</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Priority Level:</span>
                            <select class="form-select">
                                <option>Low</option>
                                <option>Medium</option>
                                <option>High</option>
                                <option>Critical</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Description:</span>
                            <textarea class="form-input" rows="3" placeholder="Enter complaint details"></textarea>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Log Complaint</button>
                            <button class="java-btn">Escalate</button>
                            <button class="java-btn">Clear</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getCRMContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Relationship Management</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Search Customer:</span>
                            <input type="text" class="form-input" placeholder="Name, phone, or account">
                            <button class="java-btn primary">Search</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Account</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Last Contact</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <td>****1234</td>
                                <td>John Doe</td>
                                <td>+234-xxx-xxxx</td>
                                <td>2024-01-15</td>
                                <td style="color: green;">Active</td>
                                <td><button class="java-btn">View Profile</button></td>
                            </tr>
                            <tr>
                                <td>****5678</td>
                                <td>Jane Smith</td>
                                <td>+234-yyy-yyyy</td>
                                <td>2024-01-14</td>
                                <td style="color: orange;">Pending KYC</td>
                                <td><button class="java-btn">Update KYC</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn">Add Note</button>
                            <button class="java-btn">Schedule Follow-up</button>
                            <button class="java-btn">Export List</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRegistrationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">User Registration Management</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Registration ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <tr>
                                <td>REG001234</td>
                                <td>Alice Johnson</td>
                                <td>+234-111-1111</td>
                                <td>2024-01-15</td>
                                <td style="color: orange;">Pending Approval</td>
                                <td><button class="java-btn">Review</button></td>
                            </tr>
                            <tr>
                                <td>REG001235</td>
                                <td>Bob Wilson</td>
                                <td>+234-222-2222</td>
                                <td>2024-01-14</td>
                                <td style="color: green;">Approved</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                            <tr>
                                <td>REG001236</td>
                                <td>Carol Brown</td>
                                <td>+234-333-3333</td>
                                <td>2024-01-13</td>
                                <td style="color: red;">Rejected</td>
                                <td><button class="java-btn">Review Rejection</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Approve Selected</button>
                            <button class="java-btn">Bulk Review</button>
                            <button class="java-btn">Export Report</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize dashboard
        window.onload = function() {
            // Set current time for recent activities
            const now = new Date();
            document.getElementById('activity1Time').textContent = new Date(now.getTime() - 300000).toLocaleTimeString();
            document.getElementById('activity2Time').textContent = new Date(now.getTime() - 600000).toLocaleTimeString();
            document.getElementById('activity3Time').textContent = new Date(now.getTime() - 900000).toLocaleTimeString();
            
            // Set CSO info
            document.getElementById('csoName').textContent = 'cso@xypay.com';
            document.getElementById('shiftTime').textContent = '09:00-17:00';
            
            // Update queue count periodically
            setInterval(() => {
                const queueCount = Math.floor(Math.random() * 10) + 1;
                document.getElementById('queueCount').textContent = queueCount;
                document.getElementById('statusQueueCount').textContent = queueCount;
            }, 15000);
        };
        
        // Add notification simulation
        setInterval(() => {
            const notifications = [
                'New customer inquiry received',
                'KYC document uploaded for review',
                'Complaint resolved successfully',
                'Account opening request submitted'
            ];
            const randomNotification = notifications[Math.floor(Math.random() * notifications.length)];
            console.log('[' + new Date().toLocaleTimeString() + '] ' + randomNotification);
        }, 12000);
    </script>
</body>
</html>
