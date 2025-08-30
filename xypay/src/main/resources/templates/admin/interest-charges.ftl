<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Interest & Charges Setup</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#interestChargeModal">
                <i class="fas fa-plus me-2"></i>Add New Configuration
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Interest Configurations</h5>
                <p class="card-text">Define interest calculation methods and rates.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#interestConfigModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Charge Configurations</h5>
                <p class="card-text">Set up fees and penalties for various operations.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#chargeConfigModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Penalty Rules</h5>
                <p class="card-text">Define penalty charges for late payments or overdrafts.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#penaltyRuleModal">
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
                <ul class="nav nav-tabs mb-3" id="configTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="interest-tab" data-bs-toggle="tab" data-bs-target="#interest" type="button" role="tab">Interest Configurations</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="charge-tab" data-bs-toggle="tab" data-bs-target="#charge" type="button" role="tab">Charge Configurations</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="penalty-tab" data-bs-toggle="tab" data-bs-target="#penalty" type="button" role="tab">Penalty Rules</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="configTabsContent">
                    <div class="tab-pane fade show active" id="interest" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Configuration Name</th>
                                        <th>Calculation Method</th>
                                        <th>Compounding Frequency</th>
                                        <th>Standard Rate</th>
                                        <th>Preferential Rate</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>SAVINGS_INTEREST</td>
                                        <td>Compound</td>
                                        <td>Monthly</td>
                                        <td>2.5%</td>
                                        <td>3.5% (VIP)</td>
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
                                        <td>CURRENT_ACCOUNT_INTEREST</td>
                                        <td>Simple</td>
                                        <td>Daily</td>
                                        <td>1.0%</td>
                                        <td>1.5% (VIP)</td>
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
                    
                    <div class="tab-pane fade" id="charge" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Charge Name</th>
                                        <th>Charge Type</th>
                                        <th>Amount</th>
                                        <th>Percentage</th>
                                        <th>Min/Max Amount</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>ATM_WITHDRAWAL_FEE</td>
                                        <td>Withdrawal</td>
                                        <td>$2.00</td>
                                        <td>0.5%</td>
                                        <td>$1.00 - $10.00</td>
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
                                        <td>ACCOUNT_MAINTENANCE_FEE</td>
                                        <td>Maintenance</td>
                                        <td>$25.00</td>
                                        <td>-</td>
                                        <td>-</td>
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
                    
                    <div class="tab-pane fade" id="penalty" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Rule Name</th>
                                        <th>Applicable To</th>
                                        <th>Penalty Type</th>
                                        <th>Rate/Amount</th>
                                        <th>Grace Period</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>LATE_PAYMENT_PENALTY</td>
                                        <td>Loans</td>
                                        <td>Percentage</td>
                                        <td>2.0%</td>
                                        <td>30 days</td>
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
                                        <td>OVERDRAFT_PENALTY</td>
                                        <td>Accounts</td>
                                        <td>Fixed Amount</td>
                                        <td>$35.00</td>
                                        <td>None</td>
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

<!-- Interest & Charges Modal -->
<div class="modal fade" id="interestChargeModal" tabindex="-1" aria-labelledby="interestChargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="interestChargeModalLabel">Add New Configuration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="configTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="interest-config-tab" data-bs-toggle="tab" data-bs-target="#interest-config" type="button" role="tab">Interest Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="charge-config-tab" data-bs-toggle="tab" data-bs-target="#charge-config" type="button" role="tab">Charge Configuration</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="penalty-config-tab" data-bs-toggle="tab" data-bs-target="#penalty-config" type="button" role="tab">Penalty Rule</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="configTypeTabsContent">
                    <div class="tab-pane fade show active" id="interest-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="interestConfigName" class="form-label">Configuration Name</label>
                                    <input type="text" class="form-control" id="interestConfigName" placeholder="e.g., SAVINGS_INTEREST">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="calculationMethod" class="form-label">Calculation Method</label>
                                    <select class="form-select" id="calculationMethod">
                                        <option value="SIMPLE">Simple</option>
                                        <option value="COMPOUND">Compound</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="compoundingFrequency" class="form-label">Compounding Frequency</label>
                                    <select class="form-select" id="compoundingFrequency">
                                        <option value="DAILY">Daily</option>
                                        <option value="MONTHLY">Monthly</option>
                                        <option value="QUARTERLY">Quarterly</option>
                                        <option value="YEARLY">Yearly</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="standardRate" class="form-label">Standard Rate (%)</label>
                                    <input type="number" class="form-control" id="standardRate" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="preferentialRateConfig" class="form-label">Preferential Rate Configuration (JSON)</label>
                                <textarea class="form-control" id="preferentialRateConfig" rows="2">{"customerTypes": ["VIP", "STAFF"], "rate": 3.5}</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="charge-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="chargeName" class="form-label">Charge Name</label>
                                    <input type="text" class="form-control" id="chargeName" placeholder="e.g., ATM_WITHDRAWAL_FEE">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="chargeType" class="form-label">Charge Type</label>
                                    <select class="form-select" id="chargeType">
                                        <option value="MAINTENANCE">Maintenance</option>
                                        <option value="WITHDRAWAL">Withdrawal</option>
                                        <option value="TRANSFER">Transfer</option>
                                        <option value="PENALTY">Penalty</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fixedAmount" class="form-label">Fixed Amount</label>
                                    <input type="number" class="form-control" id="fixedAmount" placeholder="0.00" step="0.01">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="percentage" class="form-label">Percentage (%)</label>
                                    <input type="number" class="form-control" id="percentage" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="minAmount" class="form-label">Minimum Amount</label>
                                    <input type="number" class="form-control" id="minAmount" placeholder="0.00" step="0.01">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="maxAmount" class="form-label">Maximum Amount</label>
                                    <input type="number" class="form-control" id="maxAmount" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="penalty-config" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="penaltyRuleName" class="form-label">Rule Name</label>
                                    <input type="text" class="form-control" id="penaltyRuleName" placeholder="e.g., LATE_PAYMENT_PENALTY">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="applicableTo" class="form-label">Applicable To</label>
                                    <select class="form-select" id="applicableTo">
                                        <option value="LOANS">Loans</option>
                                        <option value="ACCOUNTS">Accounts</option>
                                        <option value="CARDS">Cards</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="penaltyType" class="form-label">Penalty Type</label>
                                    <select class="form-select" id="penaltyType">
                                        <option value="FIXED">Fixed Amount</option>
                                        <option value="PERCENTAGE">Percentage</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="penaltyRateAmount" class="form-label">Rate/Amount</label>
                                    <input type="number" class="form-control" id="penaltyRateAmount" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="gracePeriod" class="form-label">Grace Period (days)</label>
                                <input type="number" class="form-control" id="gracePeriod" placeholder="0">
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