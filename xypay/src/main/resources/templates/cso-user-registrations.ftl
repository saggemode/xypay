<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay User Registration Monitor Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay User Registration Monitor Console - CSO Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Registration</span>
            <span class="menu-item">Verification</span>
            <span class="menu-item">Support</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Registration</button>
            <button class="toolbar-btn">Search User</button>
            <button class="toolbar-btn">Verify KYC</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Approve</button>
            <button class="toolbar-btn">Reject</button>
            <button class="toolbar-btn">Request Info</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Reports</button>
            <button class="toolbar-btn">Export</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Registration Monitor</div>
                
                <div class="tree-node selected" onclick="selectRegistrationModule(this, 'dashboard')">
                    <div class="tree-icon">📊</div>
                    Registration Dashboard
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'pending')">
                    <div class="tree-icon">⏳</div>
                    Pending Registrations
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'verification')">
                    <div class="tree-icon">🔍</div>
                    KYC Verification
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'approved')">
                    <div class="tree-icon">✅</div>
                    Approved Users
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'rejected')">
                    <div class="tree-icon">❌</div>
                    Rejected Applications
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'support')">
                    <div class="tree-icon">🎧</div>
                    Support Requests
                </div>
                
                <div class="tree-node" onclick="selectRegistrationModule(this, 'reports')">
                    <div class="tree-icon">📈</div>
                    Registration Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">User Registration Monitoring</div>
                <div class="details-content" id="registration-content">
                    
                    <!-- Registration Dashboard -->
                    <div class="config-section">
                        <div class="config-header">Registration Dashboard Overview</div>
                        <div class="config-content">
                            
                            <!-- Key Metrics -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Registration Statistics</legend>
                                
                                <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px;">
                                    <div class="metric-card">
                                        <div class="metric-value" id="pendingSupport">24</div>
                                        <div class="metric-label">Pending Support</div>
                                        <div class="metric-change" style="color: orange;">+3 today</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value" id="resolvedToday">18</div>
                                        <div class="metric-label">Resolved Today</div>
                                        <div class="metric-change" style="color: green;">+12%</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value" id="newRegistrations">67</div>
                                        <div class="metric-label">New Registrations</div>
                                        <div class="metric-change" style="color: green;">+8.5%</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value">92.3%</div>
                                        <div class="metric-label">Success Rate</div>
                                        <div class="metric-change" style="color: green;">+2.1%</div>
                                    </div>
                                </div>
                            </fieldset>
                            
                            <!-- Recent Registration Activities -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Recent Registration Activities</legend>
                                
                                <table class="java-table">
                                    <tr>
                                        <th>Time</th>
                                        <th>User</th>
                                        <th>Phone</th>
                                        <th>Registration Step</th>
                                        <th>Status</th>
                                        <th>Priority</th>
                                        <th>Actions</th>
                                    </tr>
                                    <tr>
                                        <td>11:45 AM</td>
                                        <td>John Doe</td>
                                        <td>+234-xxx-1234</td>
                                        <td>KYC Verification</td>
                                        <td style="color: orange;">Pending</td>
                                        <td style="color: red;">High</td>
                                        <td>
                                            <button class="java-btn primary">Review</button>
                                            <button class="java-btn">Contact</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:30 AM</td>
                                        <td>Jane Smith</td>
                                        <td>+234-xxx-5678</td>
                                        <td>Document Upload</td>
                                        <td style="color: blue;">In Progress</td>
                                        <td style="color: orange;">Medium</td>
                                        <td>
                                            <button class="java-btn">Assist</button>
                                            <button class="java-btn">View</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:15 AM</td>
                                        <td>Mike Johnson</td>
                                        <td>+234-xxx-9012</td>
                                        <td>Phone Verification</td>
                                        <td style="color: green;">Completed</td>
                                        <td style="color: green;">Low</td>
                                        <td>
                                            <button class="java-btn">View Details</button>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                            
                            <!-- Quick Actions -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Quick Actions</legend>
                                
                                <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px;">
                                    <button class="java-btn primary" onclick="assistRegistration()">Assist Registration</button>
                                    <button class="java-btn" onclick="verifyKYC()">Verify KYC Documents</button>
                                    <button class="java-btn" onclick="resendOTP()">Resend OTP</button>
                                    <button class="java-btn" onclick="unlockAccount()">Unlock Account</button>
                                    <button class="java-btn" onclick="generateReport()">Generate Report</button>
                                    <button class="java-btn" onclick="bulkApproval()">Bulk Approval</button>
                                </div>
                            </fieldset>
                            
                            <!-- Support Queue -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Support Queue</legend>
                                
                                <div class="support-queue">
                                    <div class="support-item priority-high">
                                        <div class="support-user">Sarah Wilson - +234-xxx-3456</div>
                                        <div class="support-issue">Unable to upload ID document - File size error</div>
                                        <div class="support-time">Waiting: 15 minutes</div>
                                        <div class="support-actions">
                                            <button class="java-btn primary">Take Call</button>
                                            <button class="java-btn">Send Instructions</button>
                                        </div>
                                    </div>
                                    
                                    <div class="support-item priority-medium">
                                        <div class="support-user">Robert Brown - +234-xxx-7890</div>
                                        <div class="support-issue">OTP not received for phone verification</div>
                                        <div class="support-time">Waiting: 8 minutes</div>
                                        <div class="support-actions">
                                            <button class="java-btn primary">Resend OTP</button>
                                            <button class="java-btn">Call Customer</button>
                                        </div>
                                    </div>
                                    
                                    <div class="support-item priority-low">
                                        <div class="support-user">Lisa Davis - +234-xxx-2468</div>
                                        <div class="support-issue">Question about account features</div>
                                        <div class="support-time">Waiting: 3 minutes</div>
                                        <div class="support-actions">
                                            <button class="java-btn">Send Info</button>
                                            <button class="java-btn">Schedule Call</button>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Registration Monitor Ready | Pending Support: <span id="statusPendingSupport">24</span> | Active Sessions: <span id="activeSessions">12</span></span>
            <span>CSO: cso@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectRegistrationModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('registration-content');
            
            switch(moduleType) {
                case 'pending':
                    content.innerHTML = getPendingRegistrationsContent();
                    break;
                case 'verification':
                    content.innerHTML = getKYCVerificationContent();
                    break;
                case 'approved':
                    content.innerHTML = getApprovedUsersContent();
                    break;
                case 'rejected':
                    content.innerHTML = getRejectedApplicationsContent();
                    break;
                case 'support':
                    content.innerHTML = getSupportRequestsContent();
                    break;
                case 'reports':
                    content.innerHTML = getRegistrationReportsContent();
                    break;
                default:
                    // Keep default dashboard
                    break;
            }
        }
        
        function assistRegistration() {
            alert('Opening registration assistance interface...');
        }
        
        function verifyKYC() {
            alert('Opening KYC verification panel...');
        }
        
        function resendOTP() {
            alert('Resending OTP to selected user...');
        }
        
        function unlockAccount() {
            alert('Opening account unlock interface...');
        }
        
        function generateReport() {
            alert('Opening report generator...');
        }
        
        function bulkApproval() {
            alert('Opening bulk approval interface...');
        }
        
        function getPendingRegistrationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Pending User Registrations</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Filter by Status:</span>
                            <select class="form-select" style="width: 200px;">
                                <option>All Pending</option>
                                <option>KYC Verification</option>
                                <option>Document Upload</option>
                                <option>Phone Verification</option>
                                <option>Email Verification</option>
                            </select>
                            <button class="java-btn">Filter</button>
                            <button class="java-btn primary">Bulk Actions</button>
                        </div>
                        
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th><input type="checkbox"></th>
                                <th>Registration ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Current Step</th>
                                <th>Started</th>
                                <th>Priority</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>REG001234</td>
                                <td>John Doe</td>
                                <td>+234-xxx-1234</td>
                                <td>john.doe@email.com</td>
                                <td>KYC Verification</td>
                                <td>2024-01-15 10:30</td>
                                <td style="color: red;">High</td>
                                <td>
                                    <button class="java-btn primary">Review</button>
                                    <button class="java-btn">Contact</button>
                                    <button class="java-btn">Approve</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getKYCVerificationContent() {
            return `
                <div class="config-section">
                    <div class="config-header">KYC Document Verification</div>
                    <div class="config-content">
                        <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                            <legend style="font-weight: bold; font-size: 12px;">Document Review Queue</legend>
                            
                            <table class="java-table">
                                <tr>
                                    <th>User</th>
                                    <th>Document Type</th>
                                    <th>Uploaded</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                <tr>
                                    <td>Jane Smith</td>
                                    <td>National ID</td>
                                    <td>2024-01-15 11:30</td>
                                    <td style="color: orange;">Pending Review</td>
                                    <td>
                                        <button class="java-btn primary">Review</button>
                                        <button class="java-btn">Download</button>
                                        <button class="java-btn">Approve</button>
                                        <button class="java-btn">Reject</button>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </div>
                </div>
            `;
        }
        
        function getApprovedUsersContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Recently Approved Users</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Account Number</th>
                                <th>Approved Date</th>
                                <th>CSO</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>USR001234</td>
                                <td>Mike Johnson</td>
                                <td>+234-xxx-9012</td>
                                <td>1234567890</td>
                                <td>2024-01-15 11:15</td>
                                <td>Sarah M.</td>
                                <td><button class="java-btn">View Profile</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getRejectedApplicationsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Rejected Registration Applications</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Registration ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Rejection Reason</th>
                                <th>Rejected Date</th>
                                <th>CSO</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>REG001235</td>
                                <td>Bob Wilson</td>
                                <td>+234-xxx-3456</td>
                                <td>Invalid ID Document</td>
                                <td>2024-01-14 15:30</td>
                                <td>Mike R.</td>
                                <td>
                                    <button class="java-btn">View Details</button>
                                    <button class="java-btn">Reconsider</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getSupportRequestsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Registration Support Requests</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Priority Filter:</span>
                            <select class="form-select" style="width: 150px;">
                                <option>All Priorities</option>
                                <option>High Priority</option>
                                <option>Medium Priority</option>
                                <option>Low Priority</option>
                            </select>
                            <button class="java-btn">Filter</button>
                        </div>
                        
                        <div class="support-queue" style="margin-top: 16px;">
                            <div class="support-item priority-high">
                                <div class="support-user">Sarah Wilson - +234-xxx-3456</div>
                                <div class="support-issue">Unable to upload ID document - File size error</div>
                                <div class="support-time">Waiting: 15 minutes</div>
                                <div class="support-actions">
                                    <button class="java-btn primary">Take Call</button>
                                    <button class="java-btn">Send Instructions</button>
                                    <button class="java-btn">Escalate</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRegistrationReportsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Registration Reports & Analytics</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Daily Registration Summary</option>
                                <option>KYC Approval Rates</option>
                                <option>Support Response Times</option>
                                <option>Registration Funnel Analysis</option>
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
                            <button class="java-btn">Schedule Report</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('statusPendingSupport').textContent = '24';
            document.getElementById('activeSessions').textContent = '12';
        };
    </script>
    
    <style>
        .metric-card {
            background: #f0f0f0;
            border: 1px inset #c0c0c0;
            padding: 12px;
            text-align: center;
        }
        
        .metric-value {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        
        .metric-label {
            font-size: 11px;
            color: #666;
            margin-top: 4px;
        }
        
        .metric-change {
            font-size: 10px;
            font-weight: bold;
            margin-top: 2px;
        }
        
        .support-queue {
            max-height: 400px;
            overflow-y: auto;
        }
        
        .support-item {
            border: 1px inset #c0c0c0;
            padding: 12px;
            margin-bottom: 8px;
            font-size: 11px;
        }
        
        .priority-high {
            border-left: 4px solid #ef4444;
        }
        
        .priority-medium {
            border-left: 4px solid #f59e0b;
        }
        
        .priority-low {
            border-left: 4px solid #10b981;
        }
        
        .support-user {
            font-weight: bold;
            color: #333;
            margin-bottom: 4px;
        }
        
        .support-issue {
            color: #666;
            margin-bottom: 4px;
        }
        
        .support-time {
            color: #999;
            font-size: 10px;
            margin-bottom: 8px;
        }
        
        .support-actions button {
            margin-right: 4px;
            margin-bottom: 4px;
        }
    </style>
</body>
</html>
                    <div class="stats-label">New Registrations</div>
                </div>
            </div>
        </div>

        <!-- Support Queue -->
        <div class="registration-table mb-4">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5>Registration Support Queue</h5>
                <div>
                    <button class="btn btn-outline-primary btn-sm" onclick="refreshQueue()">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                    <button class="btn btn-success btn-sm" onclick="markAllResolved()">
                        <i class="fas fa-check-double"></i> Mark All Resolved
                    </button>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Priority</th>
                            <th>Customer</th>
                            <th>Issue Type</th>
                            <th>Account Number</th>
                            <th>Issue Description</th>
                            <th>Time Waiting</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="supportQueueBody">
                        <!-- Dynamic content -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Recent Registrations for Assistance -->
        <div class="registration-table">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5>Recent Registrations Needing Assistance</h5>
                <div>
                    <select class="form-select form-select-sm" style="width: auto;" onchange="filterRegistrations(this.value)">
                        <option value="all">All Status</option>
                        <option value="email_pending">Email Pending</option>
                        <option value="phone_pending">Phone Pending</option>
                        <option value="kyc_incomplete">KYC Incomplete</option>
                    </select>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Customer</th>
                            <th>Contact</th>
                            <th>Account Number</th>
                            <th>Registration Date</th>
                            <th>Email Status</th>
                            <th>Phone Status</th>
                            <th>KYC Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="assistanceTableBody">
                        <!-- Dynamic content -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Customer Support Modal -->
        <div class="modal fade" id="supportModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Customer Support</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="supportModalBody">
                        <!-- Dynamic content -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" onclick="resolveIssue()">Mark Resolved</button>
                        <button type="button" class="btn btn-primary" onclick="escalateIssue()">Escalate</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    <script>
    <#noparse>
        // Sample support queue data
        const supportQueue = [
            {
                id: 1,
                priority: 'high',
                customerName: 'John Doe',
                email: 'john@example.com',
                phone: '+1234567890',
                accountNumber: '1234567890',
                issueType: 'Email Verification',
                description: 'Customer not receiving verification emails',
                waitingTime: '2h 15m'
            },
            {
                id: 2,
                priority: 'medium',
                customerName: 'Jane Smith',
                email: 'jane@example.com',
                phone: '+1987654321',
                accountNumber: '1987654321',
                issueType: 'Phone Verification',
                description: 'OTP not working, customer tried multiple times',
                waitingTime: '45m'
            },
            {
                id: 3,
                priority: 'low',
                customerName: 'Bob Wilson',
                email: 'bob@example.com',
                phone: '+1122334455',
                accountNumber: '1122334455',
                issueType: 'Account Access',
                description: 'Customer forgot username, needs account recovery',
                waitingTime: '1h 30m'
            }
        ];

        // Sample registrations needing assistance
        const assistanceRegistrations = [
            {
                id: 1,
                customerName: 'Alice Johnson',
                email: 'alice@example.com',
                phone: '+1555666777',
                accountNumber: '1555666777',
                registrationDate: '2024-01-15',
                emailVerified: false,
                phoneVerified: true,
                kycStatus: 'PENDING'
            },
            {
                id: 2,
                customerName: 'Charlie Brown',
                email: 'charlie@example.com',
                phone: '+1888999000',
                accountNumber: '1888999000',
                registrationDate: '2024-01-14',
                emailVerified: true,
                phoneVerified: false,
                kycStatus: 'INCOMPLETE'
            }
        ];

        document.addEventListener('DOMContentLoaded', function() {
            loadStats();
            loadSupportQueue();
            loadAssistanceTable();
        });

        function loadStats() {
            document.getElementById('pendingSupport').textContent = supportQueue.length;
            document.getElementById('resolvedToday').textContent = '12';
            document.getElementById('newRegistrations').textContent = '8';
        }

        function loadSupportQueue() {
            const tbody = document.getElementById('supportQueueBody');
            tbody.innerHTML = '';

            supportQueue.forEach(item => {
                const row = document.createElement('tr');
                row.className = `priority-${item.priority}`;
                row.innerHTML = `
                    <td><span class="badge bg-${getPriorityColor(item.priority)}">${item.priority.toUpperCase()}</span></td>
                    <td>
                        <strong>${item.customerName}</strong><br>
                        <small class="text-muted">${item.email}</small>
                    </td>
                    <td>${item.issueType}</td>
                    <td>${item.accountNumber}</td>
                    <td>${item.description}</td>
                    <td><span class="text-warning">${item.waitingTime}</span></td>
                    <td>
                        <button class="btn btn-outline-primary action-btn" onclick="handleSupport(${item.id})">Handle</button>
                        <button class="btn btn-outline-success action-btn" onclick="quickResolve(${item.id})">Quick Fix</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }

        function loadAssistanceTable() {
            const tbody = document.getElementById('assistanceTableBody');
            tbody.innerHTML = '';

            assistanceRegistrations.forEach(reg => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>
                        <strong>${reg.customerName}</strong>
                    </td>
                    <td>
                        <small>${reg.email}</small><br>
                        <small>${reg.phone}</small>
                    </td>
                    <td>${reg.accountNumber}</td>
                    <td>${reg.registrationDate}</td>
                    <td><span class="status-badge ${reg.emailVerified ? 'status-verified' : 'status-pending'}">${reg.emailVerified ? 'Verified' : 'Pending'}</span></td>
                    <td><span class="status-badge ${reg.phoneVerified ? 'status-verified' : 'status-pending'}">${reg.phoneVerified ? 'Verified' : 'Pending'}</span></td>
                    <td><span class="status-badge ${getKycStatusClass(reg.kycStatus)}">${reg.kycStatus}</span></td>
                    <td>
                        <button class="btn btn-outline-primary action-btn" onclick="assistCustomer(${reg.id})">Assist</button>
                        <button class="btn btn-outline-info action-btn" onclick="contactCustomer(${reg.id})">Contact</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }

        function getPriorityColor(priority) {
            switch(priority) {
                case 'high': return 'danger';
                case 'medium': return 'warning';
                case 'low': return 'success';
                default: return 'secondary';
            }
        }

        function getKycStatusClass(status) {
            switch(status) {
                case 'TIER_1':
                case 'TIER_2':
                case 'TIER_3':
                    return 'status-verified';
                case 'PENDING':
                    return 'status-pending';
                default:
                    return 'status-incomplete';
            }
        }

        function handleSupport(issueId) {
            const issue = supportQueue.find(i => i.id === issueId);
            if (issue) {
                document.getElementById('supportModalBody').innerHTML = `
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Customer Information</h6>
                            <p><strong>Name:</strong> ${issue.customerName}</p>
                            <p><strong>Email:</strong> ${issue.email}</p>
                            <p><strong>Phone:</strong> ${issue.phone}</p>
                            <p><strong>Account:</strong> ${issue.accountNumber}</p>
                        </div>
                        <div class="col-md-6">
                            <h6>Issue Details</h6>
                            <p><strong>Type:</strong> ${issue.issueType}</p>
                            <p><strong>Priority:</strong> <span class="badge bg-${getPriorityColor(issue.priority)}">${issue.priority.toUpperCase()}</span></p>
                            <p><strong>Waiting:</strong> ${issue.waitingTime}</p>
                            <p><strong>Description:</strong> ${issue.description}</p>
                        </div>
                    </div>
                    <div class="mt-3">
                        <h6>Quick Actions</h6>
                        <button class="btn btn-outline-primary btn-sm me-2" onclick="resendVerificationEmail('${issue.email}')">Resend Email</button>
                        <button class="btn btn-outline-success btn-sm me-2" onclick="resendOTP('${issue.phone}')">Resend OTP</button>
                        <button class="btn btn-outline-info btn-sm" onclick="resetPassword('${issue.accountNumber}')">Reset Password</button>
                    </div>
                `;
                new bootstrap.Modal(document.getElementById('supportModal')).show();
            }
        }

        function quickResolve(issueId) {
            alert(`Quick resolving issue ${issueId}... (Demo)`);
            // Remove from queue
            const index = supportQueue.findIndex(i => i.id === issueId);
            if (index > -1) {
                supportQueue.splice(index, 1);
                loadSupportQueue();
                loadStats();
            }
        }

        function assistCustomer(customerId) {
            alert(`Opening assistance for customer ${customerId}... (Demo)`);
        }

        function contactCustomer(customerId) {
            alert(`Contacting customer ${customerId}... (Demo)`);
        }

        function refreshQueue() {
            loadSupportQueue();
            loadAssistanceTable();
            loadStats();
        }

        function markAllResolved() {
            if (confirm('Mark all issues as resolved?')) {
                supportQueue.length = 0;
                loadSupportQueue();
                loadStats();
            }
        }

        function filterRegistrations(status) {
            // Filter logic would go here
            alert(`Filtering by: ${status} (Demo)`);
        }

        function resolveIssue() {
            alert('Issue marked as resolved! (Demo)');
        }

        function escalateIssue() {
            alert('Issue escalated to supervisor! (Demo)');
        }

        function resendVerificationEmail(email) {
            alert(`Resending verification email to ${email}... (Demo)`);
        }

        function resendOTP(phone) {
            alert(`Resending OTP to ${phone}... (Demo)`);
        }

        function resetPassword(accountNumber) {
            alert(`Resetting password for account ${accountNumber}... (Demo)`);
        }
    </#noparse>
    </script>
</body>
</html>
