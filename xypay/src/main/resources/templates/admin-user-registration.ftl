<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Monitor - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .stats-card { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; margin-bottom: 24px; }
        .stats-number { font-size: 2.5rem; font-weight: 700; color: #2d3748; }
        .stats-label { color: #4a5568; font-size: 0.9rem; }
        .registration-table { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; }
        .status-badge { padding: 4px 12px; border-radius: 20px; font-size: 0.8rem; font-weight: 600; }
        .status-pending { background: #fef3c7; color: #92400e; }
        .status-verified { background: #d1fae5; color: #065f46; }
        .status-incomplete { background: #fee2e2; color: #991b1b; }
        .action-btn { padding: 4px 12px; font-size: 0.8rem; }
    </style>
</head>
<body>
    <main class="container py-4">
        <div class="dashboard-header">
            <h1>User Registration Monitor</h1>
            <p>Monitor and manage user registrations, verifications, and KYC status</p>
        </div>

        <!-- Statistics Cards -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <div class="stats-number text-primary" id="totalRegistrations">0</div>
                    <div class="stats-label">Total Registrations</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <div class="stats-number text-success" id="verifiedUsers">0</div>
                    <div class="stats-label">Verified Users</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <div class="stats-number text-warning" id="pendingVerifications">0</div>
                    <div class="stats-label">Pending Verification</div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card text-center">
                    <div class="stats-number text-info" id="todayRegistrations">0</div>
                    <div class="stats-label">Today's Registrations</div>
                </div>
            </div>
        </div>

        <!-- Registration Charts -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="stats-card">
                    <h5>Registration Trends (Last 30 Days)</h5>
                    <canvas id="registrationTrendsChart"></canvas>
                </div>
            </div>
            <div class="col-md-6">
                <div class="stats-card">
                    <h5>Verification Status Distribution</h5>
                    <canvas id="verificationStatusChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Recent Registrations Table -->
        <div class="registration-table">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5>Recent Registrations</h5>
                <div>
                    <button class="btn btn-outline-primary btn-sm" onclick="refreshData()">
                        <i class="fas fa-sync-alt"></i> Refresh
                    </button>
                    <button class="btn btn-primary btn-sm" onclick="exportData()">
                        <i class="fas fa-download"></i> Export
                    </button>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Account Number</th>
                            <th>Registration Date</th>
                            <th>Email Status</th>
                            <th>Phone Status</th>
                            <th>KYC Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="registrationsTableBody">
                        <!-- Dynamic content will be loaded here -->
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Registration Details Modal -->
        <div class="modal fade" id="registrationModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Registration Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" id="registrationModalBody">
                        <!-- Dynamic content -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="approveUser()">Approve User</button>
                        <button type="button" class="btn btn-warning" onclick="suspendUser()">Suspend User</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Sample data (replace with actual API calls)
        const sampleRegistrations = [
            {
                id: 1,
                username: 'john_doe',
                email: 'john@example.com',
                phone: '+1234567890',
                accountNumber: '1234567890',
                registrationDate: '2024-01-15',
                emailVerified: true,
                phoneVerified: true,
                kycStatus: 'TIER_1'
            },
            {
                id: 2,
                username: 'jane_smith',
                email: 'jane@example.com',
                phone: '+1987654321',
                accountNumber: '1987654321',
                registrationDate: '2024-01-14',
                emailVerified: false,
                phoneVerified: true,
                kycStatus: 'PENDING'
            },
            {
                id: 3,
                username: 'bob_wilson',
                email: 'bob@example.com',
                phone: '+1122334455',
                accountNumber: '1122334455',
                registrationDate: '2024-01-13',
                emailVerified: true,
                phoneVerified: false,
                kycStatus: 'INCOMPLETE'
            }
        ];

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            loadStatistics();
            loadRegistrationsTable();
            initializeCharts();
        });

        function loadStatistics() {
            // Simulate API call for statistics
            document.getElementById('totalRegistrations').textContent = '1,247';
            document.getElementById('verifiedUsers').textContent = '892';
            document.getElementById('pendingVerifications').textContent = '234';
            document.getElementById('todayRegistrations').textContent = '23';
        }

        function loadRegistrationsTable() {
            const tbody = document.getElementById('registrationsTableBody');
            tbody.innerHTML = '';

            sampleRegistrations.forEach(reg => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${reg.username}</td>
                    <td>${reg.email}</td>
                    <td>${reg.phone}</td>
                    <td>${reg.accountNumber}</td>
                    <td>${reg.registrationDate}</td>
                    <td><span class="status-badge ${reg.emailVerified ? 'status-verified' : 'status-pending'}">${reg.emailVerified ? 'Verified' : 'Pending'}</span></td>
                    <td><span class="status-badge ${reg.phoneVerified ? 'status-verified' : 'status-pending'}">${reg.phoneVerified ? 'Verified' : 'Pending'}</span></td>
                    <td><span class="status-badge ${getKycStatusClass(reg.kycStatus)}">${reg.kycStatus}</span></td>
                    <td>
                        <button class="btn btn-outline-primary action-btn" onclick="viewDetails(${reg.id})">View</button>
                        <button class="btn btn-outline-success action-btn" onclick="resendVerification(${reg.id})">Resend</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
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

        function initializeCharts() {
            // Registration Trends Chart
            const trendsCtx = document.getElementById('registrationTrendsChart').getContext('2d');
            new Chart(trendsCtx, {
                type: 'line',
                data: {
                    labels: [...Array(30).keys()].map(d => {
                        const date = new Date();
                        date.setDate(date.getDate() - (29 - d));
                        return date.toLocaleDateString('en-US', {month: 'short', day: 'numeric'});
                    }),
                    datasets: [{
                        label: 'Registrations',
                        data: Array.from({length: 30}, () => Math.floor(Math.random() * 20) + 5),
                        borderColor: '#3b82f6',
                        backgroundColor: 'rgba(59, 130, 246, 0.1)',
                        fill: true
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            });

            // Verification Status Chart
            const statusCtx = document.getElementById('verificationStatusChart').getContext('2d');
            new Chart(statusCtx, {
                type: 'doughnut',
                data: {
                    labels: ['Fully Verified', 'Email Pending', 'Phone Pending', 'Both Pending'],
                    datasets: [{
                        data: [65, 15, 12, 8],
                        backgroundColor: ['#10b981', '#f59e0b', '#ef4444', '#6b7280']
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'bottom'
                        }
                    }
                }
            });
        }

        function viewDetails(userId) {
            const user = sampleRegistrations.find(u => u.id === userId);
            if (user) {
                document.getElementById('registrationModalBody').innerHTML = `
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Basic Information</h6>
                            <p><strong>Username:</strong> ${user.username}</p>
                            <p><strong>Email:</strong> ${user.email}</p>
                            <p><strong>Phone:</strong> ${user.phone}</p>
                            <p><strong>Account Number:</strong> ${user.accountNumber}</p>
                        </div>
                        <div class="col-md-6">
                            <h6>Verification Status</h6>
                            <p><strong>Email Verified:</strong> ${user.emailVerified ? 'Yes' : 'No'}</p>
                            <p><strong>Phone Verified:</strong> ${user.phoneVerified ? 'Yes' : 'No'}</p>
                            <p><strong>KYC Status:</strong> ${user.kycStatus}</p>
                            <p><strong>Registration Date:</strong> ${user.registrationDate}</p>
                        </div>
                    </div>
                `;
                new bootstrap.Modal(document.getElementById('registrationModal')).show();
            }
        }

        function refreshData() {
            loadStatistics();
            loadRegistrationsTable();
        }

        function exportData() {
            alert('Exporting registration data... (Demo)');
        }

        function resendVerification(userId) {
            alert(`Resending verification for user ${userId}... (Demo)`);
        }

        function approveUser() {
            alert('User approved! (Demo)');
        }

        function suspendUser() {
            alert('User suspended! (Demo)');
        }
    </script>
</body>
</html>
