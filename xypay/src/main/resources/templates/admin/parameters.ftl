<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Parameter Maintenance</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#parameterModal">
                <i class="fas fa-plus me-2"></i>Add New Parameter
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">System Parameters</h5>
                <p class="card-text">Core system configuration parameters.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#systemParamModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Business Parameters</h5>
                <p class="card-text">Business rule configuration parameters.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#businessParamModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Regulatory Parameters</h5>
                <p class="card-text">Compliance and regulatory parameters.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#regulatoryParamModal">
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
                <h5 class="mb-0">Existing Parameters</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="parameterTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="system-tab" data-bs-toggle="tab" data-bs-target="#system" type="button" role="tab">System Parameters</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="business-tab" data-bs-toggle="tab" data-bs-target="#business" type="button" role="tab">Business Parameters</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regulatory-tab" data-bs-toggle="tab" data-bs-target="#regulatory" type="button" role="tab">Regulatory Parameters</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="parameterTabsContent">
                    <div class="tab-pane fade show active" id="system" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Parameter Name</th>
                                        <th>Value</th>
                                        <th>Data Type</th>
                                        <th>Description</th>
                                        <th>Last Updated</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>BANK_NAME</td>
                                        <td>XY Bank</td>
                                        <td>String</td>
                                        <td>Name of the bank</td>
                                        <td>2023-01-01</td>
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
                                        <td>BANK_CODE</td>
                                        <td>XY001</td>
                                        <td>String</td>
                                        <td>Unique bank code</td>
                                        <td>2023-01-01</td>
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
                                        <td>DEFAULT_CURRENCY</td>
                                        <td>USD</td>
                                        <td>String</td>
                                        <td>Default currency for the system</td>
                                        <td>2023-01-01</td>
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
                    
                    <div class="tab-pane fade" id="business" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Parameter Name</th>
                                        <th>Value</th>
                                        <th>Data Type</th>
                                        <th>Description</th>
                                        <th>Last Updated</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>MAX_LOGIN_ATTEMPTS</td>
                                        <td>3</td>
                                        <td>Integer</td>
                                        <td>Maximum login attempts before lockout</td>
                                        <td>2023-01-05</td>
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
                                        <td>CUTOFF_TIME</td>
                                        <td>17:00:00</td>
                                        <td>Time</td>
                                        <td>Daily processing cutoff time</td>
                                        <td>2023-01-05</td>
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
                    
                    <div class="tab-pane fade" id="regulatory" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Parameter Name</th>
                                        <th>Value</th>
                                        <th>Data Type</th>
                                        <th>Description</th>
                                        <th>Last Updated</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>AML_THRESHOLD</td>
                                        <td>10000</td>
                                        <td>Decimal</td>
                                        <td>AML reporting threshold</td>
                                        <td>2023-01-10</td>
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
                                        <td>RETENTION_PERIOD</td>
                                        <td>7</td>
                                        <td>Integer</td>
                                        <td>Audit log retention period (years)</td>
                                        <td>2023-01-10</td>
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

<!-- Parameter Configuration Modal -->
<div class="modal fade" id="parameterModal" tabindex="-1" aria-labelledby="parameterModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="parameterModalLabel">Add New Parameter</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="parameterTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="system-param-tab" data-bs-toggle="tab" data-bs-target="#system-param" type="button" role="tab">System Parameter</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="business-param-tab" data-bs-toggle="tab" data-bs-target="#business-param" type="button" role="tab">Business Parameter</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regulatory-param-tab" data-bs-toggle="tab" data-bs-target="#regulatory-param" type="button" role="tab">Regulatory Parameter</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="parameterTypeTabsContent">
                    <div class="tab-pane fade show active" id="system-param" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="systemParamName" class="form-label">Parameter Name</label>
                                    <input type="text" class="form-control" id="systemParamName" placeholder="e.g., BANK_NAME">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="systemParamValue" class="form-label">Parameter Value</label>
                                    <input type="text" class="form-control" id="systemParamValue" placeholder="e.g., XY Bank">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="systemParamType" class="form-label">Data Type</label>
                                    <select class="form-select" id="systemParamType">
                                        <option value="STRING">String</option>
                                        <option value="INTEGER">Integer</option>
                                        <option value="DECIMAL">Decimal</option>
                                        <option value="BOOLEAN">Boolean</option>
                                        <option value="DATE">Date</option>
                                        <option value="TIME">Time</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="systemParamStatus" class="form-label">Status</label>
                                    <select class="form-select" id="systemParamStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="systemParamDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="systemParamDescription" rows="2" placeholder="Description of the parameter"></textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="business-param" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="businessParamName" class="form-label">Parameter Name</label>
                                    <input type="text" class="form-control" id="businessParamName" placeholder="e.g., MAX_LOGIN_ATTEMPTS">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="businessParamValue" class="form-label">Parameter Value</label>
                                    <input type="text" class="form-control" id="businessParamValue" placeholder="e.g., 3">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="businessParamType" class="form-label">Data Type</label>
                                    <select class="form-select" id="businessParamType">
                                        <option value="STRING">String</option>
                                        <option value="INTEGER" selected>Integer</option>
                                        <option value="DECIMAL">Decimal</option>
                                        <option value="BOOLEAN">Boolean</option>
                                        <option value="DATE">Date</option>
                                        <option value="TIME">Time</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="businessParamStatus" class="form-label">Status</label>
                                    <select class="form-select" id="businessParamStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="businessParamDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="businessParamDescription" rows="2" placeholder="Description of the parameter"></textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="regulatory-param" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryParamName" class="form-label">Parameter Name</label>
                                    <input type="text" class="form-control" id="regulatoryParamName" placeholder="e.g., AML_THRESHOLD">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryParamValue" class="form-label">Parameter Value</label>
                                    <input type="text" class="form-control" id="regulatoryParamValue" placeholder="e.g., 10000">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryParamType" class="form-label">Data Type</label>
                                    <select class="form-select" id="regulatoryParamType">
                                        <option value="STRING">String</option>
                                        <option value="INTEGER">Integer</option>
                                        <option value="DECIMAL" selected>Decimal</option>
                                        <option value="BOOLEAN">Boolean</option>
                                        <option value="DATE">Date</option>
                                        <option value="TIME">Time</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryParamStatus" class="form-label">Status</label>
                                    <select class="form-select" id="regulatoryParamStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="regulatoryParamDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="regulatoryParamDescription" rows="2" placeholder="Description of the parameter"></textarea>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save Parameter</button>
            </div>
        </div>
    </div>
</div>
</#macro>

<@content/>