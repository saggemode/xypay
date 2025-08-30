<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Workflow & Authorization</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#workflowModal">
                <i class="fas fa-plus me-2"></i>Add New Workflow
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Field Access Control</h5>
                <p class="card-text">Configure field-level permissions for different user roles.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#fieldAccessModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Approval Workflows</h5>
                <p class="card-text">Set up multi-step approval processes for various operations.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#approvalWorkflowModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">UI Customization</h5>
                <p class="card-text">Customize user interface elements and navigation.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#uiCustomizationModal">
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
                <h5 class="mb-0">Existing Workflows</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="workflowTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="field-access-tab" data-bs-toggle="tab" data-bs-target="#field-access" type="button" role="tab">Field Access Control</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="approval-tab" data-bs-toggle="tab" data-bs-target="#approval" type="button" role="tab">Approval Workflows</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="ui-tab" data-bs-toggle="tab" data-bs-target="#ui" type="button" role="tab">UI Customization</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="workflowTabsContent">
                    <div class="tab-pane fade show active" id="field-access" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Process Type</th>
                                        <th>Role</th>
                                        <th>Accessible Fields</th>
                                        <th>Permissions</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Customer Onboarding</td>
                                        <td>Teller</td>
                                        <td>Name, Address, Phone</td>
                                        <td>View, Edit</td>
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
                                        <td>Customer Onboarding</td>
                                        <td>Manager</td>
                                        <td>All Fields</td>
                                        <td>View, Edit, Approve</td>
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
                    
                    <div class="tab-pane fade" id="approval" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Workflow Name</th>
                                        <th>Process Type</th>
                                        <th>Steps</th>
                                        <th>Roles</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Loan Approval</td>
                                        <td>Loan Processing</td>
                                        <td>3</td>
                                        <td>Loan Officer, Manager, Head Officer</td>
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
                                        <td>High-Value Transfer</td>
                                        <td>Transaction Processing</td>
                                        <td>2</td>
                                        <td>Teller, Manager</td>
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
                    
                    <div class="tab-pane fade" id="ui" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Customization Name</th>
                                        <th>Target Role</th>
                                        <th>Customizations</th>
                                        <th>Last Updated</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Manager UI</td>
                                        <td>Manager</td>
                                        <td>Additional menu items, extended fields</td>
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
                                        <td>Spanish Localization</td>
                                        <td>All</td>
                                        <td>UI labels, error messages</td>
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

<!-- Workflow Configuration Modal -->
<div class="modal fade" id="workflowModal" tabindex="-1" aria-labelledby="workflowModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="workflowModalLabel">Add New Workflow</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="workflowTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="field-access-config-tab" data-bs-toggle="tab" data-bs-target="#field-access-config" type="button" role="tab">Field Access Control</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="approval-config-tab" data-bs-toggle="tab" data-bs-target="#approval-config" type="button" role="tab">Approval Workflow</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="ui-config-tab" data-bs-toggle="tab" data-bs-target="#ui-config" type="button" role="tab">UI Customization</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="workflowTypeTabsContent">
                    <div class="tab-pane fade show active" id="field-access-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="processType" class="form-label">Process Type</label>
                                    <select class="form-select" id="processType">
                                        <option value="CUSTOMER_ONBOARDING">Customer Onboarding</option>
                                        <option value="ACCOUNT_OPENING">Account Opening</option>
                                        <option value="LOAN_APPLICATION">Loan Application</option>
                                        <option value="TRANSACTION_PROCESSING">Transaction Processing</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="userRole" class="form-label">User Role</label>
                                    <select class="form-select" id="userRole">
                                        <option value="TELLER">Teller</option>
                                        <option value="MANAGER">Manager</option>
                                        <option value="HEAD_OFFICER">Head Officer</option>
                                        <option value="COMPLIANCE">Compliance Officer</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="accessibleFields" class="form-label">Accessible Fields (JSON)</label>
                                <textarea class="form-control" id="accessibleFields" rows="2">["NAME", "ADDRESS", "PHONE"]</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="fieldPermissions" class="form-label">Permissions (JSON)</label>
                                <textarea class="form-control" id="fieldPermissions" rows="2">["VIEW", "EDIT"]</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="approval-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="workflowName" class="form-label">Workflow Name</label>
                                    <input type="text" class="form-control" id="workflowName" placeholder="e.g., Loan Approval">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="approvalProcessType" class="form-label">Process Type</label>
                                    <select class="form-select" id="approvalProcessType">
                                        <option value="LOAN_PROCESSING">Loan Processing</option>
                                        <option value="TRANSACTION_PROCESSING">Transaction Processing</option>
                                        <option value="ACCOUNT_OPENING">Account Opening</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="workflowSteps" class="form-label">Workflow Steps (JSON)</label>
                                <textarea class="form-control" id="workflowSteps" rows="3">[{"step": 1, "role": "LOAN_OFFICER", "action": "INITIATE"}, {"step": 2, "role": "MANAGER", "action": "APPROVE"}]</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="ui-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="customizationName" class="form-label">Customization Name</label>
                                    <input type="text" class="form-control" id="customizationName" placeholder="e.g., Manager UI">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="targetRole" class="form-label">Target Role</label>
                                    <select class="form-select" id="targetRole">
                                        <option value="ALL">All</option>
                                        <option value="TELLER">Teller</option>
                                        <option value="MANAGER">Manager</option>
                                        <option value="HEAD_OFFICER">Head Officer</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="uiCustomizations" class="form-label">Customizations (JSON)</label>
                                <textarea class="form-control" id="uiCustomizations" rows="3">{"menu_items": ["reports", "admin"], "fields": ["risk_rating", "additional_info"]}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="languageSettings" class="form-label">Language Settings (JSON)</label>
                                <textarea class="form-control" id="languageSettings" rows="2">{"language": "es", "labels": {"customer_name": "Nombre del Cliente"}}</textarea>
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