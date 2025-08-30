<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Monitor - CSO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .stats-card { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; margin-bottom: 24px; }
        .stats-number { font-size: 2rem; font-weight: 700; color: #2d3748; }
        .stats-label { color: #4a5568; font-size: 0.9rem; }
        .registration-table { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; }
        .status-badge { padding: 4px 12px; border-radius: 20px; font-size: 0.8rem; font-weight: 600; }
        .status-pending { background: #fef3c7; color: #92400e; }
        .status-verified { background: #d1fae5; color: #065f46; }
        .status-incomplete { background: #fee2e2; color: #991b1b; }
        .action-btn { padding: 4px 12px; font-size: 0.8rem; }
        .priority-high { border-left: 4px solid #ef4444; }
        .priority-medium { border-left: 4px solid #f59e0b; }
        .priority-low { border-left: 4px solid #10b981; }
    </style>
</head>
<body>
    <main class="container py-4">
        <div class="dashboard-header">
            <h1>Registration Monitor - CSO</h1>
            <p>Assist customers with registration issues and verification support</p>
        </div>

        <!-- Quick Stats -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-number text-warning" id="pendingSupport">0</div>
                    <div class="stats-label">Pending Support</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-number text-success" id="resolvedToday">0</div>
                    <div class="stats-label">Resolved Today</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="stats-card text-center">
                    <div class="stats-number text-info" id="newRegistrations">0</div>
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
