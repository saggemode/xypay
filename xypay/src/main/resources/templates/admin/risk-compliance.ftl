<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Risk & Compliance</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#complianceModal">
                <i class="fas fa-plus me-2"></i>Add New Configuration
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">KYC Rules</h5>
                <p class="card-text">Configure customer verification workflows and requirements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#kycRuleModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">AML Rules</h5>
                <p class="card-text">Set up anti-money laundering detection and reporting.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#amlRuleModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Sanctions Screening</h5>
                <p class="card-text">Configure sanctions list checking and alerting.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#sanctionsModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Fraud Detection</h5>
                <p class="card-text">Define fraud detection rules and thresholds.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#fraudModal">
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
                <h5 class="mb-0">Existing Configurations</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="complianceTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="kyc-tab" data-bs-toggle="tab" data-bs-target="#kyc" type="button" role="tab">KYC Rules</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="aml-tab" data-bs-toggle="tab" data-bs-target="#aml" type="button" role="tab">AML Rules</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="sanctions-tab" data-bs-toggle="tab" data-bs-target="#sanctions" type="button" role="tab">Sanctions Screening</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="fraud-tab" data-bs-toggle="tab" data-bs-target="#fraud" type="button" role="tab">Fraud Detection</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="complianceTabsContent">
                    <div class="tab-pane fade show active" id="kyc" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Configuration Name</th>
                                        <th>KYC Level</th>
                                        <th>Required Documents</th>
                                        <th>Verification Steps</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>BASIC_KYC</td>
                                        <td>Basic</td>
                                        <td>ID Proof, Address Proof</td>
                                        <td>Document Verification</td>
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
                                        <td>ENHANCED_KYC</td>
                                        <td>Enhanced</td>
                                        <td>ID Proof, Address Proof, Income Proof</td>
                                        <td>Document Verification, Background Check</td>
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
                    
                    <div class="tab-pane fade" id="aml" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Configuration Name</th>
                                        <th>Threshold Amount</th>
                                        <th>Velocity Limit</th>
                                        <th>Time Period</th>
                                        <th>Alert Recipients</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>STANDARD_AML</td>
                                        <td>$10,000.00</td>
                                        <td>5 transactions</td>
                                        <td>1 hour</td>
                                        <td>AML Officer, Compliance Team</td>
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
                                        <td>HIGH_RISK_AML</td>
                                        <td>$1,000.00</td>
                                        <td>2 transactions</td>
                                        <td>30 minutes</td>
                                        <td>AML Officer, Compliance Team, Management</td>
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
                    
                    <div class="tab-pane fade" id="sanctions" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>List Name</th>
                                        <th>Source URL</th>
                                        <th>Update Frequency</th>
                                        <th>Last Updated</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>OFAC Sanctions List</td>
                                        <td>https://ofac.treasury.gov/sanctions-list</td>
                                        <td>Daily</td>
                                        <td>2023-01-15</td>
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
                                        <td>EU Sanctions List</td>
                                        <td>https://eeas.europa.eu/topics/sanctions</td>
                                        <td>Weekly</td>
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
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="fraud" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Rule Name</th>
                                        <th>Detection Criteria</th>
                                        <th>Threshold</th>
                                        <th>Alert Type</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>FAILED_LOGIN_ATTEMPTS</td>
                                        <td>Consecutive failed logins</td>
                                        <td>5 attempts</td>
                                        <td>High Priority</td>
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
                                        <td>UNUSUAL_TRANSACTION_PATTERN</td>
                                        <td>Transaction velocity and amount</td>
                                        <td>300% above average</td>
                                        <td>Medium Priority</td>
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

<!-- Compliance Configuration Modal -->
<div class="modal fade" id="complianceModal" tabindex="-1" aria-labelledby="complianceModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="complianceModalLabel">Add New Configuration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="complianceTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="kyc-config-tab" data-bs-toggle="tab" data-bs-target="#kyc-config" type="button" role="tab">KYC Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="aml-config-tab" data-bs-toggle="tab" data-bs-target="#aml-config" type="button" role="tab">AML Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="sanctions-config-tab" data-bs-toggle="tab" data-bs-target="#sanctions-config" type="button" role="tab">Sanctions Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="fraud-config-tab" data-bs-toggle="tab" data-bs-target="#fraud-config" type="button" role="tab">Fraud Configuration</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="complianceTypeTabsContent">
                    <div class="tab-pane fade show active" id="kyc-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="kycConfigName" class="form-label">Configuration Name</label>
                                    <input type="text" class="form-control" id="kycConfigName" placeholder="e.g., ENHANCED_KYC">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="kycLevel" class="form-label">KYC Level</label>
                                    <select class="form-select" id="kycLevel">
                                        <option value="BASIC">Basic</option>
                                        <option value="STANDARD">Standard</option>
                                        <option value="ENHANCED">Enhanced</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="requiredDocuments" class="form-label">Required Documents (JSON)</label>
                                <textarea class="form-control" id="requiredDocuments" rows="2">["ID_PROOF", "ADDRESS_PROOF"]</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="verificationSteps" class="form-label">Verification Steps (JSON)</label>
                                <textarea class="form-control" id="verificationSteps" rows="2">["DOCUMENT_VERIFICATION", "BACKGROUND_CHECK"]</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="aml-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="amlConfigName" class="form-label">Configuration Name</label>
                                    <input type="text" class="form-control" id="amlConfigName" placeholder="e.g., STANDARD_AML">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="thresholdAmount" class="form-label">Threshold Amount</label>
                                    <input type="number" class="form-control" id="thresholdAmount" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="velocityLimit" class="form-label">Velocity Limit</label>
                                    <input type="number" class="form-control" id="velocityLimit" placeholder="e.g., 5">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="timePeriod" class="form-label">Time Period (minutes)</label>
                                    <input type="number" class="form-control" id="timePeriod" placeholder="e.g., 60">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="amlAlertRecipients" class="form-label">Alert Recipients (JSON)</label>
                                <textarea class="form-control" id="amlAlertRecipients" rows="2">["aml_officer@bank.com", "compliance@bank.com"]</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="sanctions-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="sanctionsListName" class="form-label">List Name</label>
                                    <input type="text" class="form-control" id="sanctionsListName" placeholder="e.g., OFAC Sanctions List">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="sourceUrl" class="form-label">Source URL</label>
                                    <input type="url" class="form-control" id="sourceUrl" placeholder="https://...">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="updateFrequency" class="form-label">Update Frequency</label>
                                    <select class="form-select" id="updateFrequency">
                                        <option value="DAILY">Daily</option>
                                        <option value="WEEKLY">Weekly</option>
                                        <option value="MONTHLY">Monthly</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="sanctionsStatus" class="form-label">Status</label>
                                    <select class="form-select" id="sanctionsStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="fraud-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fraudRuleName" class="form-label">Rule Name</label>
                                    <input type="text" class="form-control" id="fraudRuleName" placeholder="e.g., FAILED_LOGIN_ATTEMPTS">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="detectionCriteria" class="form-label">Detection Criteria</label>
                                    <input type="text" class="form-control" id="detectionCriteria" placeholder="e.g., Consecutive failed logins">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fraudThreshold" class="form-label">Threshold</label>
                                    <input type="text" class="form-control" id="fraudThreshold" placeholder="e.g., 5 attempts">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="alertType" class="form-label">Alert Type</label>
                                    <select class="form-select" id="alertType">
                                        <option value="LOW">Low Priority</option>
                                        <option value="MEDIUM">Medium Priority</option>
                                        <option value="HIGH">High Priority</option>
                                        <option value="CRITICAL">Critical Priority</option>
                                    </select>
                                </div>
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