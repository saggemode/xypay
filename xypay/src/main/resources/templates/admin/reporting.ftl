<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Reporting & Analytics</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reportingModal">
                <i class="fas fa-plus me-2"></i>Add New Report
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Financial Reports</h5>
                <p class="card-text">Configure trial balances, GL summaries, and financial statements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#financialReportModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Regulatory Reports</h5>
                <p class="card-text">Set up reports for compliance with regulatory requirements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#regulatoryReportModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Performance Dashboards</h5>
                <p class="card-text">Create dashboards for operational and business performance.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#dashboardModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Report Scheduling</h5>
                <p class="card-text">Schedule automated report generation and distribution.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#schedulingModal">
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
                <h5 class="mb-0">Existing Reports</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="reportTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="financial-tab" data-bs-toggle="tab" data-bs-target="#financial" type="button" role="tab">Financial Reports</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regulatory-tab" data-bs-toggle="tab" data-bs-target="#regulatory" type="button" role="tab">Regulatory Reports</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="dashboards-tab" data-bs-toggle="tab" data-bs-target="#dashboards" type="button" role="tab">Dashboards</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="scheduling-tab" data-bs-toggle="tab" data-bs-target="#scheduling" type="button" role="tab">Scheduling</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="reportTabsContent">
                    <div class="tab-pane fade show active" id="financial" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Report Name</th>
                                        <th>Type</th>
                                        <th>Format</th>
                                        <th>Last Generated</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Trial Balance</td>
                                        <td>Financial</td>
                                        <td>PDF, Excel</td>
                                        <td>2023-01-15 06:00</td>
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
                                        <td>General Ledger Summary</td>
                                        <td>Financial</td>
                                        <td>PDF, Excel</td>
                                        <td>2023-01-15 06:00</td>
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
                    
                    <div class="tab-pane fade" id="regulatory" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Report Name</th>
                                        <th>Regulation</th>
                                        <th>Frequency</th>
                                        <th>Format</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Basel III Capital Report</td>
                                        <td>Basel III</td>
                                        <td>Monthly</td>
                                        <td>PDF, XML</td>
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
                                        <td>AML Transaction Report</td>
                                        <td>FINCEN</td>
                                        <td>Daily</td>
                                        <td>XML</td>
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
                    
                    <div class="tab-pane fade" id="dashboards" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Dashboard Name</th>
                                        <th>Target Audience</th>
                                        <th>Widgets</th>
                                        <th>Last Updated</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Executive Dashboard</td>
                                        <td>Management</td>
                                        <td>KPIs, Financial Summary, Alerts</td>
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
                                        <td>Operations Dashboard</td>
                                        <td>Operations Team</td>
                                        <td>Transaction Volumes, System Health, Performance</td>
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
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="scheduling" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Schedule Name</th>
                                        <th>Report</th>
                                        <th>Frequency</th>
                                        <th>Recipients</th>
                                        <th>Last Run</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Daily Financial Summary</td>
                                        <td>Trial Balance</td>
                                        <td>Daily at 06:00</td>
                                        <td>management@bank.com, finance@bank.com</td>
                                        <td>2023-01-15 06:00</td>
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
                                        <td>Weekly Regulatory Report</td>
                                        <td>Basel III Capital Report</td>
                                        <td>Weekly on Mondays at 07:00</td>
                                        <td>regulatory@bank.com</td>
                                        <td>2023-01-09 07:00</td>
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

<!-- Reporting Configuration Modal -->
<div class="modal fade" id="reportingModal" tabindex="-1" aria-labelledby="reportingModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportingModalLabel">Add New Report</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="reportTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="financial-report-tab" data-bs-toggle="tab" data-bs-target="#financial-report" type="button" role="tab">Financial Report</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="regulatory-report-tab" data-bs-toggle="tab" data-bs-target="#regulatory-report" type="button" role="tab">Regulatory Report</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="dashboard-report-tab" data-bs-toggle="tab" data-bs-target="#dashboard-report" type="button" role="tab">Dashboard</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="schedule-report-tab" data-bs-toggle="tab" data-bs-target="#schedule-report" type="button" role="tab">Schedule</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="reportTypeTabsContent">
                    <div class="tab-pane fade show active" id="financial-report" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="financialReportName" class="form-label">Report Name</label>
                                    <input type="text" class="form-control" id="financialReportName" placeholder="e.g., Trial Balance">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="financialReportType" class="form-label">Report Type</label>
                                    <select class="form-select" id="financialReportType">
                                        <option value="TRIAL_BALANCE">Trial Balance</option>
                                        <option value="GENERAL_LEDGER">General Ledger</option>
                                        <option value="INCOME_STATEMENT">Income Statement</option>
                                        <option value="BALANCE_SHEET">Balance Sheet</option>
                                        <option value="CASH_FLOW">Cash Flow Statement</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="financialReportFormat" class="form-label">Output Format</label>
                                    <select class="form-select" id="financialReportFormat" multiple>
                                        <option value="PDF" selected>PDF</option>
                                        <option value="EXCEL" selected>Excel</option>
                                        <option value="CSV">CSV</option>
                                        <option value="HTML">HTML</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="financialReportStatus" class="form-label">Status</label>
                                    <select class="form-select" id="financialReportStatus">
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="regulatory-report" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryReportName" class="form-label">Report Name</label>
                                    <input type="text" class="form-control" id="regulatoryReportName" placeholder="e.g., Basel III Capital Report">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="regulation" class="form-label">Regulation</label>
                                    <input type="text" class="form-control" id="regulation" placeholder="e.g., Basel III, FINCEN">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryFrequency" class="form-label">Frequency</label>
                                    <select class="form-select" id="regulatoryFrequency">
                                        <option value="DAILY">Daily</option>
                                        <option value="WEEKLY">Weekly</option>
                                        <option value="MONTHLY">Monthly</option>
                                        <option value="QUARTERLY">Quarterly</option>
                                        <option value="ANNUALLY">Annually</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="regulatoryFormat" class="form-label">Output Format</label>
                                    <select class="form-select" id="regulatoryFormat">
                                        <option value="PDF">PDF</option>
                                        <option value="XML" selected>XML</option>
                                        <option value="JSON">JSON</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="dashboard-report" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="dashboardName" class="form-label">Dashboard Name</label>
                                    <input type="text" class="form-control" id="dashboardName" placeholder="e.g., Executive Dashboard">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="targetAudience" class="form-label">Target Audience</label>
                                    <input type="text" class="form-control" id="targetAudience" placeholder="e.g., Management, Operations">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="dashboardWidgets" class="form-label">Widgets (JSON)</label>
                                <textarea class="form-control" id="dashboardWidgets" rows="3">[{"type": "KPI", "data": "financial_metrics"}, {"type": "CHART", "data": "transaction_volumes"}]</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="schedule-report" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="scheduleName" class="form-label">Schedule Name</label>
                                    <input type="text" class="form-control" id="scheduleName" placeholder="e.g., Daily Financial Summary">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="scheduledReport" class="form-label">Report</label>
                                    <select class="form-select" id="scheduledReport">
                                        <option value="TRIAL_BALANCE">Trial Balance</option>
                                        <option value="GENERAL_LEDGER">General Ledger</option>
                                        <option value="BASEL_REPORT">Basel III Capital Report</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="scheduleFrequency" class="form-label">Frequency</label>
                                    <select class="form-select" id="scheduleFrequency">
                                        <option value="DAILY">Daily</option>
                                        <option value="WEEKLY">Weekly</option>
                                        <option value="MONTHLY">Monthly</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="scheduleTime" class="form-label">Time</label>
                                    <input type="time" class="form-control" id="scheduleTime" value="06:00">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="scheduleRecipients" class="form-label">Recipients (comma separated)</label>
                                <input type="text" class="form-control" id="scheduleRecipients" placeholder="e.g., management@bank.com, finance@bank.com">
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