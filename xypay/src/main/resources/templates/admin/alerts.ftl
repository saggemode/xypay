<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Alerts & Notifications</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal">
                <i class="fas fa-plus me-2"></i>Add New Alert
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Transaction Alerts</h5>
                <p class="card-text">Configure alerts for various transaction events.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#transactionAlertModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Fraud Alerts</h5>
                <p class="card-text">Set up alerts for suspicious activities and fraud detection.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#fraudAlertModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">System Alerts</h5>
                <p class="card-text">Configure system health and performance alerts.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#systemAlertModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Notification Templates</h5>
                <p class="card-text">Manage templates for different notification types.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#templateModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Existing Alerts</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="alertTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="transaction-tab" data-bs-toggle="tab" data-bs-target="#transaction" type="button" role="tab">Transaction Alerts</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="fraud-tab" data-bs-toggle="tab" data-bs-target="#fraud" type="button" role="tab">Fraud Alerts</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="system-tab" data-bs-toggle="tab" data-bs-target="#system" type="button" role="tab">System Alerts</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="templates-tab" data-bs-toggle="tab" data-bs-target="#templates" type="button" role="tab">Templates</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="alertTabsContent">
                    <div class="tab-pane fade show active" id="transaction" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Alert Name</th>
                                        <th>Trigger Condition</th>
                                        <th>Channels</th>
                                        <th>Recipients</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>High Value Transaction</td>
                                        <td>Amount > $500</td>
                                        <td>SMS, Email</td>
                                        <td>Customer</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Account Balance Low</td>
                                        <td>Balance < $100</td>
                                        <td>Email, In-App</td>
                                        <td>Customer</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="fraud" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Alert Name</th>
                                        <th>Trigger Condition</th>
                                        <th>Severity</th>
                                        <th>Recipients</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Multiple Failed Logins</td>
                                        <td>> 3 failed attempts</td>
                                        <td>High</td>
                                        <td>Fraud Team, Customer</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Unusual Transaction Pattern</td>
                                        <td>300% above average</td>
                                        <td>Medium</td>
                                        <td>Fraud Team</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="system" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Alert Name</th>
                                        <th>Trigger Condition</th>
                                        <th>Severity</th>
                                        <th>Recipients</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Database Connection Failure</td>
                                        <td>Connection timeout</td>
                                        <td>Critical</td>
                                        <td>System Admin</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>High CPU Usage</td>
                                        <td>> 85% for 5 minutes</td>
                                        <td>Medium</td>
                                        <td>System Admin, Operations</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="templates" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Template Name</th>
                                        <th>Notification Type</th>
                                        <th>Channels</th>
                                        <th>Last Updated</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Transaction Confirmation</td>
                                        <td>Transaction</td>
                                        <td>SMS, Email</td>
                                        <td>2023-01-10</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Account Alert</td>
                                        <td>Account</td>
                                        <td>Email, In-App</td>
                                        <td>2023-01-05</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Alert Configuration Modal -->
<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="alertModalLabel">Add New Alert</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="alertTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="transaction-alert-tab" data-bs-toggle="tab" data-bs-target="#transaction-alert" type="button" role="tab">Transaction Alert</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="fraud-alert-tab" data-bs-toggle="tab" data-bs-target="#fraud-alert" type="button" role="tab">Fraud Alert</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="system-alert-tab" data-bs-toggle="tab" data-bs-target="#system-alert" type="button" role="tab">System Alert</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="template-alert-tab" data-bs-toggle="tab" data-bs-target="#template-alert" type="button" role="tab">Notification Template</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="alertTypeTabsContent">
                    <div class="tab-pane fade show active" id="transaction-alert" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="transactionAlertName" class="form-label">Alert Name</label>
                                    <input type="text" class="form-control" id="transactionAlertName" placeholder="e.g., High Value Transaction">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="transactionTrigger" class="form-label">Trigger Condition</label>
                                    <input type="text" class="form-control" id="transactionTrigger" placeholder="e.g., Amount > 500">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="transactionChannels" class="form-label">Notification Channels</label>
                                    <select class="form-select" id="transactionChannels" multiple>
                                        <option value="SMS" selected>SMS</option>
                                        <option value="EMAIL" selected>Email</option>
                                        <option value="IN_APP">In-App</option>
                                        <option value="PUSH">Push Notification</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="transactionRecipients" class="form-label">Recipients</label>
                                    <select class="form-select" id="transactionRecipients" multiple>
                                        <option value="CUSTOMER" selected>Customer</option>
                                        <option value="MANAGER">Manager</option>
                                        <option value="COMPLIANCE">Compliance Officer</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="fraud-alert" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fraudAlertName" class="form-label">Alert Name</label>
                                    <input type="text" class="form-control" id="fraudAlertName" placeholder="e.g., Multiple Failed Logins">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="fraudTrigger" class="form-label">Trigger Condition</label>
                                    <input type="text" class="form-control" id="fraudTrigger" placeholder="e.g., > 3 failed attempts">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fraudSeverity" class="form-label">Severity</label>
                                    <select class="form-select" id="fraudSeverity">
                                        <option value="LOW">Low</option>
                                        <option value="MEDIUM">Medium</option>
                                        <option value="HIGH">High</option>
                                        <option value="CRITICAL">Critical</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="fraudRecipients" class="form-label">Recipients</label>
                                    <select class="form-select" id="fraudRecipients" multiple>
                                        <option value="FRAUD_TEAM" selected>Fraud Team</option>
                                        <option value="CUSTOMER">Customer</option>
                                        <option value="MANAGEMENT">Management</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="system-alert" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="systemAlertName" class="form-label">Alert Name</label>
                                    <input type="text" class="form-control" id="systemAlertName" placeholder="e.g., Database Connection Failure">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="systemTrigger" class="form-label">Trigger Condition</label>
                                    <input type="text" class="form-control" id="systemTrigger" placeholder="e.g., Connection timeout">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="systemSeverity" class="form-label">Severity</label>
                                    <select class="form-select" id="systemSeverity">
                                        <option value="LOW">Low</option>
                                        <option value="MEDIUM">Medium</option>
                                        <option value="HIGH">High</option>
                                        <option value="CRITICAL" selected>Critical</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="systemRecipients" class="form-label">Recipients</label>
                                    <select class="form-select" id="systemRecipients" multiple>
                                        <option value="SYSTEM_ADMIN" selected>System Admin</option>
                                        <option value="OPERATIONS">Operations Team</option>
                                        <option value="MANAGEMENT">Management</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="template-alert" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="templateName" class="form-label">Template Name</label>
                                    <input type="text" class="form-control" id="templateName" placeholder="e.g., Transaction Confirmation">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="notificationType" class="form-label">Notification Type</label>
                                    <select class="form-select" id="notificationType">
                                        <option value="TRANSACTION">Transaction</option>
                                        <option value="ACCOUNT">Account</option>
                                        <option value="ALERT">Alert</option>
                                        <option value="SYSTEM">System</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="templateContent" class="form-label">Template Content (JSON)</label>
                                <textarea class="form-control" id="templateContent" rows="4">{
  "SMS": "Transaction of {amount} {currency} completed on {date}",
  "EMAIL": "Dear customer, a transaction of {amount} {currency} was completed on your account on {date}",
  "IN_APP": "Transaction completed: {amount} {currency}"
}</textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save Configuration</button>
            </div>
        </div>
    </div>
</div>
</#macro>

<@content/>