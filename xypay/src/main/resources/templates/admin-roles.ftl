<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Role Management Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Role Management Console - Security Administration</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Roles</span>
            <span class="menu-item">Permissions</span>
            <span class="menu-item">Security</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Role</button>
            <button class="toolbar-btn">Edit Role</button>
            <button class="toolbar-btn">Delete Role</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Assign Permissions</button>
            <button class="toolbar-btn">Clone Role</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Import</button>
            <button class="toolbar-btn">Export</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Refresh</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Role Categories</div>
                
                <div class="tree-node selected" onclick="selectRoleCategory(this, 'all')">
                    <div class="tree-icon">📋</div>
                    All Roles
                </div>
                
                <div class="tree-node" onclick="selectRoleCategory(this, 'admin')">
                    <div class="tree-icon">👑</div>
                    Administrative Roles
                </div>
                
                <div class="tree-node" onclick="selectRoleCategory(this, 'operational')">
                    <div class="tree-icon">⚙️</div>
                    Operational Roles
                </div>
                
                <div class="tree-node" onclick="selectRoleCategory(this, 'customer')">
                    <div class="tree-icon">👥</div>
                    Customer Service Roles
                </div>
                
                <div class="tree-node" onclick="selectRoleCategory(this, 'financial')">
                    <div class="tree-icon">💰</div>
                    Financial Roles
                </div>
                
                <div class="tree-node" onclick="selectRoleCategory(this, 'permissions')">
                    <div class="tree-icon">🔐</div>
                    Permission Matrix
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Role Management Console</div>
                <div class="details-content" id="role-content">
                    
                    <!-- Role Overview -->
                    <div class="config-section">
                        <div class="config-header">System Roles Overview</div>
                        <div class="config-content">
                            <p>Manage user roles and permissions for the XyPay banking system.</p>
                            <p><strong>Total Roles:</strong> <span id="totalRoles">8</span> | <strong>Active:</strong> <span id="activeRoles">7</span> | <strong>Custom:</strong> <span id="customRoles">3</span></p>
                        </div>
                    </div>
                    
                    <!-- Role List -->
                    <div class="config-section">
                        <div class="config-header">Role Configuration</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Role Name</th>
                                    <th>Description</th>
                                    <th>Type</th>
                                    <th>Users</th>
                                    <th>Permissions</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                <tr>
                                    <td><strong>SUPER_ADMIN</strong></td>
                                    <td>System Super Administrator</td>
                                    <td>System</td>
                                    <td>1</td>
                                    <td>All Permissions</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('SUPER_ADMIN')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('SUPER_ADMIN')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>ADMIN</strong></td>
                                    <td>System Administrator</td>
                                    <td>System</td>
                                    <td>3</td>
                                    <td>Administrative</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('ADMIN')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('ADMIN')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>MANAGER</strong></td>
                                    <td>Branch Manager</td>
                                    <td>Operational</td>
                                    <td>5</td>
                                    <td>Management</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('MANAGER')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('MANAGER')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>TELLER</strong></td>
                                    <td>Bank Teller</td>
                                    <td>Operational</td>
                                    <td>25</td>
                                    <td>Transaction Processing</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('TELLER')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('TELLER')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>CSO</strong></td>
                                    <td>Customer Service Officer</td>
                                    <td>Customer Service</td>
                                    <td>12</td>
                                    <td>Customer Management</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('CSO')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('CSO')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>LOAN_OFFICER</strong></td>
                                    <td>Loan Officer</td>
                                    <td>Financial</td>
                                    <td>8</td>
                                    <td>Loan Processing</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('LOAN_OFFICER')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('LOAN_OFFICER')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>AUDITOR</strong></td>
                                    <td>System Auditor</td>
                                    <td>Compliance</td>
                                    <td>2</td>
                                    <td>Read-Only Access</td>
                                    <td style="color: green;">Active</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('AUDITOR')">Edit</button>
                                        <button class="java-btn" onclick="viewPermissions('AUDITOR')">Permissions</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><strong>GUEST</strong></td>
                                    <td>Guest User</td>
                                    <td>Custom</td>
                                    <td>0</td>
                                    <td>Limited Access</td>
                                    <td style="color: orange;">Inactive</td>
                                    <td>
                                        <button class="java-btn" onclick="editRole('GUEST')">Edit</button>
                                        <button class="java-btn" onclick="activateRole('GUEST')">Activate</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Role Actions -->
                    <div class="config-section">
                        <div class="config-header">Role Management Actions</div>
                        <div class="config-content">
                            <div style="text-align: center;">
                                <button class="java-btn primary" onclick="createNewRole()">Create New Role</button>
                                <button class="java-btn" onclick="cloneRole()">Clone Existing Role</button>
                                <button class="java-btn" onclick="importRoles()">Import Roles</button>
                                <button class="java-btn" onclick="exportRoles()">Export Roles</button>
                                <button class="java-btn" onclick="generateRoleReport()">Generate Report</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Role Management Console Ready | Total Roles: <span id="statusTotalRoles">8</span> | Active Users: <span id="statusActiveUsers">56</span></span>
            <span>Administrator: admin@xypay.com | Security Level: High</span>
        </div>
    </div>
    
    <script>
        function selectRoleCategory(element, categoryType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load category content
            const content = document.getElementById('role-content');
            
            switch(categoryType) {
                case 'admin':
                    content.innerHTML = getAdminRolesContent();
                    break;
                case 'operational':
                    content.innerHTML = getOperationalRolesContent();
                    break;
                case 'customer':
                    content.innerHTML = getCustomerServiceRolesContent();
                    break;
                case 'financial':
                    content.innerHTML = getFinancialRolesContent();
                    break;
                case 'permissions':
                    content.innerHTML = getPermissionMatrixContent();
                    break;
                default:
                    // Keep default role content
                    break;
            }
        }
        
        function getAdminRolesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Administrative Roles</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Role</th>
                                <th>Level</th>
                                <th>Users</th>
                                <th>Key Permissions</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>SUPER_ADMIN</td>
                                <td>Level 5</td>
                                <td>1</td>
                                <td>System Control, User Management, Security</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                            <tr>
                                <td>ADMIN</td>
                                <td>Level 4</td>
                                <td>3</td>
                                <td>User Management, Configuration, Reports</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getOperationalRolesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Operational Roles</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Role</th>
                                <th>Department</th>
                                <th>Users</th>
                                <th>Primary Functions</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>MANAGER</td>
                                <td>Branch Operations</td>
                                <td>5</td>
                                <td>Staff Management, Approvals, Oversight</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                            <tr>
                                <td>TELLER</td>
                                <td>Customer Service</td>
                                <td>25</td>
                                <td>Transactions, Cash Handling, Customer Service</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getCustomerServiceRolesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Service Roles</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Role</th>
                                <th>Specialization</th>
                                <th>Users</th>
                                <th>Responsibilities</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CSO</td>
                                <td>General Customer Service</td>
                                <td>12</td>
                                <td>Account Opening, KYC, Customer Support</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getFinancialRolesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Financial Roles</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Role</th>
                                <th>Department</th>
                                <th>Users</th>
                                <th>Financial Authority</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>LOAN_OFFICER</td>
                                <td>Credit & Loans</td>
                                <td>8</td>
                                <td>Loan Processing, Credit Assessment</td>
                                <td><button class="java-btn">Manage</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getPermissionMatrixContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Permission Matrix</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Permission</th>
                                <th>ADMIN</th>
                                <th>MANAGER</th>
                                <th>TELLER</th>
                                <th>CSO</th>
                                <th>LOAN_OFFICER</th>
                            </tr>
                            <tr>
                                <td>User Management</td>
                                <td style="color: green;">✓</td>
                                <td style="color: orange;">Limited</td>
                                <td style="color: red;">✗</td>
                                <td style="color: red;">✗</td>
                                <td style="color: red;">✗</td>
                            </tr>
                            <tr>
                                <td>Transaction Processing</td>
                                <td style="color: green;">✓</td>
                                <td style="color: green;">✓</td>
                                <td style="color: green;">✓</td>
                                <td style="color: orange;">Limited</td>
                                <td style="color: orange;">Limited</td>
                            </tr>
                            <tr>
                                <td>System Configuration</td>
                                <td style="color: green;">✓</td>
                                <td style="color: red;">✗</td>
                                <td style="color: red;">✗</td>
                                <td style="color: red;">✗</td>
                                <td style="color: red;">✗</td>
                            </tr>
                            <tr>
                                <td>Report Generation</td>
                                <td style="color: green;">✓</td>
                                <td style="color: green;">✓</td>
                                <td style="color: orange;">Limited</td>
                                <td style="color: orange;">Limited</td>
                                <td style="color: green;">✓</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function editRole(roleName) {
            alert('Editing role: ' + roleName);
        }
        
        function viewPermissions(roleName) {
            alert('Viewing permissions for role: ' + roleName);
        }
        
        function activateRole(roleName) {
            alert('Activating role: ' + roleName);
        }
        
        function createNewRole() {
            alert('Opening create new role dialog');
        }
        
        function cloneRole() {
            alert('Opening clone role dialog');
        }
        
        function importRoles() {
            alert('Opening import roles dialog');
        }
        
        function exportRoles() {
            alert('Exporting roles configuration');
        }
        
        function generateRoleReport() {
            alert('Generating role management report');
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('totalRoles').textContent = '8';
            document.getElementById('activeRoles').textContent = '7';
            document.getElementById('customRoles').textContent = '3';
            document.getElementById('statusTotalRoles').textContent = '8';
            document.getElementById('statusActiveUsers').textContent = '56';
        };
    </script>
</body>
</html>
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid #667eea;
        }
        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }
        .role-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .role-icon {
            font-size: 2em;
            margin-right: 15px;
            width: 50px;
            text-align: center;
        }
        .role-title {
            flex: 1;
        }
        .role-name {
            color: #2c3e50;
            margin: 0;
            font-size: 1.3em;
            font-weight: bold;
        }
        .role-code {
            color: #7f8c8d;
            margin: 5px 0 0 0;
            font-size: 0.9em;
            font-family: monospace;
        }
        .role-description {
            color: #34495e;
            margin: 15px 0;
            line-height: 1.6;
        }
        .role-category {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .stats-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            margin-bottom: 30px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        .stat-item {
            text-align: center;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
        }
        .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            margin: 0;
        }
        .stat-label {
            margin: 5px 0 0 0;
            font-size: 0.9em;
            opacity: 0.9;
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
        .category-section {
            margin-bottom: 40px;
        }
        .category-title {
            color: #2c3e50;
            font-size: 1.8em;
            margin: 0 0 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔐 Role Management</h1>
            <p>System roles, permissions, and access control</p>
        </div>

        <div class="stats-section">
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number">14</div>
                    <div class="stat-label">Total Roles</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">5</div>
                    <div class="stat-label">Categories</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">Active</div>
                    <div class="stat-label">System Status</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Coverage</div>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <input type="text" class="form-control" id="roleSearch" placeholder="Search roles..." onkeyup="filterRoles()">
            </div>
            <div class="col-md-3">
                <button class="btn btn-outline-primary" onclick="exportRolesCSV()">Export CSV</button>
            </div>
        </div>
        <script>
        function filterRoles() {
            var search = document.getElementById('roleSearch').value.toLowerCase();
            var cards = document.querySelectorAll('.role-card');
            cards.forEach(function(card) {
                var title = card.querySelector('.role-title').innerText.toLowerCase();
                card.style.display = title.includes(search) ? '' : 'none';
            });
        }
        function exportRolesCSV() {
            var csv = 'Role Code,Role Name,Description,Category\n';
            var cards = document.querySelectorAll('.role-card');
            cards.forEach(function(card) {
                if (card.style.display !== 'none') {
                    var code = card.querySelector('.role-code').innerText;
                    var name = card.querySelector('.role-title').innerText;
                    var desc = card.querySelector('.role-description').innerText;
                    var cat = card.closest('.category-section').querySelector('.category-title').innerText;
                    csv += '"' + code + '","' + name + '","' + desc + '","' + cat + '"\n';
                }
            });
            var blob = new Blob([csv], {type: 'text/csv'});
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'roles.csv';
            link.click();
        }
        </script>

        <#assign categories = {
            "System Administration": "🚀",
            "Administration": "⚙️",
            "Frontline Banking": "🏦",
            "Customer Service": "👥",
            "Lending": "💰",
            "Relationship Banking": "🤝",
            "Operations": "⚡",
            "Compliance": "🔒",
            "Treasury": "💎",
            "IT Support": "💻",
            "Branch Management": "🏢",
            "Operations Management": "📊",
            "Risk Management": "⚠️",
            "Executive": "👑"
        }>

        <#assign roleCategories = {}>
        <#list roles as role>
            <#if !roleCategories[role.category]??>
                <#assign roleCategories = roleCategories + {role.category: []}>
            </#if>
            <#assign roleCategories = roleCategories + {role.category: roleCategories[role.category] + [role]}>
        </#list>

        <#list roleCategories?keys as category>
            <div class="category-section">
                <h2 class="category-title">${categories[category]!""} ${category}</h2>
                <div class="roles-grid">
                    <#list roleCategories[category] as role>
                        <div class="role-card">
                            <div class="role-header">
                                <div class="role-icon">
                                    <#switch role.code>
                                        <#case "ROLE_SUPERUSER">🚀<#break>
                                        <#case "ROLE_ADMIN">⚙️<#break>
                                        <#case "ROLE_TELLER">🏦<#break>
                                        <#case "ROLE_CUSTOMER_SERVICE_OFFICER">👥<#break>
                                        <#case "ROLE_LOAN_OFFICER">💰<#break>
                                        <#case "ROLE_RELATIONSHIP_MANAGER">🤝<#break>
                                        <#case "ROLE_OPERATIONS_OFFICER">⚡<#break>
                                        <#case "ROLE_COMPLIANCE_OFFICER">🔒<#break>
                                        <#case "ROLE_TREASURY_OFFICER">💎<#break>
                                        <#case "ROLE_IT_SUPPORT">💻<#break>
                                        <#case "ROLE_BRANCH_MANAGER">🏢<#break>
                                        <#case "ROLE_OPERATIONS_MANAGER">📊<#break>
                                        <#case "ROLE_CHIEF_RISK_OFFICER">⚠️<#break>
                                        <#case "ROLE_EXECUTIVE">👑<#break>
                                        <#default>🔧
                                    </#switch>
                                </div>
                                <div class="role-title">
                                    <h3 class="role-name">${role.name}</h3>
                                    <p class="role-code">${role.code}</p>
                                </div>
                            </div>
                            <p class="role-description">${role.description}</p>
                            <span class="role-category">${role.category}</span>
                        </div>
                    </#list>
                </div>
            </div>
        </#list>

        <div style="text-align: center;">
            <a href="/admin/users" class="back-btn">← Back to User Management</a>
        </div>
    </div>
</body>
</html>
