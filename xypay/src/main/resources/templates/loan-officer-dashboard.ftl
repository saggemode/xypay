<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Officer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .dashboard-header { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; margin-bottom: 32px; }
        .dashboard-header h1 { font-size: 2.2rem; font-weight: 700; color: #2d3748; }
        .dashboard-header p { color: #4a5568; }
        .dashboard-actions { display: flex; flex-wrap: wrap; gap: 24px; margin-bottom: 32px; }
        .dashboard-action { flex: 1 1 220px; background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 24px; text-align: center; transition: box-shadow 0.2s; }
        .dashboard-action:hover { box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
        .dashboard-action i { font-size: 2.5rem; color: #e53e3e; margin-bottom: 12px; }
        .dashboard-action a { display: block; margin-top: 12px; font-weight: 600; color: #e53e3e; text-decoration: none; }
        .dashboard-action a:focus { outline: 2px solid #e53e3e; outline-offset: 2px; }
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
        // Example: Add a notification every 15 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] New loan application received.');
        }, 15000);
    </script>
</head>
<body>
    <main class="container py-4" aria-label="Loan Officer Dashboard">
        <div class="dashboard-header mb-4">
            <h1>Loan Officer Dashboard <span class="sr-only">Main area for loan operations</span></h1>
            <p>Welcome, Loan Officer! Here you can process loan applications, perform credit checks, and manage loan portfolios.</p>
        </div>
        <div class="dashboard-actions mb-4" role="navigation" aria-label="Loan Officer actions">
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-file-signature"></i>
                <div>Loan Applications</div>
                <a href="/loan-officer/applications" aria-label="Loan applications">Go to Applications</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-user-check"></i>
                <div>Credit Checks</div>
                <a href="/loan-officer/credit-check" aria-label="Credit checks">Go to Credit Checks</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-briefcase"></i>
                <div>Loan Portfolio</div>
                <a href="/loan-officer/portfolio" aria-label="Loan portfolio">Go to Portfolio</a>
            </div>
            <div class="dashboard-action" tabindex="0">
                <i class="fas fa-shield-alt"></i>
                <div>Risk Assessment</div>
                <a href="/loan-officer/risk-assessment" aria-label="Risk assessment">Go to Risk Assessment</a>
            </div>
        </div>
        <div class="analytics-dashboard mb-4">
            <h2 class="mb-3">Real-Time Analytics</h2>
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Loan Applications (Last 7d)</h5>
                        <canvas id="loanApplicationsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('loanApplications')">Export Report</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Approvals vs Rejections</h5>
                        <canvas id="approvalsChart"></canvas>
                        <button class="btn btn-outline-primary btn-sm mt-2" onclick="exportChart('approvals')">Export Report</button>
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
                <button class="btn btn-sm btn-success" onclick="testSegmentation()">Segmentation</button>
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
        const loanApplicationsChart = new Chart(document.getElementById('loanApplicationsChart'), {
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Applications',
                    data: randomData(7, 2, 20),
                    backgroundColor: '#e53e3e'
                }]
            },
            options: {responsive: true, plugins: {legend: {display: false}}}
        });
        const approvalsChart = new Chart(document.getElementById('approvalsChart'), {
            type: 'doughnut',
            data: {
                labels: ['Approved', 'Rejected'],
                datasets: [{
                    label: 'Count',
                    data: randomData(2, 10, 30),
                    backgroundColor: ['#38a169', '#e53e3e']
                }]
            },
            options: {responsive: true, plugins: {legend: {position: 'bottom'}}}
        });
        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo only).');
        }
    </script>
    <script>
function testCreditScore() {
    fetch('/api/ai/credit-score', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Credit Score: '+d.score+'<br>Risk: '+d.risk;
    });
}
function testSegmentation() {
    fetch('/api/ai/customer-segmentation', {method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({customerId:1})})
    .then(r=>r.json()).then(d=>{
        document.getElementById('aiResult').innerHTML = 'Segment: '+d.segment;
    });
}
</script>
</body>
</html>
