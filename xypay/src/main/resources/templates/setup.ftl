<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XY Pay - System Setup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-8 col-lg-10">
                <div class="card shadow">
                    <div class="card-header text-center bg-primary text-white">
                        <h4><i class="fas fa-cog me-2"></i>XY Pay System Initialization</h4>
                        <p class="mb-0">Complete the setup to start using your core banking system</p>
                    </div>
                    <div class="card-body">
                        <#if success??>
                            <div class="alert alert-success">
                                ${success}
                                <a href="/login" class="alert-link">Click here to login</a>
                            </div>
                        </#if>
                        
                        <#if error??>
                            <div class="alert alert-danger">
                                ${error}
                            </div>
                        </#if>
                        
                        <form action="/setup" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="row">
                                <div class="col-md-12">
                                    <h5 class="mb-3"><i class="fas fa-building me-2"></i>Bank Information</h5>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="bankName" class="form-label">Bank Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-landmark"></i></span>
                                        <input type="text" class="form-control" id="bankName" name="bankName" required>
                                    </div>
                                    <div class="form-text">The legal name of your financial institution</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="bankCode" class="form-label">Bank Code</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-barcode"></i></span>
                                        <input type="text" class="form-control" id="bankCode" name="bankCode" required>
                                    </div>
                                    <div class="form-text">Unique identifier for your main branch (e.g., HQ001)</div>
                                </div>
                            </div>
                            
                            <hr class="my-4">
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <h5 class="mb-3"><i class="fas fa-user-shield me-2"></i>Administrator Account</h5>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="adminFirstName" class="form-label">First Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input type="text" class="form-control" id="adminFirstName" name="adminFirstName" required>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="adminLastName" class="form-label">Last Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                        <input type="text" class="form-control" id="adminLastName" name="adminLastName" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="adminUsername" class="form-label">Username</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
                                        <input type="text" class="form-control" id="adminUsername" name="adminUsername" required>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="adminEmail" class="form-label">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                        <input type="email" class="form-control" id="adminEmail" name="adminEmail" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="adminPassword" class="form-label">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                        <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
                                    </div>
                                    <div class="form-text">Must be at least 6 characters long</div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="adminConfirmPassword" class="form-label">Confirm Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                        <input type="password" class="form-control" id="adminConfirmPassword" name="adminConfirmPassword" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <div class="alert alert-info">
                                        <h6><i class="fas fa-info-circle me-2"></i>Setup Information</h6>
                                        <p class="mb-0">After completing this setup, you will be able to:</p>
                                        <ul class="mb-0">
                                            <li>Access the administrator dashboard</li>
                                            <li>Configure branches and users</li>
                                            <li>Set up products and services</li>
                                            <li>Define workflows and permissions</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-check-circle me-2"></i>Initialize Banking System
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <small class="text-muted">XY Pay Core Banking System v1.0</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>