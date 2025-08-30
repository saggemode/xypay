<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Scripting</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scriptModal">
                <i class="fas fa-plus me-2"></i>New Script
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">JavaScript Executor</h5>
                <p class="card-text">Execute custom JavaScript for advanced logic.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#jsExecutorModal">
                    Execute Script
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Script Library</h5>
                <p class="card-text">Manage and organize reusable scripts.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#libraryModal">
                    Script Library
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Script Scheduler</h5>
                <p class="card-text">Schedule scripts to run at specific times.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#schedulerModal">
                    Schedule Script
                </button>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Recent Scripts</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Script Name</th>
                                <th>Description</th>
                                <th>Language</th>
                                <th>Last Executed</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Calculate Interest</td>
                                <td>Calculate monthly interest for all savings accounts</td>
                                <td>JavaScript</td>
                                <td>2023-01-15 01:00:00</td>
                                <td><span class="badge bg-success">Success</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-play"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-info me-1">
                                        <i class="fas fa-edit"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-danger">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Generate Reports</td>
                                <td>Generate daily transaction reports</td>
                                <td>JavaScript</td>
                                <td>2023-01-15 06:00:00</td>
                                <td><span class="badge bg-success">Success</span></td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-1">
                                        <i class="fas fa-play"></i>
                                    </button>
                                    <button class="btn btn-sm btn-outline-info me-1">
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

<div class="row mt-4">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0">Script Editor</h5>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label for="scriptName" class="form-label">Script Name</label>
                    <input type="text" class="form-control" id="scriptName" placeholder="e.g., Calculate Interest">
                </div>
                <div class="mb-3">
                    <label for="scriptDescription" class="form-label">Description</label>
                    <textarea class="form-control" id="scriptDescription" rows="2" placeholder="Brief description of what the script does"></textarea>
                </div>
                <div class="mb-3">
                    <label for="scriptLanguage" class="form-label">Language</label>
                    <select class="form-select" id="scriptLanguage">
                        <option value="javascript" selected>JavaScript</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="scriptCode" class="form-label">Script Code</label>
                    <textarea class="form-control" id="scriptCode" rows="15" placeholder="Enter your script code here">// Example script to calculate interest
function calculateInterest(principal, rate, time) {
    return principal * rate * time / 100;
}

// Get all savings accounts
var accounts = db.query("SELECT * FROM accounts WHERE account_type = 'SAVINGS'");

// Calculate and apply interest for each account
for (var i = 0; i < accounts.length; i++) {
    var account = accounts[i];
    var interest = calculateInterest(account.balance, 2.5, 1/12); // Monthly interest at 2.5% annual rate
    
    // Update account balance
    db.execute("UPDATE accounts SET balance = balance + ? WHERE id = ?", [interest, account.id]);
    
    // Log the transaction
    db.execute("INSERT INTO transactions (account_id, amount, type, description) VALUES (?, ?, 'CREDIT', 'Monthly Interest')", 
               [account.id, interest]);
}

return "Interest calculation completed for " + accounts.length + " accounts";</textarea>
                </div>
                <div class="d-flex justify-content-between">
                    <div>
                        <button class="btn btn-success">
                            <i class="fas fa-play me-2"></i>Run Script
                        </button>
                        <button class="btn btn-secondary ms-2">
                            <i class="fas fa-save me-2"></i>Save Script
                        </button>
                    </div>
                    <div>
                        <button class="btn btn-info">
                            <i class="fas fa-check-circle me-2"></i>Validate Script
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Script Modal -->
<div class="modal fade" id="scriptModal" tabindex="-1" aria-labelledby="scriptModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="scriptModalLabel">Script Editor</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="scriptTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="editor-tab" data-bs-toggle="tab" data-bs-target="#editor" type="button" role="tab">Editor</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="variables-tab" data-bs-toggle="tab" data-bs-target="#variables" type="button" role="tab">Variables</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="output-tab" data-bs-toggle="tab" data-bs-target="#output" type="button" role="tab">Output</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="scriptTabsContent">
                    <div class="tab-pane fade show active" id="editor" role="tabpanel">
                        <form>
                            <div class="mb-3">
                                <label for="modalScriptName" class="form-label">Script Name</label>
                                <input type="text" class="form-control" id="modalScriptName" placeholder="e.g., Calculate Interest">
                            </div>
                            <div class="mb-3">
                                <label for="modalScriptDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="modalScriptDescription" rows="2" placeholder="Brief description of what the script does"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="modalScriptLanguage" class="form-label">Language</label>
                                <select class="form-select" id="modalScriptLanguage">
                                    <option value="javascript" selected>JavaScript</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="modalScriptCode" class="form-label">Script Code</label>
                                <textarea class="form-control" id="modalScriptCode" rows="10" placeholder="Enter your script code here"></textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="variables" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Variable Name</th>
                                        <th>Type</th>
                                        <th>Description</th>
                                        <th>Example Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>db</td>
                                        <td>Database</td>
                                        <td>Database access object</td>
                                        <td>db.query("SELECT * FROM accounts")</td>
                                    </tr>
                                    <tr>
                                        <td>logger</td>
                                        <td>Logger</td>
                                        <td>Logging utility</td>
                                        <td>logger.info("Processing account")</td>
                                    </tr>
                                    <tr>
                                        <td>config</td>
                                        <td>Object</td>
                                        <td>System configuration</td>
                                        <td>config.BANK_NAME</td>
                                    </tr>
                                    <tr>
                                        <td>utils</td>
                                        <td>Object</td>
                                        <td>Utility functions</td>
                                        <td>utils.formatDate(new Date())</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="output" role="tabpanel">
                        <div class="bg-dark text-light p-3" style="min-height: 300px; max-height: 300px; overflow-y: auto;">
                            <pre>// Script output will appear here
> Script execution started: 2023-01-15 14:30:00
> Executing script: Calculate Interest
> Found 1250 savings accounts
> Interest calculation completed for 1250 accounts
> Script execution finished: 2023-01-15 14:30:15</pre>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info">
                    <i class="fas fa-check-circle me-2"></i>Validate
                </button>
                <button type="button" class="btn btn-success">
                    <i class="fas fa-play me-2"></i>Run Script
                </button>
            </div>
        </div>
    </div>
</div>
</#macro>

<@content/>