<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Admin Console - Java Style</title>
    <style>
        /* Java Swing-inspired styling */
        * { box-sizing: border-box; }
        body { 
            margin: 0; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background: #f0f0f0; 
            color: #333;
        }
        
        /* Main container with Java window look */
        .java-window {
            background: #e8e8e8;
            border: 2px outset #c0c0c0;
            margin: 10px;
            min-height: calc(100vh - 20px);
        }
        
        /* Title bar */
        .title-bar {
            background: linear-gradient(to bottom, #4a90e2, #357abd);
            color: white;
            padding: 8px 12px;
            font-weight: bold;
            font-size: 14px;
            border-bottom: 1px solid #2c5aa0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .window-controls {
            display: flex;
            gap: 4px;
        }
        
        .window-btn {
            width: 16px;
            height: 16px;
            border: 1px outset #c0c0c0;
            background: #e0e0e0;
            font-size: 10px;
            text-align: center;
            line-height: 14px;
            cursor: pointer;
        }
        
        /* Menu bar */
        .menu-bar {
            background: #f0f0f0;
            border-bottom: 1px solid #a0a0a0;
            padding: 4px;
            font-size: 12px;
        }
        
        .menu-item {
            display: inline-block;
            padding: 4px 12px;
            cursor: pointer;
            border: 1px solid transparent;
        }
        
        .menu-item:hover {
            border: 1px inset #c0c0c0;
            background: #d0d0d0;
        }
        
        /* Toolbar */
        .toolbar {
            background: #f8f8f8;
            border-bottom: 1px solid #a0a0a0;
            padding: 6px;
            display: flex;
            gap: 4px;
            align-items: center;
        }
        
        .toolbar-btn {
            padding: 4px 8px;
            border: 1px outset #c0c0c0;
            background: #e8e8e8;
            font-size: 11px;
            cursor: pointer;
            min-width: 60px;
        }
        
        .toolbar-btn:hover {
            background: #d0d0d0;
        }
        
        .toolbar-btn:active {
            border: 1px inset #c0c0c0;
        }
        
        .toolbar-separator {
            width: 1px;
            height: 20px;
            background: #a0a0a0;
            margin: 0 4px;
        }
        
        /* Main content area */
        .content-area {
            display: flex;
            height: calc(100vh - 140px);
        }
        
        /* Left panel - Tree view */
        .tree-panel {
            width: 250px;
            background: #ffffff;
            border-right: 1px solid #a0a0a0;
            border-left: 1px inset #c0c0c0;
            border-top: 1px inset #c0c0c0;
            overflow-y: auto;
        }
        
        .tree-header {
            background: #e8e8e8;
            padding: 6px 8px;
            font-weight: bold;
            font-size: 12px;
            border-bottom: 1px solid #a0a0a0;
        }
        
        .tree-node {
            padding: 3px 8px 3px 16px;
            font-size: 12px;
            cursor: pointer;
            border-bottom: 1px dotted #d0d0d0;
            display: flex;
            align-items: center;
        }
        
        .tree-node:hover {
            background: #e0f0ff;
        }
        
        .tree-node.selected {
            background: #316ac5;
            color: white;
        }
        
        .tree-icon {
            width: 16px;
            height: 16px;
            margin-right: 6px;
            background: #ffd700;
            border: 1px solid #ccc;
            font-size: 10px;
            text-align: center;
            line-height: 14px;
        }
        
        /* Right panel - Details */
        .details-panel {
            flex: 1;
            background: #ffffff;
            border: 1px inset #c0c0c0;
            display: flex;
            flex-direction: column;
        }
        
        .details-header {
            background: #e8e8e8;
            padding: 6px 8px;
            font-weight: bold;
            font-size: 12px;
            border-bottom: 1px solid #a0a0a0;
        }
        
        .details-content {
            flex: 1;
            padding: 12px;
            overflow-y: auto;
        }
        
        /* Java-style buttons */
        .java-btn {
            padding: 6px 16px;
            border: 2px outset #c0c0c0;
            background: #e8e8e8;
            font-size: 11px;
            cursor: pointer;
            margin: 2px;
        }
        
        .java-btn:hover {
            background: #d0d0d0;
        }
        
        .java-btn:active {
            border: 2px inset #c0c0c0;
        }
        
        .java-btn.primary {
            background: #4a90e2;
            color: white;
            border-color: #357abd;
        }
        
        /* Status bar */
        .status-bar {
            background: #f0f0f0;
            border-top: 1px solid #a0a0a0;
            padding: 4px 8px;
            font-size: 11px;
            display: flex;
            justify-content: space-between;
        }
        
        /* Configuration panels */
        .config-section {
            margin-bottom: 16px;
            border: 1px solid #a0a0a0;
            background: #f8f8f8;
        }
        
        .config-header {
            background: #e0e0e0;
            padding: 6px 8px;
            font-weight: bold;
            font-size: 12px;
            border-bottom: 1px solid #a0a0a0;
        }
        
        .config-content {
            padding: 8px;
        }
        
        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            font-size: 12px;
        }
        
        .form-label {
            width: 120px;
            font-weight: bold;
        }
        
        .form-input {
            flex: 1;
            padding: 2px 4px;
            border: 1px inset #c0c0c0;
            font-size: 11px;
        }
        
        /* Table styling */
        .java-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 11px;
            border: 1px solid #a0a0a0;
        }
        
        .java-table th {
            background: #e0e0e0;
            padding: 4px 8px;
            border: 1px solid #a0a0a0;
            font-weight: bold;
            text-align: left;
        }
        
        .java-table td {
            padding: 4px 8px;
            border: 1px solid #d0d0d0;
        }
        
        .java-table tr:nth-child(even) {
            background: #f8f8f8;
        }
        
        .java-table tr:hover {
            background: #e0f0ff;
        }
    </style>
    <script>
        // Simulate real-time notifications (replace with AJAX/websocket in production)
        function addNotification(msg) {
            const area = document.getElementById('notifications-list');
            const div = document.createElement('div');
            div.className = 'notification';
            div.innerText = msg;
            area.prepend(div);
        }
        
        // Java-style tree navigation
        function selectTreeNode(element, configType) {
            // Remove previous selection
            document.querySelectorAll('.tree-node').forEach(node => {
                node.classList.remove('selected');
            });
            
            // Select current node
            element.classList.add('selected');
            
            // Load configuration content
            loadConfigContent(configType);
        }
        
        function loadConfigContent(configType) {
            const content = document.getElementById('config-content');
            
            switch(configType) {
                case 'screen':
                    content.innerHTML = getScreenConfigContent();
                    break;
                case 'menu':
                    content.innerHTML = getMenuConfigContent();
                    break;
                case 'approval':
                    content.innerHTML = getApprovalConfigContent();
                    break;
                case 'rate':
                    content.innerHTML = getRateConfigContent();
                    break;
                case 'validation':
                    content.innerHTML = getValidationConfigContent();
                    break;
                default:
                    content.innerHTML = getDefaultContent();
            }
        }
        
        function getScreenConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Screen Configuration Manager</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Screen Code:</span>
                            <input type="text" class="form-input" placeholder="Enter screen code">
                            <button class="java-btn">Load</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Screen Name:</span>
                            <input type="text" class="form-input" placeholder="Enter screen name">
                        </div>
                        <table class="java-table">
                            <tr><th>Field Name</th><th>Type</th><th>Required</th><th>Validation</th><th>Actions</th></tr>
                            <tr><td>customerName</td><td>TEXT</td><td>Yes</td><td>Required, MinLength(2)</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>phoneNumber</td><td>TEXT</td><td>Yes</td><td>Phone, Required</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>email</td><td>EMAIL</td><td>No</td><td>Email Format</td><td><button class="java-btn">Edit</button></td></tr>
                        </table>
                        <div style="margin-top: 8px;">
                            <button class="java-btn primary">Save Configuration</button>
                            <button class="java-btn">Add Field</button>
                            <button class="java-btn">Preview</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getMenuConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Menu Configuration Manager</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Menu Code:</span>
                            <input type="text" class="form-input" placeholder="Enter menu code">
                            <button class="java-btn">Load</button>
                        </div>
                        <table class="java-table">
                            <tr><th>Menu Item</th><th>Parent</th><th>Role Access</th><th>Order</th><th>Actions</th></tr>
                            <tr><td>User Management</td><td>Admin</td><td>ADMIN, SUPERUSER</td><td>1</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>Transaction Monitor</td><td>Operations</td><td>TELLER, ADMIN</td><td>2</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>Rate Configuration</td><td>Config</td><td>SUPERUSER</td><td>3</td><td><button class="java-btn">Edit</button></td></tr>
                        </table>
                        <div style="margin-top: 8px;">
                            <button class="java-btn primary">Save Menu</button>
                            <button class="java-btn">Add Item</button>
                            <button class="java-btn">Reorder</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getApprovalConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Approval Matrix Configuration</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Matrix Code:</span>
                            <input type="text" class="form-input" placeholder="Enter matrix code">
                            <button class="java-btn">Load</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Transaction Type:</span>
                            <select class="form-input">
                                <option>TRANSFER</option>
                                <option>WITHDRAWAL</option>
                                <option>LOAN_APPROVAL</option>
                            </select>
                        </div>
                        <table class="java-table">
                            <tr><th>Amount Range</th><th>Level</th><th>Required Role</th><th>Timeout</th><th>Actions</th></tr>
                            <tr><td>0 - 10,000</td><td>1</td><td>TELLER</td><td>2 hours</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>10,001 - 100,000</td><td>2</td><td>BRANCH_MANAGER</td><td>4 hours</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>100,001+</td><td>3</td><td>EXECUTIVE</td><td>24 hours</td><td><button class="java-btn">Edit</button></td></tr>
                        </table>
                        <div style="margin-top: 8px;">
                            <button class="java-btn primary">Save Matrix</button>
                            <button class="java-btn">Add Level</button>
                            <button class="java-btn">Test Matrix</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRateConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Rate Configuration Manager</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Rate Code:</span>
                            <input type="text" class="form-input" placeholder="Enter rate code">
                            <button class="java-btn">Load</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Product Type:</span>
                            <select class="form-input">
                                <option>SAVINGS</option>
                                <option>LOAN</option>
                                <option>TRANSFER</option>
                            </select>
                        </div>
                        <table class="java-table">
                            <tr><th>Customer Segment</th><th>Base Rate</th><th>Spread</th><th>Min Rate</th><th>Max Rate</th><th>Actions</th></tr>
                            <tr><td>PREMIUM</td><td>2.50%</td><td>0.25%</td><td>2.00%</td><td>5.00%</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>STANDARD</td><td>3.00%</td><td>0.50%</td><td>2.50%</td><td>6.00%</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>BASIC</td><td>3.50%</td><td>0.75%</td><td>3.00%</td><td>7.00%</td><td><button class="java-btn">Edit</button></td></tr>
                        </table>
                        <div style="margin-top: 8px;">
                            <button class="java-btn primary">Save Rates</button>
                            <button class="java-btn">Calculate</button>
                            <button class="java-btn">Bulk Update</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getValidationConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Field Validation Rules</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Rule Code:</span>
                            <input type="text" class="form-input" placeholder="Enter rule code">
                            <button class="java-btn">Load</button>
                        </div>
                        <table class="java-table">
                            <tr><th>Field Name</th><th>Validation Type</th><th>Value</th><th>Error Message</th><th>Actions</th></tr>
                            <tr><td>phoneNumber</td><td>REGEX</td><td>^[0-9]{10,11}$</td><td>Invalid phone format</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>amount</td><td>RANGE</td><td>1,1000000</td><td>Amount must be 1-1M</td><td><button class="java-btn">Edit</button></td></tr>
                            <tr><td>email</td><td>EMAIL</td><td></td><td>Invalid email format</td><td><button class="java-btn">Edit</button></td></tr>
                        </table>
                        <div style="margin-top: 8px;">
                            <button class="java-btn primary">Save Rules</button>
                            <button class="java-btn">Add Rule</button>
                            <button class="java-btn">Test Validation</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getDefaultContent() {
            return `
                <div class="config-section">
                    <div class="config-header">XyPay Admin Console - Flexcube Style</div>
                    <div class="config-content">
                        <p>Welcome to the XyPay Administration Console</p>
                        <p>Select a configuration module from the tree on the left to begin.</p>
                        
                        <div style="margin-top: 16px;">
                            <h4>Available Modules:</h4>
                            <ul style="font-size: 12px; margin-left: 16px;">
                                <li><strong>Screen Configuration:</strong> Design dynamic forms and layouts</li>
                                <li><strong>Menu Configuration:</strong> Manage role-based navigation menus</li>
                                <li><strong>Approval Matrix:</strong> Configure multi-level approval workflows</li>
                                <li><strong>Rate Configuration:</strong> Set up dynamic pricing and rates</li>
                                <li><strong>Field Validation:</strong> Define validation rules and constraints</li>
                            </ul>
                        </div>
                        
                        <div style="margin-top: 16px;">
                            <h4>System Status:</h4>
                            <table class="java-table">
                                <tr><th>Service</th><th>Status</th><th>Last Updated</th></tr>
                                <tr><td>User Registration</td><td style="color: green;">Online</td><td>2 min ago</td></tr>
                                <tr><td>Transaction Processing</td><td style="color: green;">Online</td><td>1 min ago</td></tr>
                                <tr><td>Approval Engine</td><td style="color: green;">Online</td><td>3 min ago</td></tr>
                                <tr><td>Rate Calculator</td><td style="color: green;">Online</td><td>1 min ago</td></tr>
                            </table>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize default content on page load
        window.onload = function() {
            loadConfigContent('default');
        };
    </script>
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Admin Console - Flexcube Style Configuration Manager</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Edit</span>
            <span class="menu-item">Configuration</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New</button>
            <button class="toolbar-btn">Open</button>
            <button class="toolbar-btn">Save</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Refresh</button>
            <button class="toolbar-btn">Export</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Help</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Tree Panel -->
            <div class="tree-panel">
                <div class="tree-header">Configuration Modules</div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'screen')">
                    <div class="tree-icon">📋</div>
                    Screen Configuration
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'menu')">
                    <div class="tree-icon">📁</div>
                    Menu Configuration
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'approval')">
                    <div class="tree-icon">✓</div>
                    Approval Matrix
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'rate')">
                    <div class="tree-icon">💰</div>
                    Rate Configuration
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'validation')">
                    <div class="tree-icon">🔍</div>
                    Field Validation Rules
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'users')">
                    <div class="tree-icon">👥</div>
                    User Management
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'roles')">
                    <div class="tree-icon">🔐</div>
                    Role Management
                </div>
                
                <div class="tree-node" onclick="selectTreeNode(this, 'audit')">
                    <div class="tree-icon">📊</div>
                    Audit & Monitoring
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Configuration Details</div>
                <div class="details-content" id="config-content">
                    <!-- Dynamic content loaded here -->
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Ready | Connected to XyPay Database</span>
            <span>User: superuser@xypay.com | Role: SUPERUSER</span>
        </div>
    </div>
</body>
</html>
