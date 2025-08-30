<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Integration Management</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#integrationModal">
                <i class="fas fa-plus me-2"></i>Add New Integration
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Payment Switches</h5>
                <p class="card-text">Configure connections to payment networks and switches.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#paymentSwitchModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Mobile & Portals</h5>
                <p class="card-text">Set up integrations with mobile apps and web portals.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#mobilePortalModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">CRM Systems</h5>
                <p class="card-text">Configure connections to CRM and customer systems.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#crmModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Message Standards</h5>
                <p class="card-text">Manage message format configurations and mappings.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#messageStandardModal">
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
                <h5 class="mb-0">Existing Integrations</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="integrationTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="payment-tab" data-bs-toggle="tab" data-bs-target="#payment" type="button" role="tab">Payment Switches</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mobile-tab" data-bs-toggle="tab" data-bs-target="#mobile" type="button" role="tab">Mobile & Portals</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="crm-tab" data-bs-toggle="tab" data-bs-target="#crm" type="button" role="tab">CRM Systems</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="message-tab" data-bs-toggle="tab" data-bs-target="#message" type="button" role="tab">Message Standards</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="integrationTabsContent">
                    <div class="tab-pane fade show active" id="payment" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Integration Name</th>
                                        <th>Type</th>
                                        <th>Endpoint</th>
                                        <th>Message Format</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>SWIFT Network</td>
                                        <td>Payment Switch</td>
                                        <td>https://swift.bank.com/api</td>
                                        <td>SWIFT MT/MX</td>
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
                                        <td>Local Payment Network</td>
                                        <td>Payment Switch</td>
                                        <td>https://local.network.com/api</td>
                                        <td>ISO 20022</td>
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
                    
                    <div class="tab-pane fade" id="mobile" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Integration Name</th>
                                        <th>Type</th>
                                        <th>Endpoint</th>
                                        <th>Authentication</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Mobile Banking App</td>
                                        <td>Mobile App</td>
                                        <td>https://mobile.bank.com/api</td>
                                        <td>OAuth 2.0</td>
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
                                        <td>Internet Banking Portal</td>
                                        <td>Web Portal</td>
                                        <td>https://online.bank.com/api</td>
                                        <td>JWT</td>
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
                    
                    <div class="tab-pane fade" id="crm" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Integration Name</th>
                                        <th>Type</th>
                                        <th>Endpoint</th>
                                        <th>Authentication</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Salesforce CRM</td>
                                        <td>CRM</td>
                                        <td>https://salesforce.bank.com/api</td>
                                        <td>API Key</td>
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
                                        <td>Internal Customer System</td>
                                        <td>Internal System</td>
                                        <td>https://customer.bank.com/api</td>
                                        <td>Certificate</td>
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
                    
                    <div class="tab-pane fade" id="message" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Standard Name</th>
                                        <th>Format</th>
                                        <th>Version</th>
                                        <th>Mapping Rules</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>SWIFT MT/MX</td>
                                        <td>SWIFT</td>
                                        <td>2023</td>
                                        <td>50 rules</td>
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
                                        <td>ISO 20022</td>
                                        <td>ISO</td>
                                        <td>2022</td>
                                        <td>75 rules</td>
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

<!-- Integration Configuration Modal -->
<div class="modal fade" id="integrationModal" tabindex="-1" aria-labelledby="integrationModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="integrationModalLabel">Add New Integration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="integrationTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="payment-integration-tab" data-bs-toggle="tab" data-bs-target="#payment-integration" type="button" role="tab">Payment Switch</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mobile-integration-tab" data-bs-toggle="tab" data-bs-target="#mobile-integration" type="button" role="tab">Mobile/Portal</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="crm-integration-tab" data-bs-toggle="tab" data-bs-target="#crm-integration" type="button" role="tab">CRM System</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="message-integration-tab" data-bs-toggle="tab" data-bs-target="#message-integration" type="button" role="tab">Message Standard</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="integrationTypeTabsContent">
                    <div class="tab-pane fade show active" id="payment-integration" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="paymentIntegrationName" class="form-label">Integration Name</label>
                                    <input type="text" class="form-control" id="paymentIntegrationName" placeholder="e.g., SWIFT Network">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="paymentType" class="form-label">Integration Type</label>
                                    <select class="form-select" id="paymentType">
                                        <option value="PAYMENT_SWITCH">Payment Switch</option>
                                        <option value="RTGS">RTGS</option>
                                        <option value="SWIFT">SWIFT</option>
                                        <option value="LOCAL_NETWORK">Local Network</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="paymentEndpoint" class="form-label">Endpoint URL</label>
                                    <input type="url" class="form-control" id="paymentEndpoint" placeholder="https://...">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="paymentAuthMethod" class="form-label">Authentication Method</label>
                                    <select class="form-select" id="paymentAuthMethod">
                                        <option value="CERTIFICATE">Certificate</option>
                                        <option value="API_KEY">API Key</option>
                                        <option value="OAUTH">OAuth</option>
                                        <option value="NONE">None</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="paymentMessageFormat" class="form-label">Message Format</label>
                                    <select class="form-select" id="paymentMessageFormat">
                                        <option value="SWIFT">SWIFT MT/MX</option>
                                        <option value="ISO20022">ISO 20022</option>
                                        <option value="PROPRIETARY">Proprietary</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="paymentStatus" class="form-label">Status</label>
                                    <select class="form-select" id="paymentStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="mobile-integration" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="mobileIntegrationName" class="form-label">Integration Name</label>
                                    <input type="text" class="form-control" id="mobileIntegrationName" placeholder="e.g., Mobile Banking App">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="mobileType" class="form-label">Integration Type</label>
                                    <select class="form-select" id="mobileType">
                                        <option value="MOBILE_APP">Mobile App</option>
                                        <option value="WEB_PORTAL">Web Portal</option>
                                        <option value="API_GATEWAY">API Gateway</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="mobileEndpoint" class="form-label">Endpoint URL</label>
                                    <input type="url" class="form-control" id="mobileEndpoint" placeholder="https://...">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="mobileAuthMethod" class="form-label">Authentication Method</label>
                                    <select class="form-select" id="mobileAuthMethod">
                                        <option value="OAUTH">OAuth 2.0</option>
                                        <option value="JWT">JWT</option>
                                        <option value="API_KEY">API Key</option>
                                        <option value="SESSION">Session</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="crm-integration" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="crmIntegrationName" class="form-label">Integration Name</label>
                                    <input type="text" class="form-control" id="crmIntegrationName" placeholder="e.g., Salesforce CRM">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="crmType" class="form-label">Integration Type</label>
                                    <select class="form-select" id="crmType">
                                        <option value="CRM">CRM</option>
                                        <option value="INTERNAL_SYSTEM">Internal System</option>
                                        <option value="ERP">ERP</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="crmEndpoint" class="form-label">Endpoint URL</label>
                                    <input type="url" class="form-control" id="crmEndpoint" placeholder="https://...">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="crmAuthMethod" class="form-label">Authentication Method</label>
                                    <select class="form-select" id="crmAuthMethod">
                                        <option value="API_KEY">API Key</option>
                                        <option value="CERTIFICATE">Certificate</option>
                                        <option value="OAUTH">OAuth</option>
                                        <option value="BASIC">Basic Auth</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="message-integration" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="messageStandardName" class="form-label">Standard Name</label>
                                    <input type="text" class="form-control" id="messageStandardName" placeholder="e.g., SWIFT MT/MX">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="messageFormat" class="form-label">Message Format</label>
                                    <select class="form-select" id="messageFormat">
                                        <option value="SWIFT">SWIFT</option>
                                        <option value="ISO20022">ISO 20022</option>
                                        <option value="FIX">FIX</option>
                                        <option value="PROPRIETARY">Proprietary</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="messageVersion" class="form-label">Version</label>
                                    <input type="text" class="form-control" id="messageVersion" placeholder="e.g., 2023">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="messageStatus" class="form-label">Status</label>
                                    <select class="form-select" id="messageStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="mappingRules" class="form-label">Mapping Rules (JSON)</label>
                                <textarea class="form-control" id="mappingRules" rows="3">{"source_field": "target_field", "amount": "txn_amount"}</textarea>
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