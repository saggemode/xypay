<#include "layout.ftl">
<#macro content>
<div class="row">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4>Customer & Account Setup</h4>
            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#customerConfigModal">
                <i class="fas fa-plus me-2"></i>Add New Configuration
            </button>
        </div>
    </div>
</div>

<div class="row mb-4">
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Customer Types</h5>
                <p class="card-text">Configure customer categories and KYC requirements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#customerTypeModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Account Types</h5>
                <p class="card-text">Define account products and their requirements.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#accountTypeModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">KYC Levels</h5>
                <p class="card-text">Set up KYC tiers and required documentation.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#kycLevelModal">
                    Manage
                </button>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Risk Ratings</h5>
                <p class="card-text">Define customer risk categories and thresholds.</p>
                <button class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#riskRatingModal">
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
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Configuration Type</th>
                                <th>Name/ID</th>
                                <th>Description</th>
                                <th>Last Updated</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Customer Type</td>
                                <td>INDIVIDUAL</td>
                                <td>Individual customer configuration</td>
                                <td>2023-01-15</td>
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
                                <td>Account Type</td>
                                <td>SAVINGS</td>
                                <td>Savings account product</td>
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
                                <td>KYC Level</td>
                                <td>STANDARD</td>
                                <td>Standard KYC requirements</td>
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
        </div>
    </div>
</div>

<!-- Customer Configuration Modal -->
<div class="modal fade" id="customerConfigModal" tabindex="-1" aria-labelledby="customerConfigModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customerConfigModalLabel">Add Customer Configuration</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="customerType" class="form-label">Customer Type</label>
                            <select class="form-select" id="customerType">
                                <option value="INDIVIDUAL">Individual</option>
                                <option value="CORPORATE">Corporate</option>
                                <option value="SME">SME</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="kycLevel" class="form-label">KYC Level</label>
                            <select class="form-select" id="kycLevel">
                                <option value="BASIC">Basic</option>
                                <option value="STANDARD">Standard</option>
                                <option value="ENHANCED">Enhanced</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="requiredDocuments" class="form-label">Required Documents (JSON format)</label>
                        <textarea class="form-control" id="requiredDocuments" rows="3">["ID_PROOF", "ADDRESS_PROOF"]</textarea>
                    </div>
                    <div class="mb-3">
                        <label for="riskRating" class="form-label">Risk Rating</label>
                        <select class="form-select" id="riskRating">
                            <option value="LOW">Low</option>
                            <option value="MEDIUM">Medium</option>
                            <option value="HIGH">High</option>
                        </select>
                    </div>
                </form>
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