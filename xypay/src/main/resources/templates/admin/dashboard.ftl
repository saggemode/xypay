<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XY Pay - Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active text-white" href="#">
                                <i class="fas fa-home me-2"></i>Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-users me-2"></i>Customers
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-wallet me-2"></i>Accounts
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-exchange-alt me-2"></i>Transactions
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-file-invoice-dollar me-2"></i>Loans
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-building me-2"></i>Branches
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-user-friends me-2"></i>Users
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">
                                <i class="fas fa-cog me-2"></i>Settings
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- Main content -->
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <!-- Header -->
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Admin Dashboard</h1>
                    <div class="btn-toolbar mb-2 mb-md-0">
                        <div class="btn-group me-2">
                            <button type="button" class="btn btn-sm btn-outline-secondary">
                                <i class="fas fa-download me-1"></i>Export
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Welcome message -->
                <div class="alert alert-info">
                    <h4 class="alert-heading">Welcome to XY Pay Core Banking System!</h4>
                    <p>You have successfully logged in as an administrator. From this dashboard, you can manage all aspects of your banking system.</p>
                    <hr>
                    <p class="mb-0">Use the navigation menu on the left to access different modules of the system.</p>
                </div>

                <!-- Dashboard cards -->
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-primary">
                            <div class="card-body">
                                <h5 class="card-title">Customers</h5>
                                <p class="card-text display-6">1,248</p>
                                <small>+12% from last month</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <h5 class="card-title">Accounts</h5>
                                <p class="card-text display-6">3,562</p>
                                <small>+8% from last month</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-warning">
                            <div class="card-body">
                                <h5 class="card-title">Transactions</h5>
                                <p class="card-text display-6">12,458</p>
                                <small>+24% from last month</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-danger">
                            <div class="card-body">
                                <h5 class="card-title">Loans</h5>
                                <p class="card-text display-6">$42.6M</p>
                                <small>+5% from last month</small>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Recent activity -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Recent Activity</h5>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>Time</th>
                                                <th>User</th>
                                                <th>Action</th>
                                                <th>Module</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>10:30 AM</td>
                                                <td>John Smith</td>
                                                <td>Created new customer</td>
                                                <td>Customer Management</td>
                                            </tr>
                                            <tr>
                                                <td>09:45 AM</td>
                                                <td>Sarah Johnson</td>
                                                <td>Processed loan application</td>
                                                <td>Loan Management</td>
                                            </tr>
                                            <tr>
                                                <td>08:20 AM</td>
                                                <td>Michael Brown</td>
                                                <td>Updated branch information</td>
                                                <td>Branch Management</td>
                                            </tr>
                                            <tr>
                                                <td>Yesterday</td>
                                                <td>Admin</td>
                                                <td>Generated monthly report</td>
                                                <td>Reporting</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="analytics-dashboard mb-4">
                    <h2 class="mb-3">Real-Time Analytics</h2>
                    <div class="row g-4">
                        <div class="col-md-4">
                            <div class="card p-3">
                                <h5>Transactions (Last 24h)</h5>
                                <canvas id="adminTransactionsChart"></canvas>
                                <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('adminTransactions')">Export Report</button>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-3">
                                <h5>User Activity</h5>
                                <canvas id="adminUserActivityChart"></canvas>
                                <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('adminUserActivity')">Export Report</button>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card p-3">
                                <h5>Risk Events</h5>
                                <canvas id="adminRiskEventsChart"></canvas>
                                <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('adminRiskEvents')">Export Report</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        function randomData(len, min, max) {
            return Array.from({length: len}, () => Math.floor(Math.random() * (max - min + 1)) + min);
        }
        const adminTransactionsChart = new Chart(document.getElementById('adminTransactionsChart'), {
            type: 'line',
            data: {
                labels: [...Array(24).keys()].map(h => h + ':00'),
                datasets: [{
                    label: 'Transactions',
                    data: randomData(24, 50, 200),
                    borderColor: '#3182ce',
                    backgroundColor: 'rgba(49,130,206,0.1)',
                    fill: true
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const adminUserActivityChart = new Chart(document.getElementById('adminUserActivityChart'), {
            type: 'bar',
            data: {
                labels: ['Login', 'Account Open', 'Loan Apply', 'Support', 'Logout'],
                datasets: [{
                    label: 'Activity',
                    data: randomData(5, 10, 100),
                    backgroundColor: '#38a169'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const adminRiskEventsChart = new Chart(document.getElementById('adminRiskEventsChart'), {
            type: 'doughnut',
            data: {
                labels: ['Low', 'Medium', 'High'],
                datasets: [{
                    label: 'Risk',
                    data: randomData(3, 10, 100),
                    backgroundColor: ['#38a169', '#d69e2e', '#e53e3e']
                }]
            },
            options: {responsive: true, plugins: {legend: {position: 'bottom'}}}
        });
        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo only).');
        }
    </script>
</body>
</html>