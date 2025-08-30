<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Branch & Entity Setup</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#branchEntityModal">
                <i class="fas fa-plus me-2"></i>Add New Entity
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Branch Management</h5>
                <p class="card-text">Configure individual branch settings and parameters.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#branchModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Entity Management</h5>
                <p class="card-text">Set up legal entities and organizational structure.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#entityModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Regional Settings</h5>
                <p class="card-text">Configure regional holidays and compliance rules.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#regionalModal">
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
                <h5 class="mb-0">Existing Entities</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="entityTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="branches-tab" data-bs-toggle="tab" data-bs-target="#branches" type="button" role="tab">Branches</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="entities-tab" data-bs-toggle="tab" data-bs-target="#entities" type="button" role="tab">Entities</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regions-tab" data-bs-toggle="tab" data-bs-target="#regions" type="button" role="tab">Regional Settings</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="entityTabsContent">
                    <div class="tab-pane fade show active" id="branches" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Branch Code</th>
                                        <th>Branch Name</th>
                                        <th>Location</th>
                                        <th>Currency</th>
                                        <th>GL Prefix</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>HQ001</td>
                                        <td>Headquarters</td>
                                        <td>New York, NY</td>
                                        <td>USD</td>
                                        <td>NY</td>
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
                                        <td>LDN001</td>
                                        <td>London Branch</td>
                                        <td>London, UK</td>
                                        <td>GBP</td>
                                        <td>LN</td>
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
                                        <td>TKY001</td>
                                        <td>Tokyo Branch</td>
                                        <td>Tokyo, Japan</td>
                                        <td>JPY</td>
                                        <td>TY</td>
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
                    
                    <div class="tab-pane fade" id="entities" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Entity Code</th>
                                        <th>Entity Name</th>
                                        <th>Parent Entity</th>
                                        <th>Country</th>
                                        <th>Regulatory Regime</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>XYBANK</td>
                                        <td>XY Bank Ltd</td>
                                        <td>None</td>
                                        <td>Global</td>
                                        <td>Basel III</td>
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
                                        <td>XYBANK-US</td>
                                        <td>XY Bank USA Inc</td>
                                        <td>XYBANK</td>
                                        <td>USA</td>
                                        <td>Fed Regulations</td>
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
                    
                    <div class="tab-pane fade" id="regions" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Region</th>
                                        <th>Country</th>
                                        <th>Holidays</th>
                                        <th>Working Hours</th>
                                        <th>Compliance Rules</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>North America</td>
                                        <td>USA, Canada</td>
                                        <td>New Year, Independence Day, Christmas</td>
                                        <td>09:00-17:00</td>
                                        <td>Bank Secrecy Act, OFAC</td>
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
                                        <td>Europe</td>
                                        <td>UK, Germany, France</td>
                                        <td>New Year, Good Friday, Christmas</td>
                                        <td>09:00-17:30</td>
                                        <td>GDPR, MiFID II</td>
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

<!-- Branch & Entity Modal -->
<div class="modal fade" id="branchEntityModal" tabindex="-1" aria-labelledby="branchEntityModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="branchEntityModalLabel">Add New Entity</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="entityTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="branch-config-tab" data-bs-toggle="tab" data-bs-target="#branch-config" type="button" role="tab">Branch Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="entity-config-tab" data-bs-toggle="tab" data-bs-target="#entity-config" type="button" role="tab">Entity Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regional-config-tab" data-bs-toggle="tab" data-bs-target="#regional-config" type="button" role="tab">Regional Configuration</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="entityTypeTabsContent">
                    <div class="tab-pane fade show active" id="branch-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="branchCode" class="form-label">Branch Code</label>
                                    <input type="text" class="form-control" id="branchCode" placeholder="e.g., NYC001">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="branchName" class="form-label">Branch Name</label>
                                    <input type="text" class="form-control" id="branchName" placeholder="e.g., New York Branch">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="branchLocation" class="form-label">Location</label>
                                    <input type="text" class="form-control" id="branchLocation" placeholder="e.g., New York, NY">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="branchCurrency" class="form-label">Currency</label>
                                    <select class="form-select" id="branchCurrency">
                                        <option value="USD">USD - US Dollar</option>
                                        <option value="EUR">EUR - Euro</option>
                                        <option value="GBP">GBP - British Pound</option>
                                        <option value="JPY">JPY - Japanese Yen</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="glPrefix" class="form-label">GL Account Prefix</label>
                                    <input type="text" class="form-control" id="glPrefix" placeholder="e.g., NY">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="branchStatus" class="form-label">Status</label>
                                    <select class="form-select" id="branchStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="entity-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="entityCode" class="form-label">Entity Code</label>
                                    <input type="text" class="form-control" id="entityCode" placeholder="e.g., XYBANK-US">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="entityName" class="form-label">Entity Name</label>
                                    <input type="text" class="form-control" id="entityName" placeholder="e.g., XY Bank USA Inc">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="parentEntity" class="form-label">Parent Entity</label>
                                    <select class="form-select" id="parentEntity">
                                        <option value="">None</option>
                                        <option value="XYBANK">XYBANK - XY Bank Ltd</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="entityCountry" class="form-label">Country</label>
                                    <select class="form-select" id="entityCountry">
                                        <option value="GLOBAL">Global</option>
                                        <option value="USA">USA</option>
                                        <option value="UK">UK</option>
                                        <option value="JAPAN">Japan</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="regulatoryRegime" class="form-label">Regulatory Regime</label>
                                <input type="text" class="form-control" id="regulatoryRegime" placeholder="e.g., Fed Regulations">
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="regional-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="regionName" class="form-label">Region Name</label>
                                    <input type="text" class="form-control" id="regionName" placeholder="e.g., North America">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="regionCountries" class="form-label">Countries</label>
                                    <input type="text" class="form-control" id="regionCountries" placeholder="e.g., USA, Canada">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="regionalHolidays" class="form-label">Holidays (JSON)</label>
                                <textarea class="form-control" id="regionalHolidays" rows="2">["New Year", "Independence Day", "Christmas"]</textarea>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="workingHours" class="form-label">Working Hours</label>
                                    <input type="text" class="form-control" id="workingHours" placeholder="e.g., 09:00-17:00">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="complianceRules" class="form-label">Compliance Rules</label>
                                    <input type="text" class="form-control" id="complianceRules" placeholder="e.g., Bank Secrecy Act">
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