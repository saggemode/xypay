<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teller Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .dashboard-actions { display: flex; flex-wrap: wrap; gap: 24px; margin-bottom: 32px; }
        .dashboard-action { flex: 1 1 220px; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; text-align: center; transition: box-shadow 0.2s; }
        .dashboard-action:hover { box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .dashboard-action i { font-size: 2.5rem; color: #3182ce; margin-bottom: 12px; }
        .dashboard-action a { display: block; margin-top: 12px; font-weight: 600; color: #3182ce; text-decoration: none; }
        .dashboard-action a:focus { outline: 2px solid #3182ce; outline-offset: 2px; }
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
        // Example: Add a notification every 10 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] New transaction processed.');
        }, 10000);
    </script>
</head>
<body>
    <main class="container py-4" aria-label="Teller Dashboard">
        <div class="dashboard-header mb-4">
            <h1>Teller Dashboard <span class="sr-only">Main area for teller operations</span></h1>
            <p>Welcome, Teller! Here you can handle deposits, withdrawals, check cashing, and account lookups.</p>
        </div>
        <div class="dashboard-actions mb-4" role="navigation" aria-label="Teller actions">
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-money-bill-wave"></i>
                <div>Deposit</div>
                <a href="/teller/deposit" aria-label="Deposit funds">Go to Deposit</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-hand-holding-usd"></i>
                <div>Withdrawal</div>
                <a href="/teller/withdrawal" aria-label="Withdraw funds">Go to Withdrawal</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-file-invoice-dollar"></i>
                <div>Check Cashing</div>
                <a href="/teller/check-cashing" aria-label="Check cashing">Go to Check Cashing</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-search"></i>
                <div>Account Lookup</div>
                <a href="/teller/account-lookup" aria-label="Account lookup">Go to Account Lookup</a>
            </div>
        </div>
        <div class="analytics-dashboard mb-4">
            <h2 class="mb-3">Real-Time Analytics</h2>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Transactions (Last 24h)</h5>
                        <canvas id="tellerTransactionsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('tellerTransactions')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Cash Flow</h5>
                        <canvas id="cashFlowChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('cashFlow')">Export Report</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mb-4">
    <div class="col-md-6">
        <a href="/admin/workflow" class="btn btn-outline-primary w-100 mb-2">Run Workflow</a>
    </div>
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">AI/ML Tools</div>
            <div class="card-body">
                <button class="btn btn-sm btn-info" onclick="testCreditScore()">Credit Scoring</button>
                <button class="btn btn-sm btn-warning" onclick="testFraudDetection()">Fraud Detection</button>
                <div id="aiResult" class="mt-2"></div>
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
        const tellerTransactionsChart = new Chart(document.getElementById('tellerTransactionsChart'), {
            type: 'line',
            data: {
                labels: [...Array(24).keys()].map(h => h + ':00'),
                datasets: [{
                    label: 'Transactions',
                    data: randomData(24, 10, 50),
                    borderColor: '#3182ce',
                    backgroundColor: 'rgba(49,130,206,0.1)',
                    fill: true
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const cashFlowChart = new Chart(document.getElementById('cashFlowChart'), {
            type: 'bar',
            data: {
                labels: ['Deposits', 'Withdrawals', 'Check Cashing'],
                datasets: [{
                    label: 'Amount',
                    data: randomData(3, 1000, 10000),
                    backgroundColor: '#38a169'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo only).');
        }
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
    </script>
</body>
</html>
