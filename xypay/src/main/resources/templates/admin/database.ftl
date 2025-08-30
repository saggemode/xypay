<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Database Tools</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#queryModal">
                <i class="fas fa-plus me-2"></i>New Query
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Query Executor</h5>
                <p class="card-text">Execute custom database queries for advanced operations.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#queryExecutorModal">
                    Execute Query
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Data Export</h5>
                <p class="card-text">Export data in various formats for reporting purposes.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exportModal">
                    Export Data
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Database Utilities</h5>
                <p class="card-text">Database maintenance and utility operations.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#utilityModal">
                    Utilities
                </button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Recent Queries</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Query Name</th>
                                <th>Query Text</th>
                                <th>Type</th>
                                <th>Executed By</th>
                                <th>Execution Time</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Customer List</td>
                                <td>SELECT * FROM customers WHERE status = 'ACTIVE'</td>
                                <td>SELECT</td>
                                <td>admin</td>
                                <td>2023-01-15 10:30:00</td>
                                <td><span class="badge bg-success">Success</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-play"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Update Account Balance</td>
                                <td>UPDATE accounts SET balance = balance + 100 WHERE id = 123</td>
                                <td>UPDATE</td>
                                <td>manager</td>
                                <td>2023-01-14 14:15:00</td>
                                <td><span class="badge bg-success">Success</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-play"></i>
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

<div class="row mt-4">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Query Results</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Account Number</th>
                                <th>Balance</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>John Doe</td>
                                <td>john.doe@example.com</td>
                                <td>ACC001</td>
                                <td>$1,500.00</td>
                                <td>Active</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jane Smith</td>
                                <td>jane.smith@example.com</td>
                                <td>ACC002</td>
                                <td>$2,300.00</td>
                                <td>Active</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Robert Johnson</td>
                                <td>robert.j@example.com</td>
                                <td>ACC003</td>
                                <td>$500.00</td>
                                <td>Active</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Query Modal -->
<div class="modal fade" id="queryModal" tabindex="-1" aria-labelledby="queryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="queryModalLabel">Database Query</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="queryTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="sql-query-tab" data-bs-toggle="tab" data-bs-target="#sql-query" type="button" role="tab">SQL Query</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="query-builder-tab" data-bs-toggle="tab" data-bs-target="#query-builder" type="button" role="tab">Query Builder</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="queryTabsContent">
                    <div class="tab-pane fade show active" id="sql-query" role="tabpanel">
                        <form>
                            <div class="mb-3">
                                <label for="queryName" class="form-label">Query Name</label>
                                <input type="text" class="form-control" id="queryName" placeholder="e.g., Customer List">
                            </div>
                            <div class="mb-3">
                                <label for="sqlQuery" class="form-label">SQL Query</label>
                                <textarea class="form-control" id="sqlQuery" rows="8" placeholder="Enter your SQL query here...">SELECT * FROM customers WHERE status = 'ACTIVE'</textarea>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="queryType" class="form-label">Query Type</label>
                                    <select class="form-select" id="queryType">
                                        <option value="SELECT" selected>SELECT</option>
                                        <option value="INSERT">INSERT</option>
                                        <option value="UPDATE">UPDATE</option>
                                        <option value="DELETE">DELETE</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="queryTimeout" class="form-label">Timeout (seconds)</label>
                                    <input type="number" class="form-control" id="queryTimeout" value="30">
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="query-builder" role="tabpanel">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="tableSelect" class="form-label">Table</label>
                                    <select class="form-select" id="tableSelect">
                                        <option value="customers">customers</option>
                                        <option value="accounts">accounts</option>
                                        <option value="transactions">transactions</option>
                                        <option value="journal_entries">journal_entries</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Columns</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="selectAllColumns" checked>
                                        <label class="form-check-label" for="selectAllColumns">
                                            Select All
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="idColumn" checked>
                                        <label class="form-check-label" for="idColumn">
                                            id
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="nameColumn" checked>
                                        <label class="form-check-label" for="nameColumn">
                                            name
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="emailColumn" checked>
                                        <label class="form-check-label" for="emailColumn">
                                            email
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="whereCondition" class="form-label">WHERE Condition</label>
                                    <input type="text" class="form-control" id="whereCondition" placeholder="e.g., status = 'ACTIVE'">
                                </div>
                                <div class="mb-3">
                                    <label for="orderBy" class="form-label">ORDER BY</label>
                                    <input type="text" class="form-control" id="orderBy" placeholder="e.g., name ASC">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <label for="limitRows" class="form-label">LIMIT</label>
                                    <input type="number" class="form-control" id="limitRows" placeholder="e.g., 100">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Execute Query</button>
            </div>
        </div>
    </div>
</div>
</#macro>

<@content/>