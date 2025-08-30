<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XY Pay - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fas fa-university me-2"></i>XY Pay</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/logout"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5><i class="fas fa-tachometer-alt me-2"></i>Dashboard</h5>
                    </div>
                    <div class="card-body">
                        <div class="alert alert-success">
                            <i class="fas fa-check-circle me-2"></i>Welcome! You have successfully logged in to XY Pay.
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3">
                                <div class="card text-white bg-info mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="fas fa-users me-2"></i>Users</h5>
                                        <p class="card-text">Manage system users</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-success mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="fas fa-wallet me-2"></i>Wallets</h5>
                                        <p class="card-text">View wallet accounts</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-warning mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="fas fa-exchange-alt me-2"></i>Transactions</h5>
                                        <p class="card-text">Monitor transactions</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card text-white bg-danger mb-3">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="fas fa-cog me-2"></i>Settings</h5>
                                        <p class="card-text">System configuration</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
