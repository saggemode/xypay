<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSO Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .dashboard-actions { display: flex; flex-wrap: wrap; gap: 24px; margin-bottom: 32px; }
        .dashboard-action { flex: 1 1 220px; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; text-align: center; transition: box-shadow 0.2s; }
        .dashboard-action:hover { box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .dashboard-action i { font-size: 2.5rem; color: #38a169; margin-bottom: 12px; }
        .dashboard-action a { display: block; margin-top: 12px; font-weight: 600; color: #38a169; text-decoration: none; }
        .dashboard-action a:focus { outline: 2px solid #38a169; outline-offset: 2px; }
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
        // Example: Add a notification every 12 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] New customer inquiry received.');
        }, 12000);
    </script>
</head>
<body>
    <main class="container py-4" aria-label="CSO Dashboard">
        <div class="dashboard-header mb-4">
            <h1>CSO Dashboard <span class="sr-only">Main area for customer service operations</span></h1>
            <p>Welcome, CSO! Here you can open new accounts, handle complaints, and assist customers with inquiries.</p>
        </div>
        <div class="dashboard-actions mb-4" role="navigation" aria-label="CSO actions">
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-user-plus"></i>
                <div>Open New Account</div>
                <a href="/cso/account-opening" aria-label="Open new account">Go to Account Opening</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-user-check"></i>
                <div>Registration Monitor</div>
                <a href="/cso/user-registrations" aria-label="User registration monitoring">Monitor Registrations</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-comments"></i>
                <div>Customer Complaints</div>
                <a href="/cso/complaints" aria-label="Customer complaints">Go to Complaints</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-id-card"></i>
                <div>KYC Verification</div>
                <a href="/cso/kyc" aria-label="KYC verification">Go to KYC</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-briefcase"></i>
                <div>CRM Tools</div>
                <a href="/cso/crm" aria-label="CRM tools">Go to CRM</a>
            </div>
        </div>
        <div class="analytics-dashboard mb-4">
            <h2 class="mb-3">Real-Time Analytics</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5>User Registrations</h5>
                        <canvas id="registrationsChart"></canvas>
                        <div class="mt-2">
                            <small class="text-muted">Today: <span id="todayRegistrations">0</span></small><br>
                            <small class="text-muted">Pending: <span id="pendingVerifications">0</span></small>
                        </div>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('registrations')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5>Account Openings (Last 7d)</h5>
                        <canvas id="accountOpeningsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('accountOpenings')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card p-3">
                        <h5>Support Activity</h5>
                        <canvas id="supportActivityChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('supportActivity')">Export Report</button>
                    </div>
                </div>
            </div>
        </div>
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
        function randomData(len, min, max) {
            return Array.from({length: len}, () => Math.floor(Math.random() * (max - min + 1)) + min);
        }
        
        // User Registration Chart
        const registrationsChart = new Chart(document.getElementById('registrationsChart'), {
            type: 'bar',
            data: {
                labels: [...Array(7).keys()].map(d => {
                    const date = new Date();
                    date.setDate(date.getDate() - (6 - d));
                    return date.toLocaleDateString('en-US', {weekday: 'short'});
                }),
                datasets: [{
                    label: 'Registrations',
                    data: randomData(7, 2, 15),
                    backgroundColor: '#10b981'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        
        // Update registration stats
        document.getElementById('todayRegistrations').textContent = Math.floor(Math.random() * 10) + 3;
        document.getElementById('pendingVerifications').textContent = Math.floor(Math.random() * 5) + 1;
        
        const accountOpeningsChart = new Chart(document.getElementById('accountOpeningsChart'), {
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Openings',
                    data: randomData(7, 5, 30),
                    backgroundColor: '#3182ce'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const supportActivityChart = new Chart(document.getElementById('supportActivityChart'), {
            type: 'line',
            data: {
                labels: [...Array(24).keys()].map(h => h + ':00'),
                datasets: [{
                    label: 'Support Requests',
                    data: randomData(24, 0, 10),
                    borderColor: '#38a169',
                    backgroundColor: 'rgba(56,161,105,0.1)',
                    fill: true
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo only).');
        }
    </script>
</body>
</html>
