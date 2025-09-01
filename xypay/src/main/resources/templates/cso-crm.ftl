<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay CRM Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Customer Relationship Management Console - CSO Interface</span>
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
            <span class="menu-item">Contacts</span>
            <span class="menu-item">Activities</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Contact</button>
            <button class="toolbar-btn">Search Customer</button>
            <button class="toolbar-btn">Add Activity</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Call Log</button>
            <button class="toolbar-btn">Email</button>
            <button class="toolbar-btn">Schedule</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Reports</button>
            <button class="toolbar-btn">Export</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">CRM Modules</div>
                
                <div class="tree-node selected" onclick="selectCRMModule(this, 'dashboard')">
                    <div class="tree-icon">📊</div>
                    CRM Dashboard
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'customers')">
                    <div class="tree-icon">👥</div>
                    Customer Database
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'contacts')">
                    <div class="tree-icon">📞</div>
                    Contact Management
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'activities')">
                    <div class="tree-icon">📋</div>
                    Activities & Tasks
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'interactions')">
                    <div class="tree-icon">💬</div>
                    Customer Interactions
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'campaigns')">
                    <div class="tree-icon">📢</div>
                    Marketing Campaigns
                </div>
                
                <div class="tree-node" onclick="selectCRMModule(this, 'analytics')">
                    <div class="tree-icon">📈</div>
                    Analytics & Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Customer Relationship Management</div>
                <div class="details-content" id="crm-content">
                    
                    <!-- CRM Dashboard -->
                    <div class="config-section">
                        <div class="config-header">CRM Dashboard Overview</div>
                        <div class="config-content">
                            
                            <!-- Key Metrics -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Key Metrics</legend>
                                
                                <div style="display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px;">
                                    <div class="metric-card">
                                        <div class="metric-value">1,247</div>
                                        <div class="metric-label">Total Customers</div>
                                        <div class="metric-change" style="color: green;">+5.2%</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value">89</div>
                                        <div class="metric-label">New This Month</div>
                                        <div class="metric-change" style="color: green;">+12.3%</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value">156</div>
                                        <div class="metric-label">Active Interactions</div>
                                        <div class="metric-change" style="color: orange;">-2.1%</div>
                                    </div>
                                    
                                    <div class="metric-card">
                                        <div class="metric-value">94.2%</div>
                                        <div class="metric-label">Satisfaction Rate</div>
                                        <div class="metric-change" style="color: green;">+1.8%</div>
                                    </div>
                                </div>
                            </fieldset>
                            
                            <!-- Recent Activities -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Recent Activities</legend>
                                
                                <table class="java-table">
                                    <tr>
                                        <th>Time</th>
                                        <th>Customer</th>
                                        <th>Activity Type</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>CSO</th>
                                    </tr>
                                    <tr>
                                        <td>10:30 AM</td>
                                        <td>John Doe</td>
                                        <td>Phone Call</td>
                                        <td>Account inquiry follow-up</td>
                                        <td style="color: green;">Completed</td>
                                        <td>Sarah M.</td>
                                    </tr>
                                    <tr>
                                        <td>09:45 AM</td>
                                        <td>Jane Smith</td>
                                        <td>Email</td>
                                        <td>Product information request</td>
                                        <td style="color: blue;">In Progress</td>
                                        <td>Mike R.</td>
                                    </tr>
                                    <tr>
                                        <td>09:15 AM</td>
                                        <td>Bob Johnson</td>
                                        <td>Meeting</td>
                                        <td>Account opening consultation</td>
                                        <td style="color: orange;">Scheduled</td>
                                        <td>Lisa K.</td>
                                    </tr>
                                </table>
                            </fieldset>
                            
                            <!-- Quick Actions -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Quick Actions</legend>
                                
                                <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 12px;">
                                    <button class="java-btn primary" onclick="addNewCustomer()">Add New Customer</button>
                                    <button class="java-btn" onclick="scheduleFollowUp()">Schedule Follow-up</button>
                                    <button class="java-btn" onclick="createCampaign()">Create Campaign</button>
                                    <button class="java-btn" onclick="logInteraction()">Log Interaction</button>
                                    <button class="java-btn" onclick="generateReport()">Generate Report</button>
                                    <button class="java-btn" onclick="exportData()">Export Data</button>
                                </div>
                            </fieldset>
                            
                            <!-- Pending Tasks -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">Pending Tasks</legend>
                                
                                <div class="task-list">
                                    <div class="task-item">
                                        <input type="checkbox" id="task1">
                                        <label for="task1">Follow up with premium customers about new services</label>
                                        <span class="task-due">Due: Today</span>
                                    </div>
                                    <div class="task-item">
                                        <input type="checkbox" id="task2">
                                        <label for="task2">Review customer feedback from last week</label>
                                        <span class="task-due">Due: Tomorrow</span>
                                    </div>
                                    <div class="task-item">
                                        <input type="checkbox" id="task3">
                                        <label for="task3">Prepare monthly customer satisfaction report</label>
                                        <span class="task-due">Due: Jan 31</span>
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
            <span>CRM Console Ready | Active Customers: <span id="activeCustomers">1,247</span> | Today's Activities: <span id="todayActivities">23</span></span>
            <span>CSO: cso@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectCRMModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('crm-content');
            
            switch(moduleType) {
                case 'customers':
                    content.innerHTML = getCustomerDatabaseContent();
                    break;
                case 'contacts':
                    content.innerHTML = getContactManagementContent();
                    break;
                case 'activities':
                    content.innerHTML = getActivitiesContent();
                    break;
                case 'interactions':
                    content.innerHTML = getInteractionsContent();
                    break;
                case 'campaigns':
                    content.innerHTML = getCampaignsContent();
                    break;
                case 'analytics':
                    content.innerHTML = getAnalyticsContent();
                    break;
                default:
                    // Keep default dashboard
                    break;
            }
        }
        
        function addNewCustomer() {
            alert('Opening new customer form...');
        }
        
        function scheduleFollowUp() {
            alert('Opening follow-up scheduler...');
        }
        
        function createCampaign() {
            alert('Opening campaign creator...');
        }
        
        function logInteraction() {
            alert('Opening interaction logger...');
        }
        
        function generateReport() {
            alert('Opening report generator...');
        }
        
        function exportData() {
            alert('Exporting CRM data...');
        }
        
        function getCustomerDatabaseContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Database Management</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Search Customers:</span>
                            <input type="text" class="form-input" placeholder="Search by name, phone, email, or account">
                            <button class="java-btn">Search</button>
                            <button class="java-btn primary">Add New</button>
                        </div>
                        
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Customer ID</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Account Type</th>
                                <th>Status</th>
                                <th>Last Contact</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CUS001234</td>
                                <td>John Doe</td>
                                <td>+234-xxx-xxxx</td>
                                <td>john.doe@email.com</td>
                                <td>Premium</td>
                                <td style="color: green;">Active</td>
                                <td>2024-01-15</td>
                                <td>
                                    <button class="java-btn">View</button>
                                    <button class="java-btn">Edit</button>
                                    <button class="java-btn">Contact</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getContactManagementContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Contact Management</div>
                    <div class="config-content">
                        <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                            <legend style="font-weight: bold; font-size: 12px;">New Contact Entry</legend>
                            
                            <div class="form-row">
                                <span class="form-label">Contact Type:</span>
                                <select class="form-select">
                                    <option>Phone Call</option>
                                    <option>Email</option>
                                    <option>In-Person Meeting</option>
                                    <option>Video Call</option>
                                    <option>SMS</option>
                                </select>
                            </div>
                            
                            <div class="form-row">
                                <span class="form-label">Customer:</span>
                                <input type="text" class="form-input" placeholder="Search and select customer">
                            </div>
                            
                            <div class="form-row">
                                <span class="form-label">Subject:</span>
                                <input type="text" class="form-input" placeholder="Contact subject">
                            </div>
                            
                            <div class="form-row">
                                <span class="form-label">Notes:</span>
                                <textarea class="form-input" rows="4" placeholder="Contact details and notes"></textarea>
                            </div>
                            
                            <div style="text-align: center; margin-top: 12px;">
                                <button class="java-btn primary">Save Contact</button>
                                <button class="java-btn">Clear</button>
                            </div>
                        </fieldset>
                    </div>
                </div>
            `;
        }
        
        function getActivitiesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Activities & Tasks Management</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Activity ID</th>
                                <th>Type</th>
                                <th>Customer</th>
                                <th>Description</th>
                                <th>Due Date</th>
                                <th>Priority</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>ACT001</td>
                                <td>Follow-up Call</td>
                                <td>Jane Smith</td>
                                <td>Discuss new product offerings</td>
                                <td>2024-01-20</td>
                                <td style="color: orange;">High</td>
                                <td>Pending</td>
                                <td>
                                    <button class="java-btn primary">Complete</button>
                                    <button class="java-btn">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getInteractionsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Customer Interactions History</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Filter by:</span>
                            <select class="form-select" style="width: 150px;">
                                <option>All Interactions</option>
                                <option>Phone Calls</option>
                                <option>Emails</option>
                                <option>Meetings</option>
                            </select>
                            <span class="form-label">Date Range:</span>
                            <input type="date" class="form-input" style="width: 150px;">
                            <span>to</span>
                            <input type="date" class="form-input" style="width: 150px;">
                        </div>
                        
                        <div class="interaction-timeline" style="margin-top: 16px;">
                            <div class="interaction-item">
                                <div class="interaction-time">2024-01-15 10:30 AM</div>
                                <div class="interaction-type">Phone Call</div>
                                <div class="interaction-customer">John Doe</div>
                                <div class="interaction-summary">Discussed account upgrade options. Customer interested in premium services.</div>
                            </div>
                            <div class="interaction-item">
                                <div class="interaction-time">2024-01-14 2:15 PM</div>
                                <div class="interaction-type">Email</div>
                                <div class="interaction-customer">Jane Smith</div>
                                <div class="interaction-summary">Sent product brochure and pricing information as requested.</div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getCampaignsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Marketing Campaigns</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Campaign Name</th>
                                <th>Type</th>
                                <th>Target Audience</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Status</th>
                                <th>Response Rate</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>New Year Promotion</td>
                                <td>Email</td>
                                <td>Premium Customers</td>
                                <td>2024-01-01</td>
                                <td>2024-01-31</td>
                                <td style="color: green;">Active</td>
                                <td>12.5%</td>
                                <td>
                                    <button class="java-btn">View</button>
                                    <button class="java-btn">Edit</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getAnalyticsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">CRM Analytics & Reports</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Customer Acquisition Report</option>
                                <option>Customer Satisfaction Analysis</option>
                                <option>Interaction Performance Report</option>
                                <option>Campaign Effectiveness Report</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Period:</span>
                            <select class="form-select" style="width: 150px;">
                                <option>Last 7 Days</option>
                                <option>Last 30 Days</option>
                                <option>Last 3 Months</option>
                                <option>Custom Range</option>
                            </select>
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
            document.getElementById('activeCustomers').textContent = '1,247';
            document.getElementById('todayActivities').textContent = '23';
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
        
        .task-list {
            max-height: 200px;
            overflow-y: auto;
        }
        
        .task-item {
            display: flex;
            align-items: center;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        
        .task-item input[type="checkbox"] {
            margin-right: 8px;
        }
        
        .task-item label {
            flex: 1;
            font-size: 12px;
        }
        
        .task-due {
            font-size: 10px;
            color: #666;
            margin-left: 8px;
        }
        
        .interaction-timeline {
            max-height: 300px;
            overflow-y: auto;
            border: 1px inset #c0c0c0;
            padding: 8px;
        }
        
        .interaction-item {
            padding: 8px;
            border-bottom: 1px solid #eee;
            font-size: 11px;
        }
        
        .interaction-time {
            font-weight: bold;
            color: #333;
        }
        
        .interaction-type {
            color: #666;
            font-style: italic;
        }
        
        .interaction-customer {
            font-weight: bold;
            color: #0066cc;
        }
        
        .interaction-summary {
            margin-top: 4px;
            color: #333;
        }
    </style>
</body>
</html>
