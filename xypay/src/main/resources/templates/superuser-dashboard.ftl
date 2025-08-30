<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Superuser Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .dashboard-actions { display: flex; flex-wrap: wrap; gap: 24px; margin-bottom: 32px; }
        .dashboard-action { flex: 1 1 220px; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; text-align: center; transition: box-shadow 0.2s; }
        .dashboard-action:hover { box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .dashboard-action i { font-size: 2.5rem; color: #6f42c1; margin-bottom: 12px; }
        .dashboard-action a { display: block; margin-top: 12px; font-weight: 600; color: #6f42c1; text-decoration: none; }
        .dashboard-action a:focus { outline: 2px solid #6f42c1; outline-offset: 2px; }
        .notifications-area { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; margin-bottom: 32px; }
        .notifications-area h2 { font-size: 1.3rem; font-weight: 600; color: #2d3748; margin-bottom: 16px; }
        .notification { padding: 12px; border-bottom: 1px solid #e2e8f0; color: #2d3748; }
        .notification:last-child { border-bottom: none; }
        .sr-only { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0); border: 0; }
    </style>
    <script>
        // Simulate real-time notifications (replace with AJAX/websocket in production)
        function addNotification(msg) {
            const area = document.getElementById('notifications-list');
            const div = document.createElement('div');
            div.className = 'notification';
            div.innerText = msg;
            area.prepend(div);
        }
        // Example: Add a notification every 8 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] System event: All services operational.');
        }, 8000);
    </script>
</head>
<body>
    <main class="container py-4" aria-label="Superuser Dashboard">
        <div class="dashboard-header mb-4">
            <h1>Superuser Dashboard <span class="sr-only">Main area for system administration</span></h1>
            <p>Welcome, Superuser! Here you have full access to system administration, monitoring, and configuration.</p>
        </div>
        <div class="dashboard-actions mb-4" role="navigation" aria-label="Superuser actions">
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-users-cog"></i>
                <div>User Management</div>
                <a href="/admin/users" aria-label="User management">Manage Users</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-user-plus"></i>
                <div>User Registration</div>
                <a href="/admin/user-registration" aria-label="User registration monitoring">Registration Monitor</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-user-shield"></i>
                <div>Role Management</div>
                <a href="/admin/roles" aria-label="Role management">Manage Roles</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-cogs"></i>
                <div>System Configuration</div>
                <a href="/admin/config" aria-label="System configuration">System Config</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-database"></i>
                <div>Database Admin</div>
                <a href="/admin/database" aria-label="Database admin">Database Admin</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-chart-line"></i>
                <div>Monitoring & Analytics</div>
                <a href="/admin/monitoring" aria-label="System monitoring">System Monitor</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-file-alt"></i>
                <div>Audit Logs</div>
                <a href="/admin/audit-logs" aria-label="Audit logs">View Audit Logs</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-bell"></i>
                <div>Notifications</div>
                <a href="/notifications" aria-label="Notifications">View Notifications</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-plug"></i>
                <div>Integrations & APIs</div>
                <a href="/admin/api" aria-label="API management">API Management</a>
            </div>
        </div>
        <div class="analytics-dashboard mb-4">
            <h2 class="mb-3">Real-Time Analytics</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card p-3">
                        <h5>User Registrations</h5>
                        <canvas id="registrationsChart"></canvas>
                        <div class="mt-2">
                            <small class="text-muted">Today: <span id="todayRegistrations">0</span></small><br>
                            <small class="text-muted">Pending Verification: <span id="pendingVerifications">0</span></small>
                        </div>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('registrations')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-3">
                        <h5>Transactions (Last 24h)</h5>
                        <canvas id="transactionsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('transactions')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-3">
                        <h5>Customer Activity</h5>
                        <canvas id="customerActivityChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('customerActivity')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card p-3">
                        <h5>Risk Metrics</h5>
                        <canvas id="riskMetricsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('riskMetrics')">Export Report</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-4">
    <div class="col-md-4">
        <a href="/admin/openbanking" class="btn btn-outline-secondary w-100 mb-2">Open Banking API Tools</a>
    </div>
    <div class="col-md-4">
        <a href="/admin/iso20022" class="btn btn-outline-secondary w-100 mb-2">ISO 20022 Export/Import</a>
    </div>
    <div class="col-md-4">
        <a href="/admin/analytics" class="btn btn-outline-secondary w-100 mb-2">Analytics Data Export/Import</a>
    </div>
</div>
<div class="row mb-4">
    <div class="col-md-6">
        <a href="/admin/workflow" class="btn btn-outline-primary w-100 mb-2">Workflow Builder</a>
    </div>
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">AI/ML Analytics</div>
            <div class="card-body">
                <button class="btn btn-sm btn-info" onclick="testCreditScore()">Test Credit Scoring</button>
                <button class="btn btn-sm btn-warning" onclick="testFraudDetection()">Test Fraud Detection</button>
                <button class="btn btn-sm btn-success" onclick="testSegmentation()">Test Segmentation</button>
                <div id="aiResult" class="mt-2"></div>
            </div>
        </div>
    </div>
</div>
<script>
function testCreditScore() {
    fetch('/api/ai/credit-score', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Credit Score: '+d.score+'<br>Risk: '+d.risk;
    });
}
function testFraudDetection() {
    fetch('/api/ai/fraud-detection', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({amount:1000})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Suspicious: '+d.suspicious+'<br>Reason: '+d.reason;
    });
}
function testSegmentation() {
    fetch('/api/ai/customer-segmentation', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Segment: '+d.segment;
    });
}
</script>
        <div class="notifications-area" aria-live="polite" aria-atomic="true">
            <h2>Real-Time Notifications</h2>
            <div id="notifications-list">
                <div class="notification">No new notifications.</div>
            </div>
        </div>
    </main>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Simulated real-time data (replace with AJAX calls to backend for live data)
        function randomData(len, min, max) {
            return Array.from({length: len}, () => Math.floor(Math.random() * (max - min + 1)) + min);
        }
        
        // User Registration Chart
        const registrationsChart = new Chart(document.getElementById('registrationsChart'), {
            type: 'line',
            data: {
                labels: [...Array(7).keys()].map(d => {
                    const date = new Date();
                    date.setDate(date.getDate() - (6 - d));
                    return date.toLocaleDateString('en-US', {month: 'short', day: 'numeric'});
                }),
                datasets: [{
                    label: 'Registrations',
                    data: randomData(7, 5, 25),
                    borderColor: '#10b981',
                    backgroundColor: 'rgba(16,185,129,0.1)',
                    fill: true
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        
        // Update registration stats
        document.getElementById('todayRegistrations').textContent = Math.floor(Math.random() * 15) + 5;
        document.getElementById('pendingVerifications').textContent = Math.floor(Math.random() * 8) + 2;
        
        const transactionsChart = new Chart(document.getElementById('transactionsChart'), {
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
        const customerActivityChart = new Chart(document.getElementById('customerActivityChart'), {
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
        const riskMetricsChart = new Chart(document.getElementById('riskMetricsChart'), {
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
