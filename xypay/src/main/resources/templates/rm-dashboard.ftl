<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relationship Manager Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .dashboard-actions { display: flex; flex-wrap: wrap; gap: 24px; margin-bottom: 32px; }
        .dashboard-action { flex: 1 1 220px; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; text-align: center; transition: box-shadow 0.2s; }
        .dashboard-action:hover { box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .dashboard-action i { font-size: 2.5rem; color: #d69e2e; margin-bottom: 12px; }
        .dashboard-action a { display: block; margin-top: 12px; font-weight: 600; color: #d69e2e; text-decoration: none; }
        .dashboard-action a:focus { outline: 2px solid #d69e2e; outline-offset: 2px; }
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
        // Example: Add a notification every 18 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] New client message received.');
        }, 18000);
    </script>
</head>
<body>
    <main class="container py-4" aria-label="Relationship Manager Dashboard">
        <div class="dashboard-header mb-4">
            <h1>Relationship Manager Dashboard <span class="sr-only">Main area for relationship management</span></h1>
            <p>Welcome, Relationship Manager! Here you can manage VIP/corporate client accounts and sell banking products.</p>
        </div>
        <div class="dashboard-actions mb-4" role="navigation" aria-label="Relationship Manager actions">
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-users"></i>
                <div>Client Portfolio</div>
                <a href="/rm/portfolio" aria-label="Client portfolio">Go to Portfolio</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-briefcase"></i>
                <div>CRM Tools</div>
                <a href="/rm/crm" aria-label="CRM tools">Go to CRM</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-chart-line"></i>
                <div>Product Sales</div>
                <a href="/rm/product-sales" aria-label="Product sales">Go to Product Sales</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-exchange-alt"></i>
                <div>Transaction Initiation</div>
                <a href="/rm/transaction-initiation" aria-label="Transaction initiation">Go to Transaction Initiation</a>
            </div>
        </div>
        <div class="analytics-dashboard mb-4">
            <h2 class="mb-3">Real-Time Analytics</h2>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Client Engagement (Last 7d)</h5>
                        <canvas id="clientEngagementChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('clientEngagement')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Product Sales</h5>
                        <canvas id="productSalesChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('productSales')">Export Report</button>
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
                <button class="btn btn-sm btn-success" onclick="testSegmentation()">Segmentation</button>
                <button class="btn btn-sm btn-info" onclick="testCreditScore()">Credit Scoring</button>
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
        const clientEngagementChart = new Chart(document.getElementById('clientEngagementChart'), {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Engagements',
                    data: randomData(7, 5, 40),
                    borderColor: '#d69e2e',
                    backgroundColor: 'rgba(214,158,46,0.1)',
                    fill: true
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const productSalesChart = new Chart(document.getElementById('productSalesChart'), {
            type: 'bar',
            data: {
                labels: ['Savings', 'Loans', 'Cards', 'Insurance', 'Investments'],
                datasets: [{
                    label: 'Sales',
                    data: randomData(5, 1, 20),
                    backgroundColor: '#3182ce'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo only).');
        }
    </script>
    <script>
function testSegmentation() {
    fetch('/api/ai/customer-segmentation', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Segment: '+d.segment;
    });
}
function testCreditScore() {
    fetch('/api/ai/credit-score', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Credit Score: '+d.score+'<br>Risk: '+d.risk;
    });
}
</script>
</body>
</html>
