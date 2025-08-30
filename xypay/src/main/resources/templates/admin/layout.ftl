<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title} - XY Pay Admin Console</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --dark-color: #34495e;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
        }
        
        .sidebar {
            background: var(--primary-color);
            color: white;
            height: 100vh;
            position: fixed;
            overflow-y: auto;
        }
        
        .sidebar .nav-link {
            color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s;
        }
        
        .sidebar .nav-link:hover, 
        .sidebar .nav-link.active {
            color: white;
            background: rgba(255, 255, 255, 0.1);
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        
        .header {
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            padding: 15px 20px;
            margin-bottom: 20px;
        }
        
        .module-card {
            transition: transform 0.3s, box-shadow 0.3s;
            border: none;
            border-radius: 10px;
            overflow: hidden;
        }
        
        .module-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .module-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
        }
        
        .breadcrumb {
            background: transparent;
            padding: 0;
        }
        
        .stat-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .system-info-card {
            border-left: 4px solid var(--secondary-color);
        }
        
        footer {
            background: var(--dark-color);
            color: white;
            padding: 20px 0;
            margin-top: 40px;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        
        .btn-primary {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
        
        .btn-primary:hover {
            background-color: #2980b9;
            border-color: #2980b9;
        }
        
        .btn-accent {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
            color: white;
        }
        
        .btn-accent:hover {
            background-color: #c0392b;
            border-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block sidebar collapse">
                <div class="position-sticky pt-3">
                    <div class="text-center mb-4">
                        <h4 class="text-white">XY Pay</h4>
                        <p class="text-muted small">Admin Console v1.0</p>
                    </div>
                    
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/dashboard">
                                <i class="fas fa-home me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/customer-account">
                                <i class="fas fa-users me-2"></i>Customer & Account
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/products">
                                <i class="fas fa-box me-2"></i>Product Definition
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/interest-charges">
                                <i class="fas fa-percentage me-2"></i>Interest & Charges
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/transaction-rules">
                                <i class="fas fa-exchange-alt me-2"></i>Transaction Rules
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/risk-compliance">
                                <i class="fas fa-shield-alt me-2"></i>Risk & Compliance
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/branch-entity">
                                <i class="fas fa-building me-2"></i>Branch & Entity
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/reporting">
                                <i class="fas fa-chart-bar me-2"></i>Reporting & Analytics
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/workflow">
                                <i class="fas fa-sitemap me-2"></i>Workflow & Authorization
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/alerts">
                                <i class="fas fa-bell me-2"></i>Alerts & Notifications
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/integrations">
                                <i class="fas fa-plug me-2"></i>Integration Management
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/parameters">
                                <i class="fas fa-cog me-2"></i>Parameter Maintenance
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/database">
                                <i class="fas fa-database me-2"></i>Database Tools
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/admin/ui/scripting">
                                <i class="fas fa-code me-2"></i>Scripting
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <!-- Main Content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
                <div class="header d-flex justify-content-between align-items-center">
                    <div>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="/admin/ui/dashboard">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">${title}</li>
                            </ol>
                        </nav>
                        <h1 class="h3">${title}</h1>
                    </div>
                    <div>
                        <button class="btn btn-sm btn-outline-secondary me-2">
                            <i class="fas fa-sync-alt"></i> Refresh
                        </button>
                        <button class="btn btn-sm btn-primary">
                            <i class="fas fa-question-circle"></i> Help
                        </button>
                    </div>
                </div>
                
                <#-- Page content will be inserted here -->
                <#nested>
                
            </main>
        </div>
    </div>
    
    <footer class="footer mt-auto py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <p class="mb-0">XY Pay Core Banking System &copy; 2023</p>
                </div>
                <div class="col-md-6 text-md-end">
                    <p class="mb-0">Version 1.0.0 | Build 2023.01.01</p>
                </div>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Highlight active nav link
        $(document).ready(function() {
            var path = window.location.pathname;
            $('.nav-link').each(function() {
                if (this.getAttribute('href') === path) {
                    $(this).addClass('active');
                }
            });
        });
    </script>
</body>
</html>