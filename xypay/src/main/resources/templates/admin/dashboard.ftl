<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Admin Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Administrative Console - System Management Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">System</span>
            <span class="menu-item">Users</span>
            <span class="menu-item">Configuration</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New User</button>
            <button class="toolbar-btn">Search</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Customers</button>
            <button class="toolbar-btn">Accounts</button>
            <button class="toolbar-btn">Transactions</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Reports</button>
            <button class="toolbar-btn">Settings</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Backup</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Admin Operations</div>
                
                <div class="tree-node selected" onclick="selectAdminModule(this, 'dashboard')">
                    <div class="tree-icon">🏠</div>
                    Dashboard
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'customers')">
                    <div class="tree-icon">👥</div>
                    Customer Management
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'accounts')">
                    <div class="tree-icon">💼</div>
                    Account Management
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'transactions')">
                    <div class="tree-icon">💸</div>
                    Transaction Monitoring
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'users')">
                    <div class="tree-icon">👤</div>
                    User Administration
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'system')">
                    <div class="tree-icon">⚙️</div>
                    System Configuration
                </div>
                
                <div class="tree-node" onclick="selectAdminModule(this, 'reports')">
                    <div class="tree-icon">📊</div>
                    Reports & Analytics
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Administrative Control Center</div>
                <div class="details-content" id="admin-content">
                    
                    <!-- Dashboard Content -->
                    <div class="config-section">
                        <div class="config-header">System Overview</div>
                        <div class="config-content">
                            <p>Welcome to the XyPay Administrative Console. Monitor system status and manage operations.</p>
                            <p><strong>System Status:</strong> <span style="color: green;">Online</span> | <strong>Active Users:</strong> <span id="activeUsers">247</span></p>
                        </div>
                    </div>
                    
                    <!-- System Statistics -->
                    <div class="config-section">
                        <div class="config-header">System Statistics</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Metric</th>
                                    <th>Current Value</th>
                                    <th>24h Change</th>
                                    <th>Status</th>
                                </tr>
                                <tr>
                                    <td>Total Customers</td>
                                    <td id="totalCustomers">15,247</td>
                                    <td style="color: green;">+23</td>
                                    <td style="color: green;">Normal</td>
                                </tr>
                                <tr>
                                    <td>Active Accounts</td>
                                    <td id="activeAccounts">12,891</td>
                                    <td style="color: green;">+18</td>
                                    <td style="color: green;">Normal</td>
                                </tr>
                                <tr>
                                    <td>Daily Transactions</td>
                                    <td id="dailyTransactions">8,456</td>
                                    <td style="color: orange;">-127</td>
                                    <td style="color: orange;">Monitor</td>
                                </tr>
                                <tr>
                                    <td>System Load</td>
                                    <td id="systemLoad">67%</td>
                                    <td style="color: green;">-3%</td>
                                    <td style="color: green;">Normal</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Quick Actions -->
                    <div class="config-section">
                        <div class="config-header">Quick Administrative Actions</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Action</th>
                                    <th>Description</th>
                                    <th>Priority</th>
                                    <th>Execute</th>
                                </tr>
                                <tr>
                                    <td>👥 User Management</td>
                                    <td>Create, modify, or deactivate user accounts</td>
                                    <td style="color: orange;">High</td>
                                    <td><button class="java-btn" onclick="selectAdminModule(null, 'users')">Manage</button></td>
                                </tr>
                                <tr>
                                    <td>💼 Account Oversight</td>
                                    <td>Monitor and manage customer accounts</td>
                                    <td style="color: green;">Normal</td>
                                    <td><button class="java-btn" onclick="selectAdminModule(null, 'accounts')">View</button></td>
                                </tr>
                                <tr>
                                    <td>⚙️ System Config</td>
                                    <td>Configure system parameters and settings</td>
                                    <td style="color: red;">Critical</td>
                                    <td><button class="java-btn" onclick="selectAdminModule(null, 'system')">Configure</button></td>
                                </tr>
                                <tr>
                                    <td>📊 Generate Reports</td>
                                    <td>Create system and business reports</td>
                                    <td style="color: green;">Normal</td>
                                    <td><button class="java-btn" onclick="selectAdminModule(null, 'reports')">Generate</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Admin Console Ready | Users: <span id="statusActiveUsers">247</span> | Load: <span id="statusSystemLoad">67%</span></span>
            <span>Administrator: <span id="adminName">admin@xypay.com</span> | Session: <span id="sessionTime">Active</span></span>
        </div>
    </div>
    
    <script>
        function selectAdminModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('admin-content');
            
            switch(moduleType) {
                case 'customers':
                    content.innerHTML = getCustomerManagementContent();
                    break;
                case 'accounts':
                    content.innerHTML = getAccountManagementContent();
                    break;
                case 'transactions':
                    content.innerHTML = getTransactionMonitoringContent();
                    break;
                case 'users':
                    content.innerHTML = getUserAdministrationContent();
                    break;
                case 'system':
                    content.innerHTML = getSystemConfigurationContent();
                    break;
                case 'reports':
                    content.innerHTML = getReportsAnalyticsContent();
                    break;
                default:
                    // Keep dashboard content
                    break;
            }
        }
        
        function getCustomerManagementContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Management Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Search Customer:</span>
                            <input type="text" class="form-input" placeholder="Name, phone, email, or ID">
                            <button class="java-btn primary">Search</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Customer ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Accounts</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CUST001234</td>
                                <td>John Doe</td>
                                <td>+234-xxx-xxxx</td>
                                <td style="color: green;">Active</td>
                                <td>2</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                            <tr>
                                <td>CUST001235</td>
                                <td>Jane Smith</td>
                                <td>+234-yyy-yyyy</td>
                                <td style="color: orange;">Pending KYC</td>
                                <td>1</td>
                                <td><button class="java-btn">Complete KYC</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Add New Customer</button>
                            <button class="java-btn">Export Customer List</button>
                            <button class="java-btn">Bulk Operations</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getAccountManagementContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Account Management Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Account Search:</span>
                            <input type="text" class="form-input" placeholder="Account number or customer name">
                            <button class="java-btn primary">Search</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Account Number</th>
                                <th>Customer</th>
                                <th>Type</th>
                                <th>Balance</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>****1234</td>
                                <td>John Doe</td>
                                <td>Savings</td>
                                <td>₦125,000</td>
                                <td style="color: green;">Active</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                            <tr>
                                <td>****5678</td>
                                <td>Jane Smith</td>
                                <td>Current</td>
                                <td>₦45,000</td>
                                <td style="color: orange;">Restricted</td>
                                <td><button class="java-btn">Unrestrict</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Create Account</button>
                            <button class="java-btn">Freeze Account</button>
                            <button class="java-btn">Generate Statement</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getTransactionMonitoringContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Transaction Monitoring Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Filter Transactions:</span>
                            <select class="form-select">
                                <option>All Transactions</option>
                                <option>High Value (>₦100,000)</option>
                                <option>Suspicious Activity</option>
                                <option>Failed Transactions</option>
                            </select>
                            <button class="java-btn primary">Apply Filter</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Transaction ID</th>
                                <th>From Account</th>
                                <th>To Account</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>TXN001234</td>
                                <td>****1234</td>
                                <td>****5678</td>
                                <td>₦25,000</td>
                                <td style="color: green;">Completed</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                            <tr>
                                <td>TXN001235</td>
                                <td>****9012</td>
                                <td>****3456</td>
                                <td>₦150,000</td>
                                <td style="color: orange;">Under Review</td>
                                <td><button class="java-btn">Review</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Transaction Report</button>
                            <button class="java-btn">Flag Transaction</button>
                            <button class="java-btn">Export Data</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getUserAdministrationContent() {
            return `
                <div class="config-section">
                    <div class="config-header">User Administration Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">User Search:</span>
                            <input type="text" class="form-input" placeholder="Username or email">
                            <button class="java-btn primary">Search</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Last Login</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>teller01</td>
                                <td>teller@xypay.com</td>
                                <td>Teller</td>
                                <td style="color: green;">Active</td>
                                <td>2024-01-15 10:30</td>
                                <td><button class="java-btn">Edit</button></td>
                            </tr>
                            <tr>
                                <td>cso01</td>
                                <td>cso@xypay.com</td>
                                <td>CSO</td>
                                <td style="color: red;">Disabled</td>
                                <td>2024-01-10 14:22</td>
                                <td><button class="java-btn">Enable</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Create User</button>
                            <button class="java-btn">Reset Password</button>
                            <button class="java-btn">Assign Roles</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getSystemConfigurationContent() {
            return `
                <div class="config-section">
                    <div class="config-header">System Configuration Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Configuration Category:</span>
                            <select class="form-select">
                                <option>General Settings</option>
                                <option>Security Parameters</option>
                                <option>Transaction Limits</option>
                                <option>System Maintenance</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; padding: 12px; background: #f8f8f8; border: 1px inset #c0c0c0;">
                            <div class="form-row">
                                <span class="form-label">Daily Transaction Limit:</span>
                                <input type="number" class="form-input" value="1000000" style="width: 150px;">
                            </div>
                            <div class="form-row">
                                <span class="form-label">Session Timeout (minutes):</span>
                                <input type="number" class="form-input" value="30" style="width: 100px;">
                            </div>
                            <div class="form-row">
                                <span class="form-label">Enable SMS Notifications:</span>
                                <input type="checkbox" checked>
                            </div>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Save Configuration</button>
                            <button class="java-btn">Reset to Defaults</button>
                            <button class="java-btn">Export Config</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getReportsAnalyticsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Reports & Analytics Console</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Daily Transaction Summary</option>
                                <option>Customer Activity Report</option>
                                <option>System Performance Report</option>
                                <option>Audit Trail Report</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Date Range:</span>
                            <input type="date" class="form-input" style="width: 150px;">
                            <span>to</span>
                            <input type="date" class="form-input" style="width: 150px;">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Format:</span>
                            <select class="form-select" style="width: 120px;">
                                <option>PDF</option>
                                <option>Excel</option>
                                <option>CSV</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Generate Report</button>
                            <button class="java-btn">Schedule Report</button>
                            <button class="java-btn">View Analytics Dashboard</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize dashboard
        window.onload = function() {
            // Set admin info
            document.getElementById('adminName').textContent = 'admin@xypay.com';
            document.getElementById('sessionTime').textContent = 'Active';
            
            // Update statistics periodically
            setInterval(() => {
                const activeUsers = Math.floor(Math.random() * 50) + 200;
                const systemLoad = Math.floor(Math.random() * 20) + 60;
                
                document.getElementById('activeUsers').textContent = activeUsers;
                document.getElementById('statusActiveUsers').textContent = activeUsers;
                document.getElementById('systemLoad').textContent = systemLoad + '%';
                document.getElementById('statusSystemLoad').textContent = systemLoad + '%';
            }, 30000);
        };
    </script>
</body>
</html>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-cog me-2"></i>Settings
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <!-- Header -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <div>
                        <h1 class="h2 mb-0">Core Banking Admin</h1>
                        <small class="text-muted">Operational Overview</small>
                    </div>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-file-export me-1"></i> Export
                            </button>
                            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.reload()">
                                <i class="fas fa-rotate me-1"></i> Refresh
                            </button>
                        </div>
                    </div>
                </div>

                <!-- KPI Tiles -->
                <div class="row g-4 mb-4">
                    <div class="col-6 col-md-3">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="text-muted text-uppercase small">Customers</div>
                                        <div class="fs-3 fw-semibold">1,248</div>
                                        <div class="text-success small"><i class="fas fa-arrow-up"></i> 12% MoM</div>
                                    </div>
                                    <div class="text-primary fs-3"><i class="fas fa-users"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="text-muted text-uppercase small">Accounts</div>
                                        <div class="fs-3 fw-semibold">3,562</div>
                                        <div class="text-success small"><i class="fas fa-arrow-up"></i> 8% MoM</div>
                                    </div>
                                    <div class="text-success fs-3"><i class="fas fa-wallet"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="text-muted text-uppercase small">Tx Today</div>
                                        <div class="fs-3 fw-semibold">12,458</div>
                                        <div class="text-warning small"><i class="fas fa-arrow-right"></i> Peak window</div>
                                    </div>
                                    <div class="text-warning fs-3"><i class="fas fa-exchange-alt"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="card border-0 shadow-sm">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <div class="text-muted text-uppercase small">Total Deposits</div>
                                        <div class="fs-3 fw-semibold">$42.6M</div>
                                        <div class="text-success small"><i class="fas fa-arrow-up"></i> 5% MoM</div>
                                    </div>
                                    <div class="text-danger fs-3"><i class="fas fa-piggy-bank"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Operational analytics & system health -->
                <div class="row g-4 mb-4">
                    <div class="col-lg-8">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Transaction Volume (24h)</h5>
                                    <small id="lastUpdated" class="text-muted">Last updated just now</small>
                                </div>
                            </div>
                            <div class="card-body">
                                <canvas id="txVolumeChart" height="90"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white"><h5 class="mb-0">Core Systems</h5></div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Core Banking Service <span class="badge bg-success">Healthy</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Payments Gateway <span class="badge bg-success">Operational</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Notification Service <span class="badge bg-warning text-dark">Degraded</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        Reporting Engine <span class="badge bg-success">Online</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        DB Replication <span class="badge bg-success">Sync</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Channel mix & approvals / risk -->
                <div class="row g-4 mb-4">
                    <div class="col-lg-7">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white"><h5 class="mb-0">Channel Mix</h5></div>
                            <div class="card-body">
                                <canvas id="channelMixChart" height="110"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white"><h5 class="mb-0">Risk & Compliance</h5></div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-6 text-center">
                                        <canvas id="riskDonutChart" height="140"></canvas>
                                    </div>
                                    <div class="col-6">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                KYC Backlog <span class="badge bg-primary">32</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                AML Alerts (24h) <span class="badge bg-warning text-dark">12</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                SAR Filed (MTD) <span class="badge bg-danger">3</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Approvals & Quick Actions -->
                <div class="row g-4 mb-4">
                    <div class="col-lg-7">
                        <div class="card border-0 shadow-sm">
                            <div class="card-header bg-white"><h5 class="mb-0">Pending Approvals</h5></div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover mb-0">
                                        <thead class="table-light">
                                            <tr>
                                                <th>Time</th>
                                                <th>Request</th>
                                                <th>Module</th>
                                                <th>Priority</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10:30</td>
                                                <td>Open Corporate Account - Acme Ltd</td>
                                                <td>Onboarding</td>
                                                <td><span class="badge bg-danger">High</span></td>
                                            </tr>
                                            <tr>
                                                <td>09:45</td>
                                                <td>Loan Disbursement - #LN-2041</td>
                                                <td>Loans</td>
                                                <td><span class="badge bg-warning text-dark">Medium</span></td>
                                            </tr>
                                            <tr>
                                                <td>09:10</td>
                                                <td>GL Journal Post - EOD Adjustments</td>
                                                <td>Finance</td>
                                                <td><span class="badge bg-primary">Low</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="card border-0 shadow-sm h-100">
                            <div class="card-header bg-white"><h5 class="mb-0">Quick Actions</h5></div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-user-plus me-2"></i>Open Account</a>
                                    </div>
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-file-invoice-dollar me-2"></i>Post Journal</a>
                                    </div>
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-calendar-check me-2"></i>Run EOD</a>
                                    </div>
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-shield-alt me-2"></i>Review AML</a>
                                    </div>
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-database me-2"></i>Data Export</a>
                                    </div>
                                    <div class="col-6 d-grid">
                                        <a href="#" class="btn btn-outline-primary"><i class="fas fa-users-cog me-2"></i>Users & Roles</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent activity -->
                <div class="row g-4">
                    <div class="col-12">
                        <div class="card border-0 shadow-sm">
                            <div class="card-header bg-white">
                                <h5 class="card-title mb-0">Recent Activity</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped align-middle">
                                        <thead>
                                            <tr>
                                                <th>Time</th>
                                                <th>User</th>
                                                <th>Action</th>
                                                <th>Module</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10:30 AM</td>
                                                <td>John Smith</td>
                                                <td>Created new customer</td>
                                                <td>Customer Management</td>
                                            </tr>
                                            <tr>
                                                <td>09:45 AM</td>
                                                <td>Sarah Johnson</td>
                                                <td>Processed loan application</td>
                                                <td>Loan Management</td>
                                            </tr>
                                            <tr>
                                                <td>08:20 AM</td>
                                                <td>Michael Brown</td>
                                                <td>Updated branch information</td>
                                                <td>Branch Management</td>
                                            </tr>
                                            <tr>
                                                <td>Yesterday</td>
                                                <td>Admin</td>
                                                <td>Generated monthly report</td>
                                                <td>Reporting</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function randomData(len, min, max) {
            return Array.from({length: len}, () => Math.floor(Math.random() * (max - min + 1)) + min);
        }

        // Update "last updated" timestamp
        (function() {
            var el = document.getElementById('lastUpdated');
            if (el) {
                var now = new Date();
                el.textContent = 'Last updated ' + now.toLocaleTimeString();
            }
        })();

        // Transaction volume chart (24h line)
        new Chart(document.getElementById('txVolumeChart'), {
            type: 'line',
            data: {
                labels: [...Array(24).keys()].map(h => (h < 10 ? '0' + h : h) + ':00'),
                datasets: [{
                    label: 'Transactions',
                    data: randomData(24, 80, 400),
                    borderColor: '#0d6efd',
                    backgroundColor: 'rgba(13,110,253,0.1)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.35
                }]
            },
            options: {
                responsive: true,
                plugins: {legend: {display: false}},
                scales: {y: {beginAtZero: true}}
            }
        });

        // Channel mix (bar)
        new Chart(document.getElementById('channelMixChart'), {
            type: 'bar',
            data: {
                labels: ['Branch Teller', 'Mobile', 'Web', 'API'],
                datasets: [{
                    label: 'Transactions',
                    data: randomData(4, 200, 2000),
                    backgroundColor: ['#0d6efd', '#198754', '#6c757d', '#ffc107']
                }]
            },
            options: {
                responsive: true,
                plugins: {legend: {display: false}},
                scales: {y: {beginAtZero: true}}
            }
        });

        // Risk donut
        new Chart(document.getElementById('riskDonutChart'), {
            type: 'doughnut',
            data: {
                labels: ['Low', 'Medium', 'High'],
                datasets: [{
                    data: [68, 24, 8],
                    backgroundColor: ['#198754', '#ffc107', '#dc3545']
                }]
            },
            options: {responsive: true, plugins: {legend: {position: 'bottom'}}}
        });
    </script>
</body>
</html>