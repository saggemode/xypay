<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Product Definition</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal">
                <i class="fas fa-plus me-2"></i>Add New Product
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Deposit Products</h5>
                <p class="card-text">Savings, current, fixed and recurring deposits.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#depositProductModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Loan Products</h5>
                <p class="card-text">Personal, housing, business and other loans.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#loanProductModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Overdraft Products</h5>
                <p class="card-text">Credit facilities and overdraft arrangements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#overdraftProductModal">
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
                <h5 class="mb-0">Existing Products</h5>
            </div>
            <div class="card-body">
                <ul class="nav nav-tabs mb-3" id="productTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="deposit-tab" data-bs-toggle="tab" data-bs-target="#deposit" type="button" role="tab">Deposit Products</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="loan-tab" data-bs-toggle="tab" data-bs-target="#loan" type="button" role="tab">Loan Products</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="overdraft-tab" data-bs-toggle="tab" data-bs-target="#overdraft" type="button" role="tab">Overdraft Products</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="productTabsContent">
                    <div class="tab-pane fade show active" id="deposit" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Type</th>
                                        <th>Min Balance</th>
                                        <th>Interest Rate</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Basic Savings</td>
                                        <td>Savings</td>
                                        <td>$0.00</td>
                                        <td>1.5%</td>
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
                                        <td>Premium Savings</td>
                                        <td>Savings</td>
                                        <td>$1,000.00</td>
                                        <td>3.0%</td>
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
                    
                    <div class="tab-pane fade" id="loan" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Type</th>
                                        <th>Interest Type</th>
                                        <th>Rate Range</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Personal Loan</td>
                                        <td>Personal</td>
                                        <td>Fixed</td>
                                        <td>8.5%</td>
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
                                        <td>Home Loan</td>
                                        <td>Housing</td>
                                        <td>Floating</td>
                                        <td>7.5% - 12.0%</td>
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
                    
                    <div class="tab-pane fade" id="overdraft" role="tabpanel">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Product Name</th>
                                        <th>Type</th>
                                        <th>Interest Rate</th>
                                        <th>Limit Type</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Standard Overdraft</td>
                                        <td>Overdraft</td>
                                        <td>12.0%</td>
                                        <td>Fixed</td>
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

<!-- Product Modal -->
<div class="modal fade" id="productModal" tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="productModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <ul class="nav nav-tabs mb-3" id="productTypeTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="deposit-product-tab" data-bs-toggle="tab" data-bs-target="#deposit-product" type="button" role="tab">Deposit Product</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="loan-product-tab" data-bs-toggle="tab" data-bs-target="#loan-product" type="button" role="tab">Loan Product</button>
                    </li>
                </ul>
                
                <div class="tab-content" id="productTypeTabsContent">
                    <div class="tab-pane fade show active" id="deposit-product" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="depositProductName" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" id="depositProductName" placeholder="e.g., Premium Savings">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="depositProductType" class="form-label">Product Type</label>
                                    <select class="form-select" id="depositProductType">
                                        <option value="SAVINGS">Savings</option>
                                        <option value="CURRENT">Current</option>
                                        <option value="FIXED_DEPOSIT">Fixed Deposit</option>
                                        <option value="RECURRING_DEPOSIT">Recurring Deposit</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="minimumBalance" class="form-label">Minimum Balance</label>
                                    <input type="number" class="form-control" id="minimumBalance" placeholder="0.00">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="interestRate" class="form-label">Interest Rate (%)</label>
                                    <input type="number" class="form-control" id="interestRate" placeholder="0.00" step="0.01">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="withdrawalLimits" class="form-label">Withdrawal Limits (JSON)</label>
                                <textarea class="form-control" id="withdrawalLimits" rows="2">{"daily": 1000, "weekly": 5000, "monthly": 20000}</textarea>
                            </div>
                        </form>
                    </div>
                    
                    <div class="tab-pane fade" id="loan-product" role="tabpanel">
                        <form>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="loanProductName" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" id="loanProductName" placeholder="e.g., Home Loan">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="loanProductType" class="form-label">Product Type</label>
                                    <select class="form-select" id="loanProductType">
                                        <option value="PERSONAL">Personal</option>
                                        <option value="HOUSING">Housing</option>
                                        <option value="BUSINESS">Business</option>
                                        <option value="AUTO">Auto</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="interestRateType" class="form-label">Interest Rate Type</label>
                                    <select class="form-select" id="interestRateType">
                                        <option value="FIXED">Fixed</option>
                                        <option value="FLOATING">Floating</option>
                                        <option value="TIERED">Tiered</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="interestRateRange" class="form-label">Interest Rate Range (%)</label>
                                    <input type="text" class="form-control" id="interestRateRange" placeholder="e.g., 7.5 - 12.0">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="repaymentFrequency" class="form-label">Repayment Frequency</label>
                                    <select class="form-select" id="repaymentFrequency">
                                        <option value="MONTHLY">Monthly</option>
                                        <option value="QUARTERLY">Quarterly</option>
                                        <option value="BULLET">Bullet</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="loanTerm" class="form-label">Loan Term (Months)</label>
                                    <input type="text" class="form-control" id="loanTerm" placeholder="e.g., 12-360">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save Product</button>
            </div>
        </div>
    </div>
</div>
</#macro>

<@content/>