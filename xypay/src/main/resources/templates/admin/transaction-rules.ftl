<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Transaction Rules</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#transactionRuleModal">
                <i class="fas fa-plus me-2"></i>Add New Rule
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Limit Rules</h5>
                <p class="card-text">Configure transaction limits for customers and accounts.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#limitRuleModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Approval Rules</h5>
                <p class="card-text">Set up multi-level approval workflows for transactions.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#approvalRuleModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Currency Rules</h5>
                <p class="card-text">Define FX conversion rules and spreads.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#currencyRuleModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Cut-off Rules</h5>
                <p class="card-text">Set transaction cut-off times and hold periods.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#cutoffRuleModal">
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
                <h5 class="mb-0">Existing Rules</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="ruleTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="limit-tab" data-bs-toggle="tab" data-bs-target="#limit" type="button" role="tab">Limit Rules</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="approval-tab" data-bs-toggle="tab" data-bs-target="#approval" type="button" role="tab">Approval Rules</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="currency-tab" data-bs-toggle="tab" data-bs-target="#currency" type="button" role="tab">Currency Rules</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="cutoff-tab" data-bs-toggle="tab" data-bs-target="#cutoff" type="button" role="tab">Cut-off Rules</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="ruleTabsContent">
                    <div class="tab-pane fade show active" id="limit" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Rule Name</th>
                                        <th>Customer Type</th>
                                        <th>Daily Limit</th>
                                        <th>Weekly Limit</th>
                                        <th>Monthly Limit</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>RETAIL_DAILY_LIMIT</td>
                                        <td>Retail</td>
                                        <td>$5,000.00</td>
                                        <td>$20,000.00</td>
                                        <td>$50,000.00</td>
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
                                        <td>CORPORATE_DAILY_LIMIT</td>
                                        <td>Corporate</td>
                                        <td>$50,000.00</td>
                                        <td>$200,000.00</td>
                                        <td>$1,000,000.00</td>
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
                                        <th>Rule Name</th>
                                        <th>Threshold Amount</th>
                                        <th>Approval Levels</th>
                                        <th>Applicable To</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>HIGH_VALUE_TRANSFER</td>
                                        <td>$50,000.00</td>
                                        <td>2</td>
                                        <td>Corporate, VIP</td>
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
                                        <td>LOAN_DISBURSEMENT</td>
                                        <td>$100,000.00</td>
                                        <td>3</td>
                                        <td>All</td>
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
                    
                    <div class="tab-pane fade" id="currency" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Rule Name</th>
                                        <th>Currency Pair</th>
                                [1983 chars omitted]