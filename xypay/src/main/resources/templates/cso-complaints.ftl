<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Complaints Management Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Complaints Management Console - Customer Service Interface</span>
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
            <span class="menu-item">Complaints</span>
            <span class="menu-item">Resolution</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Complaint</button>
            <button class="toolbar-btn">Search Customer</button>
            <button class="toolbar-btn">Escalate</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Save Draft</button>
            <button class="toolbar-btn">Submit</button>
            <button class="toolbar-btn">Print</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Templates</button>
            <button class="toolbar-btn">History</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Complaint Management</div>
                
                <div class="tree-node selected" onclick="selectComplaintModule(this, 'new')">
                    <div class="tree-icon">📝</div>
                    New Complaint
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'pending')">
                    <div class="tree-icon">⏳</div>
                    Pending Complaints
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'in-progress')">
                    <div class="tree-icon">🔄</div>
                    In Progress
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'resolved')">
                    <div class="tree-icon">✅</div>
                    Resolved
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'escalated')">
                    <div class="tree-icon">⚠️</div>
                    Escalated
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'categories')">
                    <div class="tree-icon">📋</div>
                    Categories
                </div>
                
                <div class="tree-node" onclick="selectComplaintModule(this, 'reports')">
                    <div class="tree-icon">📊</div>
                    Reports
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Complaint Processing</div>
                <div class="details-content" id="complaint-content">
                    
                    <!-- New Complaint Form -->
                    <div class="config-section">
                        <div class="config-header">New Customer Complaint</div>
                        <div class="config-content">
                            <form action="/cso/complaints" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                
                                <!-- Customer Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Customer Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Search:</span>
                                        <input type="text" class="form-input" id="customerSearch" placeholder="Search by account, phone, or email">
                                        <button type="button" class="java-btn" onclick="searchCustomer()">Search</button>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Name:</span>
                                        <input type="text" class="form-input" id="customerName" name="customerName" required>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Number:</span>
                                        <input type="text" class="form-input" id="accountNumber" name="accountNumber">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Phone Number:</span>
                                        <input type="tel" class="form-input" id="phoneNumber" name="phoneNumber">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Email Address:</span>
                                        <input type="email" class="form-input" id="emailAddress" name="emailAddress">
                                    </div>
                                </fieldset>
                                
                                <!-- Complaint Details -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Complaint Details</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Complaint Category:</span>
                                        <select class="form-select" id="complaintCategory" name="complaintCategory" required onchange="updateSubcategories()">
                                            <option value="">Select Category</option>
                                            <option value="TRANSACTION">Transaction Issues</option>
                                            <option value="ACCOUNT">Account Problems</option>
                                            <option value="CARD">Card Related</option>
                                            <option value="SERVICE">Service Quality</option>
                                            <option value="FEES">Fees and Charges</option>
                                            <option value="TECHNICAL">Technical Issues</option>
                                            <option value="OTHER">Other</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Subcategory:</span>
                                        <select class="form-select" id="complaintSubcategory" name="complaintSubcategory">
                                            <option value="">Select Subcategory</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Priority Level:</span>
                                        <select class="form-select" id="priorityLevel" name="priorityLevel" required>
                                            <option value="LOW">Low</option>
                                            <option value="MEDIUM" selected>Medium</option>
                                            <option value="HIGH">High</option>
                                            <option value="URGENT">Urgent</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Complaint Subject:</span>
                                        <input type="text" class="form-input" id="complaintSubject" name="complaintSubject" required placeholder="Brief summary of the complaint">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Complaint Description:</span>
                                        <textarea class="form-input" id="complaint" name="complaint" rows="6" required placeholder="Detailed description of the complaint"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Date of Incident:</span>
                                        <input type="datetime-local" class="form-input" id="incidentDate" name="incidentDate">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Transaction Reference:</span>
                                        <input type="text" class="form-input" id="transactionRef" name="transactionRef" placeholder="If complaint is transaction-related">
                                    </div>
                                </fieldset>
                                
                                <!-- Resolution Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Resolution Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Expected Resolution:</span>
                                        <select class="form-select" id="expectedResolution" name="expectedResolution">
                                            <option value="">Select Expected Resolution</option>
                                            <option value="REFUND">Refund</option>
                                            <option value="REVERSAL">Transaction Reversal</option>
                                            <option value="ACCOUNT_FIX">Account Fix</option>
                                            <option value="CARD_REPLACEMENT">Card Replacement</option>
                                            <option value="EXPLANATION">Explanation/Clarification</option>
                                            <option value="COMPENSATION">Compensation</option>
                                            <option value="OTHER">Other</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Assigned To:</span>
                                        <select class="form-select" id="assignedTo" name="assignedTo">
                                            <option value="">Auto-assign</option>
                                            <option value="CSO_TEAM">CSO Team</option>
                                            <option value="TECHNICAL_TEAM">Technical Team</option>
                                            <option value="OPERATIONS_TEAM">Operations Team</option>
                                            <option value="MANAGEMENT">Management</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Target Resolution Date:</span>
                                        <input type="date" class="form-input" id="targetResolutionDate" name="targetResolutionDate">
                                    </div>
                                </fieldset>
                                
                                <!-- Additional Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">Additional Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Communication Channel:</span>
                                        <select class="form-select" id="communicationChannel" name="communicationChannel">
                                            <option value="PHONE">Phone Call</option>
                                            <option value="EMAIL">Email</option>
                                            <option value="BRANCH">Branch Visit</option>
                                            <option value="ONLINE">Online Portal</option>
                                            <option value="MOBILE_APP">Mobile App</option>
                                            <option value="SOCIAL_MEDIA">Social Media</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Mood:</span>
                                        <select class="form-select" id="customerMood" name="customerMood">
                                            <option value="CALM">Calm</option>
                                            <option value="FRUSTRATED">Frustrated</option>
                                            <option value="ANGRY">Angry</option>
                                            <option value="DISAPPOINTED">Disappointed</option>
                                            <option value="CONFUSED">Confused</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">CSO Notes:</span>
                                        <textarea class="form-input" id="csoNotes" name="csoNotes" rows="4" placeholder="Internal notes and observations"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Attachments:</span>
                                        <input type="file" class="form-input" id="attachments" name="attachments" multiple accept=".pdf,.jpg,.jpeg,.png,.doc,.docx">
                                        <small style="color: #666; font-size: 11px;">Max 5MB per file. Supported: PDF, Images, Word documents</small>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="submit" class="java-btn primary">Submit Complaint</button>
                                    <button type="button" class="java-btn" onclick="saveDraft()">Save as Draft</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                    <button type="button" class="java-btn" onclick="previewComplaint()">Preview</button>
                                </div>
                            </form>
                            
                            <#if result??>
                                <div class="java-alert info" style="margin-top: 16px;">
                                    <strong>Result:</strong> ${result}
                                </div>
                            </#if>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Complaints Console Ready | Today's Complaints: <span id="todayComplaints">12</span> | Pending Resolution: <span id="pendingResolution">8</span></span>
            <span>CSO: cso@xypay.com | Session: Active</span>
        </div>
    </div>
    
    <script>
        function selectComplaintModule(element, moduleType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load module content
            const content = document.getElementById('complaint-content');
            
            switch(moduleType) {
                case 'pending':
                    content.innerHTML = getPendingComplaintsContent();
                    break;
                case 'in-progress':
                    content.innerHTML = getInProgressComplaintsContent();
                    break;
                case 'resolved':
                    content.innerHTML = getResolvedComplaintsContent();
                    break;
                case 'escalated':
                    content.innerHTML = getEscalatedComplaintsContent();
                    break;
                case 'categories':
                    content.innerHTML = getCategoriesContent();
                    break;
                case 'reports':
                    content.innerHTML = getReportsContent();
                    break;
                default:
                    // Keep default new complaint form
                    break;
            }
        }
        
        function searchCustomer() {
            const searchTerm = document.getElementById('customerSearch').value;
            if (searchTerm) {
                alert('Searching for customer: ' + searchTerm);
                // Simulate customer data loading
                document.getElementById('customerName').value = 'Jane Smith';
                document.getElementById('accountNumber').value = '1234567890';
                document.getElementById('phoneNumber').value = '+234-xxx-xxxx';
                document.getElementById('emailAddress').value = 'jane.smith@email.com';
            }
        }
        
        function updateSubcategories() {
            const category = document.getElementById('complaintCategory').value;
            const subcategorySelect = document.getElementById('complaintSubcategory');
            
            // Clear existing options
            subcategorySelect.innerHTML = '<option value="">Select Subcategory</option>';
            
            const subcategories = {
                'TRANSACTION': ['Failed Transaction', 'Wrong Amount Debited', 'Duplicate Charge', 'Transaction Not Reflected'],
                'ACCOUNT': ['Account Blocked', 'Balance Discrepancy', 'Statement Issues', 'Account Closure'],
                'CARD': ['Card Not Working', 'ATM Issues', 'Card Blocked', 'PIN Problems'],
                'SERVICE': ['Poor Customer Service', 'Long Wait Time', 'Rude Staff', 'Branch Issues'],
                'FEES': ['Unexpected Charges', 'High Fees', 'Fee Dispute', 'Commission Issues'],
                'TECHNICAL': ['App Not Working', 'Website Issues', 'System Downtime', 'Login Problems'],
                'OTHER': ['General Inquiry', 'Feedback', 'Suggestion', 'Other Issues']
            };
            
            if (subcategories[category]) {
                subcategories[category].forEach(sub => {
                    const option = document.createElement('option');
                    option.value = sub.toUpperCase().replace(/ /g, '_');
                    option.textContent = sub;
                    subcategorySelect.appendChild(option);
                });
            }
        }
        
        function saveDraft() {
            alert('Complaint saved as draft');
        }
        
        function clearForm() {
            document.querySelector('form').reset();
            document.getElementById('complaintSubcategory').innerHTML = '<option value="">Select Subcategory</option>';
        }
        
        function previewComplaint() {
            const customerName = document.getElementById('customerName').value;
            const subject = document.getElementById('complaintSubject').value;
            
            if (customerName && subject) {
                alert('Preview: Complaint from ' + customerName + ' - ' + subject);
            } else {
                alert('Please fill in customer name and complaint subject first');
            }
        }
        
        function getPendingComplaintsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Pending Complaints</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Complaint ID</th>
                                <th>Customer Name</th>
                                <th>Category</th>
                                <th>Priority</th>
                                <th>Submitted Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CMP001234</td>
                                <td>John Doe</td>
                                <td>Transaction</td>
                                <td style="color: orange;">Medium</td>
                                <td>2024-01-15</td>
                                <td style="color: blue;">Pending</td>
                                <td>
                                    <button class="java-btn primary">Process</button>
                                    <button class="java-btn">View Details</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getInProgressComplaintsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Complaints In Progress</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Complaint ID</th>
                                <th>Customer Name</th>
                                <th>Category</th>
                                <th>Assigned To</th>
                                <th>Progress</th>
                                <th>Due Date</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CMP001235</td>
                                <td>Jane Smith</td>
                                <td>Account</td>
                                <td>Technical Team</td>
                                <td>60%</td>
                                <td>2024-01-20</td>
                                <td>
                                    <button class="java-btn">Update</button>
                                    <button class="java-btn">View Details</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getResolvedComplaintsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Resolved Complaints</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Complaint ID</th>
                                <th>Customer Name</th>
                                <th>Category</th>
                                <th>Resolution</th>
                                <th>Resolved Date</th>
                                <th>Satisfaction</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CMP001236</td>
                                <td>Mike Johnson</td>
                                <td>Card</td>
                                <td>Card Replaced</td>
                                <td>2024-01-10</td>
                                <td style="color: green;">Satisfied</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getEscalatedComplaintsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Escalated Complaints</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Complaint ID</th>
                                <th>Customer Name</th>
                                <th>Category</th>
                                <th>Escalated To</th>
                                <th>Escalation Date</th>
                                <th>Reason</th>
                                <th>Actions</th>
                            </tr>
                            <tr>
                                <td>CMP001237</td>
                                <td>Sarah Wilson</td>
                                <td>Service</td>
                                <td>Management</td>
                                <td>2024-01-12</td>
                                <td>Complex Issue</td>
                                <td><button class="java-btn">View Details</button></td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getCategoriesContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Complaint Categories</div>
                    <div class="config-content">
                        <table class="java-table">
                            <tr>
                                <th>Category</th>
                                <th>Total Complaints</th>
                                <th>Pending</th>
                                <th>Resolved</th>
                                <th>Avg Resolution Time</th>
                            </tr>
                            <tr>
                                <td>Transaction</td>
                                <td>45</td>
                                <td>8</td>
                                <td>37</td>
                                <td>2.3 days</td>
                            </tr>
                            <tr>
                                <td>Account</td>
                                <td>32</td>
                                <td>5</td>
                                <td>27</td>
                                <td>1.8 days</td>
                            </tr>
                            <tr>
                                <td>Card</td>
                                <td>28</td>
                                <td>3</td>
                                <td>25</td>
                                <td>1.2 days</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getReportsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Complaint Reports</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Report Type:</span>
                            <select class="form-select">
                                <option>Daily Complaints Summary</option>
                                <option>Category Analysis</option>
                                <option>Resolution Performance</option>
                                <option>Customer Satisfaction Report</option>
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
        
        // Set target resolution date based on priority
        document.getElementById('priorityLevel').addEventListener('change', function() {
            const priority = this.value;
            const targetDate = document.getElementById('targetResolutionDate');
            const today = new Date();
            
            const daysToAdd = {
                'URGENT': 1,
                'HIGH': 2,
                'MEDIUM': 5,
                'LOW': 10
            };
            
            if (daysToAdd[priority]) {
                const targetDateValue = new Date(today);
                targetDateValue.setDate(today.getDate() + daysToAdd[priority]);
                targetDate.value = targetDateValue.toISOString().split('T')[0];
            }
        });
        
        // Initialize
        window.onload = function() {
            document.getElementById('todayComplaints').textContent = '12';
            document.getElementById('pendingResolution').textContent = '8';
            
            // Set default incident date to now
            const now = new Date();
            now.setMinutes(now.getMinutes() - now.getTimezoneOffset());
            document.getElementById('incidentDate').value = now.toISOString().slice(0, 16);
        };
    </script>
</body>
</html>
