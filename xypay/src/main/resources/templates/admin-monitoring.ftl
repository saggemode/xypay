<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Monitoring - XY Pay Banking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            backdrop-filter: blur(10px);
        }
        .header h1 {
            color: #2c3e50;
            margin: 0;
            font-size: 2.5em;
            text-align: center;
        }
        .header p {
            color: #7f8c8d;
            text-align: center;
            margin: 10px 0 0 0;
            font-size: 1.1em;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        .stat-card h4 {
            margin: 0 0 10px 0;
            font-size: 1.2em;
        }
        .stat-card .number {
            font-size: 2.5em;
            font-weight: bold;
            margin: 0;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 25px;
            margin-bottom: 30px;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }
        .card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        .card h3 {
            color: #2c3e50;
            margin: 0 0 20px 0;
            font-size: 1.4em;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        .metrics-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .metric-item {
            padding: 15px;
            border-radius: 10px;
            background: #f8f9fa;
            border-left: 4px solid #667eea;
        }
        .metric-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .metric-name {
            font-weight: bold;
            color: #2c3e50;
        }
        .metric-status {
            font-size: 1.5em;
        }
        .metric-value {
            font-size: 1.2em;
            color: #667eea;
            font-weight: bold;
        }
        .performance-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
        }
        .performance-item {
            text-align: center;
            padding: 15px;
            border-radius: 10px;
            background: #f8f9fa;
        }
        .performance-value {
            font-size: 1.5em;
            font-weight: bold;
            color: #667eea;
            margin-bottom: 5px;
        }
        .performance-name {
            font-size: 0.9em;
            color: #7f8c8d;
        }
        .performance-status {
            font-size: 0.8em;
            color: #27ae60;
            font-weight: bold;
        }
        .alerts-list {
            max-height: 400px;
            overflow-y: auto;
        }
        .alert-item {
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            border-left: 4px solid;
        }
        .alert-warning {
            background: #fff3cd;
            border-left-color: #ffc107;
        }
        .alert-info {
            background: #d1ecf1;
            border-left-color: #17a2b8;
        }
        .alert-success {
            background: #d4edda;
            border-left-color: #28a745;
        }
        .alert-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .alert-message {
            font-size: 0.9em;
            color: #6c757d;
        }
        .alert-time {
            font-size: 0.8em;
            color: #6c757d;
            margin-top: 5px;
        }
        .activity-list {
            max-height: 400px;
            overflow-y: auto;
        }
        .activity-item {
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 10px;
            background: #f8f9fa;
            border-left: 4px solid #667eea;
        }
        .activity-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px;
        }
        .activity-action {
            font-weight: bold;
            color: #2c3e50;
        }
        .activity-time {
            font-size: 0.8em;
            color: #6c757d;
        }
        .activity-user {
            font-size: 0.9em;
            color: #667eea;
            font-weight: bold;
        }
        .activity-details {
            font-size: 0.9em;
            color: #6c757d;
            margin-top: 5px;
        }
        .back-btn {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }
        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .refresh-btn {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 20px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-left: 10px;
        }
        .refresh-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📊 System Monitoring</h1>
            <p>Real-time system performance, metrics, and activity monitoring</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <h4>Total Users</h4>
                <div class="number">${totalUsers}</div>
            </div>
            <div class="stat-card">
                <h4>Total Accounts</h4>
                <div class="number">${totalAccounts}</div>
            </div>
            <div class="stat-card">
                <h4>Total Transactions</h4>
                <div class="number">${totalTransactions}</div>
            </div>
            <div class="stat-card">
                <h4>Audit Logs</h4>
                <div class="number">${totalAuditLogs}</div>
            </div>
        </div>

        <div class="dashboard-grid">
            <div class="main-content">
                <div class="card">
                    <h3>🖥️ System Metrics <a href="/admin/monitoring" class="refresh-btn">🔄 Refresh</a></h3>
                    <div class="metrics-grid">
                        <#list metrics as metric>
                            <div class="metric-item">
                                <div class="metric-header">
                                    <span class="metric-name">${metric.name}</span>
                                    <span class="metric-status">${metric.icon}</span>
                                </div>
                                <div class="metric-value">${metric.value}</div>
                                <div class="metric-status">${metric.status}</div>
                            </div>
                        </#list>
                    </div>
                </div>

                <div class="card">
                    <h3>⚡ Performance Metrics</h3>
                    <div class="performance-grid">
                        <#list performanceMetrics as perf>
                            <div class="performance-item">
                                <div class="performance-value">${perf.value}</div>
                                <div class="performance-name">${perf.name}</div>
                                <div class="performance-status">${perf.status}</div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>

            <div class="sidebar">
                <div class="card">
                    <h3>🚨 System Alerts</h3>
                    <div class="alerts-list">
                        <#list alerts as alert>
                            <div class="alert-item alert-${alert.type?lower_case}">
                                <div class="alert-title">${alert.title}</div>
                                <div class="alert-message">${alert.message}</div>
                                <div class="alert-time">${alert.timestamp}</div>
                            </div>
                        </#list>
                    </div>
                </div>

                <div class="card">
                    <h3>📝 Recent Activity</h3>
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="logSearch" placeholder="Search activity logs..." onkeyup="filterLogs()">
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-outline-primary" onclick="exportLogsCSV()">Export Logs CSV</button>
                        </div>
                        <div class="col-md-3">
                            <div class="alert alert-success" id="systemStatus">System Online | DB Connected</div>
                        </div>
                    </div>
                    <div class="activity-list">
                        <#list activityLogs as log>
                            <div class="activity-item">
                                <div class="activity-header">
                                    <span class="activity-action">${log.action}</span>
                                    <span class="activity-time">${log.timestamp}</span>
                                </div>
                                <div class="activity-user">${log.user}</div>
                                <div class="activity-details">${log.details}</div>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>

        <div style="text-align: center;">
            <a href="/superuser/dashboard" class="back-btn">← Back to Dashboard</a>
        </div>
    </div>

    <script>
        // Auto-refresh every 30 seconds
        setTimeout(function() {
            location.reload();
        }, 30000);
    </script>
    <script>
function filterLogs() {
    var search = document.getElementById('logSearch').value.toLowerCase();
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        var text = row.innerText.toLowerCase();
        row.style.display = text.includes(search) ? '' : 'none';
    });
}
function exportLogsCSV() {
    var csv = 'Time,User,Action,Details\n';
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        if (row.style.display !== 'none') {
            var cols = row.querySelectorAll('td');
            var line = Array.from(cols).map(td => '"' + td.innerText.replace(/"/g, '""') + '"').join(',');
            csv += line + '\n';
        }
    });
    var blob = new Blob([csv], {type: 'text/csv'});
    var link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'activity-logs.csv';
    link.click();
}
</script>
</body>
</html>
