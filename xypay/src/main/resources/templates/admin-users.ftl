<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay User Management Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay User Management Console - Administrative Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Users</span>
            <span class="menu-item">Roles</span>
            <span class="menu-item">Security</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New User</button>
            <button class="toolbar-btn">Edit User</button>
            <button class="toolbar-btn">Delete User</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Assign Role</button>
            <button class="toolbar-btn">Reset Password</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Search</button>
            <button class="toolbar-btn">Export</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Refresh</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">User Management</div>
                
                <div class="tree-node selected" onclick="selectUserModule(this, 'users')">
                    <div class="tree-icon">👥</div>
                    All Users
                </div>
                
                <div class="tree-node" onclick="selectUserModule(this, 'active')">
                    <div class="tree-icon">✅</div>
                    Active Users
                </div>
                
                <div class="tree-node" onclick="selectUserModule(this, 'inactive')">
                    <div class="tree-icon">❌</div>
                    Inactive Users
                </div>
                
                <div class="tree-node" onclick="selectUserModule(this, 'roles')">
                    <div class="tree-icon">🔐</div>
                    Role Management
                </div>
                
                <div class="tree-node" onclick="selectUserModule(this, 'permissions')">
                    <div class="tree-icon">🛡️</div>
                    Permissions
                </div>
                
                <div class="tree-node" onclick="selectUserModule(this, 'audit')">
                    <div class="tree-icon">📋</div>
                    User Audit Trail
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">User Administration Console</div>
                <div class="details-content" id="user-content">
                    
                    <!-- User Management Content -->
                    <div class="config-section">
                        <div class="config-header">User Search & Filter</div>
                        <div class="config-content">
                            <div class="form-row">
                                <span class="form-label">Search Users:</span>
                                <input type="text" class="form-input" id="userSearch" placeholder="Username, email, or full name">
                                <button class="java-btn primary" onclick="searchUsers()">Search</button>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Filter by Role:</span>
                                <select class="form-select" id="roleFilter" onchange="filterByRole()">
                                    <option value="">All Roles</option>
                                    <option value="ADMIN">Administrator</option>
                                    <option value="TELLER">Teller</option>
                                    <option value="CSO">Customer Service Officer</option>
                                    <option value="LOAN_OFFICER">Loan Officer</option>
                                    <option value="MANAGER">Manager</option>
                                </select>
                                <span class="form-label">Status:</span>
                                <select class="form-select" id="statusFilter" onchange="filterByStatus()">
                                    <option value="">All Status</option>
                                    <option value="ACTIVE">Active</option>
                                    <option value="INACTIVE">Inactive</option>
                                    <option value="LOCKED">Locked</option>
                                    <option value="PENDING">Pending</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- User List -->
                    <div class="config-section">
                        <div class="config-header">System Users</div>
                        <div class="config-content">
                            <table class="java-table" id="usersTable">
                                <tr>
                                    <th>User ID</th>
                                    <th>Username</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Last Login</th>
                                    <th>Actions</th>
                                </tr>
                                <tr>
                                    <td>USR001</td>
                                    <td>admin</td>
                                    <td>System Administrator</td>
                                    <td>admin@xypay.com</td>
                                    <td>ADMIN</td>
                                    <td style="color: green;">ACTIVE</td>
                                    <td>2024-01-15 09:30</td>
                                    <td>
                                        <button class="java-btn" onclick="editUser('USR001')">Edit</button>
                                        <button class="java-btn" onclick="viewUserDetails('USR001')">Details</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>USR002</td>
                                    <td>teller01</td>
                                    <td>John Doe</td>
                                    <td>john.doe@xypay.com</td>
                                    <td>TELLER</td>
                                    <td style="color: green;">ACTIVE</td>
                                    <td>2024-01-15 08:45</td>
                                    <td>
                                        <button class="java-btn" onclick="editUser('USR002')">Edit</button>
                                        <button class="java-btn" onclick="viewUserDetails('USR002')">Details</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>USR003</td>
                                    <td>cso01</td>
                                    <td>Jane Smith</td>
                                    <td>jane.smith@xypay.com</td>
                                    <td>CSO</td>
                                    <td style="color: red;">INACTIVE</td>
                                    <td>2024-01-10 16:22</td>
                                    <td>
                                        <button class="java-btn" onclick="editUser('USR003')">Edit</button>
                                        <button class="java-btn" onclick="activateUser('USR003')">Activate</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>USR004</td>
                                    <td>loan01</td>
                                    <td>Michael Johnson</td>
                                    <td>michael.j@xypay.com</td>
                                    <td>LOAN_OFFICER</td>
                                    <td style="color: orange;">LOCKED</td>
                                    <td>2024-01-12 14:15</td>
                                    <td>
                                        <button class="java-btn" onclick="editUser('USR004')">Edit</button>
                                        <button class="java-btn" onclick="unlockUser('USR004')">Unlock</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Quick Actions -->
                    <div class="config-section">
                        <div class="config-header">Quick User Actions</div>
                        <div class="config-content">
                            <div style="text-align: center;">
                                <button class="java-btn primary" onclick="showCreateUserDialog()">Create New User</button>
                                <button class="java-btn" onclick="bulkUserOperations()">Bulk Operations</button>
                                <button class="java-btn" onclick="exportUserList()">Export User List</button>
                                <button class="java-btn" onclick="generateUserReport()">Generate Report</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>User Management Console Ready | Total Users: <span id="totalUsers">247</span> | Active: <span id="activeUsers">198</span> | Inactive: <span id="inactiveUsers">49</span></span>
            <span>Administrator: admin@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectUserModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('user-content');
            
            switch(moduleType) {
                case 'active':
                    content.innerHTML = getActiveUsersContent();
                    break;
                case 'inactive':
                    content.innerHTML = getInactiveUsersContent();
                    break;
                case 'roles':
                    content.innerHTML = getRoleManagementContent();
                    break;
                case 'permissions':
                    content.innerHTML = getPermissionsContent();
                    break;
                case 'audit':
                    content.innerHTML = getAuditTrailContent();
                    break;
                default:
                    // Keep default user content
                    break;
            }
        }
        
        function getActiveUsersContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Active Users</div>
                    <div class="config-content">
                        <p>Displaying all active users in the system.</p>
                        <table class="java-table">
                            <tr>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Last Login</th>
                                <th>Session Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>admin</td>
                                <td>ADMIN</td>
                                <td>2024-01-15 09:30</td>
                                <td style="color: green;">Online</td>
                                <td><button class="java-btn">View Session</button></td>
                            </tr>
                            <tr>
                                <td>teller01</td>
                                <td>TELLER</td>
                                <td>2024-01-15 08:45</td>
                                <td style="color: green;">Online</td>
                                <td><button class="java-btn">View Session</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getInactiveUsersContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Inactive Users</div>
                    <div class="config-content">
                        <p>Users who are currently inactive or disabled.</p>
                        <table class="java-table">
                            <tr>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Deactivated Date</th>
                                <th>Reason</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>cso01</td>
                                <td>CSO</td>
                                <td>2024-01-10</td>
                                <td>Administrative</td>
                                <td><button class="java-btn">Reactivate</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getRoleManagementContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Role Management</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Role Name</th>
                                <th>Description</th>
                                <th>User Count</th>
                                <th>Permissions</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>ADMIN</td>
                                <td>System Administrator</td>
                                <td>2</td>
                                <td>Full Access</td>
                                <td><button class="java-btn">Edit</button></td>
                            </tr>
                            <tr>
                                <td>TELLER</td>
                                <td>Bank Teller</td>
                                <td>15</td>
                                <td>Transaction Processing</td>
                                <td><button class="java-btn">Edit</button></td>
                            </tr>
                            <tr>
                                <td>CSO</td>
                                <td>Customer Service Officer</td>
                                <td>8</td>
                                <td>Customer Management</td>
                                <td><button class="java-btn">Edit</button></td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Create New Role</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getPermissionsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Permission Management</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Select Role:</span>
                            <select class="form-select">
                                <option>ADMIN</option>
                                <option>TELLER</option>
                                <option>CSO</option>
                                <option>LOAN_OFFICER</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px;">
                            <div><input type="checkbox" checked> User Management</div>
                            <div><input type="checkbox" checked> Transaction Processing</div>
                            <div><input type="checkbox"> System Configuration</div>
                            <div><input type="checkbox"> Report Generation</div>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Save Permissions</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getAuditTrailContent() {
            return `
                <div class="config-section">
                    <div class="config-header">User Audit Trail</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Timestamp</th>
                                <th>User</th>
                                <th>Action</th>
                                <th>Target</th>
                                <th>IP Address</th>
                                <th>Status</th>
                            </tr>
                            <tr>
                                <td>2024-01-15 09:30:15</td>
                                <td>admin</td>
                                <td>Login</td>
                                <td>System</td>
                                <td>192.168.1.100</td>
                                <td style="color: green;">Success</td>
                            </tr>
                            <tr>
                                <td>2024-01-15 09:25:42</td>
                                <td>admin</td>
                                <td>User Created</td>
                                <td>teller02</td>
                                <td>192.168.1.100</td>
                                <td style="color: green;">Success</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function searchUsers() {
            const searchTerm = document.getElementById('userSearch').value;
            alert('Searching for users: ' + searchTerm);
        }
        
        function filterByRole() {
            const role = document.getElementById('roleFilter').value;
            alert('Filtering by role: ' + role);
        }
        
        function filterByStatus() {
            const status = document.getElementById('statusFilter').value;
            alert('Filtering by status: ' + status);
        }
        
        function editUser(userId) {
            alert('Editing user: ' + userId);
        }
        
        function viewUserDetails(userId) {
            alert('Viewing details for user: ' + userId);
        }
        
        function activateUser(userId) {
            alert('Activating user: ' + userId);
        }
        
        function unlockUser(userId) {
            alert('Unlocking user: ' + userId);
        }
        
        function showCreateUserDialog() {
            alert('Opening create user dialog');
        }
        
        function bulkUserOperations() {
            alert('Opening bulk operations dialog');
        }
        
        function exportUserList() {
            alert('Exporting user list');
        }
        
        function generateUserReport() {
            alert('Generating user report');
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('totalUsers').textContent = '247';
            document.getElementById('activeUsers').textContent = '198';
            document.getElementById('inactiveUsers').textContent = '49';
        };
    </script>
</body>
</html>
            cursor: pointer;
            display: inline-block;
            text-align: center;
            margin: 0 10px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-success {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }
        .btn-warning {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            color: white;
        }
        .btn-danger {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .users-table {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        .users-table table {
            width: 100%;
            border-collapse: collapse;
        }
        .users-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: bold;
        }
        .users-table td {
            padding: 15px;
            border-bottom: 1px solid #ecf0f1;
            color: #34495e;
        }
        .users-table tr:hover {
            background: rgba(102, 126, 234, 0.1);
        }
        .users-table tr:last-child td {
            border-bottom: none;
        }
        .role-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .back-btn {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }
        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .empty-state {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>👥 User Management</h1>
            <p>Manage system users, roles, and permissions</p>
        </div>

        <div class="actions">
            <a href="/admin/users/new" class="btn btn-success">➕ Add New User</a>
            <a href="/admin/roles" class="btn btn-warning">🔐 Role Management</a>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <input type="text" class="form-control" id="userSearch" placeholder="Search by username or email..." onkeyup="filterUsers()">
            </div>
            <div class="col-md-3">
                <select class="form-select" id="roleFilter" onchange="filterUsers()">
                    <option value="">All Roles</option>
                    <option value="ROLE_SUPERUSER">Superuser</option>
                    <option value="ROLE_ADMIN">Admin</option>
                    <option value="ROLE_TELLER">Teller</option>
                    <option value="ROLE_CUSTOMER_SERVICE_OFFICER">CSO</option>
                    <option value="ROLE_LOAN_OFFICER">Loan Officer</option>
                    <option value="ROLE_RELATIONSHIP_MANAGER">Relationship Manager</option>
                    <option value="ROLE_OPERATIONS_OFFICER">Operations Officer</option>
                    <option value="ROLE_COMPLIANCE_OFFICER">Compliance Officer</option>
                    <option value="ROLE_TREASURY_OFFICER">Treasury Officer</option>
                    <option value="ROLE_IT_SUPPORT">IT Support</option>
                    <option value="ROLE_BRANCH_MANAGER">Branch Manager</option>
                    <option value="ROLE_OPERATIONS_MANAGER">Operations Manager</option>
                    <option value="ROLE_CHIEF_RISK_OFFICER">Chief Risk Officer</option>
                    <option value="ROLE_EXECUTIVE">Executive</option>
                </select>
            </div>
            <div class="col-md-3">
                <button class="btn btn-outline-primary" onclick="exportUsersCSV()">Export CSV</button>
            </div>
        </div>
        <script>
function filterUsers() {
    var search = document.getElementById('userSearch').value.toLowerCase();
    var role = document.getElementById('roleFilter').value;
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        var username = row.querySelector('td:nth-child(2)').innerText.toLowerCase();
        var email = row.querySelector('td:nth-child(4)').innerText.toLowerCase();
        var userRoles = row.querySelector('td:nth-child(5)').innerText;
        var show = (username.includes(search) || email.includes(search)) && (role === '' || userRoles.includes(role));
        row.style.display = show ? '' : 'none';
    });
}
function exportUsersCSV() {
    var csv = 'ID,Username,First Name,Last Name,Email,Roles\n';
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        if (row.style.display !== 'none') {
            var cols = row.querySelectorAll('td');
            var line = Array.from(cols).map(td => '"' + td.innerText.replace(/"/g, '""') + '"').join(',');
            csv += line + '\n';
        }
    });
    var blob = new Blob([csv], {type: 'text/csv'});
    var link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'users.csv';
    link.click();
}
</script>

        <div class="users-table">
            <#if users?? && users?size gt 0>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Name</th>
                            <th>Roles</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list users as user>
                            <tr>
                                <td>${user.id!''}</td>
                                <td>${user.username!''}</td>
                                <td>${user.email!''}</td>
                                <td>${user.firstName!''} ${user.lastName!''}</td>
                                <td>
                                    <#if user.roles??>
                                        <#list user.roles?split(",") as role>
                                            <span class="role-badge">${role}</span>
                                        </#list>
                                    </#if>
                                </td>
                                <td>
                                    <a href="/admin/users/${user.id}/edit" class="btn btn-primary">✏️ Edit</a>
                                    <form method="post" action="/admin/users/${user.id}/delete" style="display: inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">🗑️ Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <div class="empty-state">
                    <h3>No users found</h3>
                    <p>Start by adding your first user to the system.</p>
                    <a href="/admin/users/new" class="btn btn-success">Add First User</a>
                </div>
            </#if>
        </div>

        <div style="text-align: center;">
            <a href="/superuser/dashboard" class="back-btn">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
