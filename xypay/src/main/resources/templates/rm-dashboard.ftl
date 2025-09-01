<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relationship Manager Dashboard - XyPay</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
    <style>
        .analytics-panel {
            background: #f0f0f0;
            border: 2px inset #e8e8e8;
            padding: 8px;
            margin: 4px 0;
        }
        .chart-container {
            background: white;
            border: 1px inset #d0d0d0;
            padding: 8px;
            margin: 4px;
            min-height: 200px;
        }
        .chart-title {
            font-size: 11px;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
            padding: 2px 4px;
            background: #e8e8e8;
            border: 1px outset #e8e8e8;
        }
        .notification-item {
            padding: 4px 8px;
            border-bottom: 1px solid #d0d0d0;
            font-size: 11px;
            background: white;
        }
        .notification-item:nth-child(even) {
            background: #f8f8f8;
        }
        .ai-tools-panel {
            background: #f0f0f0;
            border: 2px inset #e8e8e8;
            padding: 8px;
            margin: 4px 0;
        }
        .ai-result {
            background: white;
            border: 1px inset #d0d0d0;
            padding: 4px;
            margin-top: 4px;
            font-size: 11px;
            min-height: 40px;
        }
    </style>
</head>
<body>
    <div class="window-frame">
        <!-- Title Bar -->
        <div class="title-bar">
            <div class="title-bar-text">Relationship Manager Dashboard - XyPay</div>
            <div class="title-bar-controls">
                <button class="title-bar-control" onclick="minimizeWindow()">_</button>
                <button class="title-bar-control" onclick="maximizeWindow()">□</button>
                <button class="title-bar-control close" onclick="closeWindow()">×</button>
            </div>
        </div>

        <!-- Menu Bar -->
        <div class="menu-bar">
            <div class="menu-item" onclick="showMenu('file')">File</div>
            <div class="menu-item" onclick="showMenu('view')">View</div>
            <div class="menu-item" onclick="showMenu('clients')">Clients</div>
            <div class="menu-item" onclick="showMenu('reports')">Reports</div>
            <div class="menu-item" onclick="showMenu('tools')">Tools</div>
            <div class="menu-item" onclick="showMenu('help')">Help</div>
        </div>

        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-button" onclick="refreshDashboard()" title="Refresh Dashboard">⟳</button>
            <button class="toolbar-button" onclick="exportData()" title="Export Data">💾</button>
            <button class="toolbar-button" onclick="printReport()" title="Print Report">🖨</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-button" onclick="newClient()" title="New Client">👤+</button>
            <button class="toolbar-button" onclick="searchClients()" title="Search Clients">🔍</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-button" onclick="showSettings()" title="Settings">⚙</button>
        </div>

        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Tree -->
            <div class="tree-panel">
                <div class="tree-header">RM Functions</div>
                <div class="tree-content">
                    <div class="tree-node expanded" onclick="toggleNode(this)">
                        <span class="tree-icon">📁</span> Client Management
                        <div class="tree-children">
                            <div class="tree-leaf" onclick="selectFunction('portfolio')">
                                <span class="tree-icon">📋</span> Portfolio
                            </div>
                            <div class="tree-leaf" onclick="selectFunction('crm')">
                                <span class="tree-icon">🤝</span> CRM Tools
                            </div>
                        </div>
                    </div>
                    <div class="tree-node" onclick="toggleNode(this)">
                        <span class="tree-icon">📁</span> Sales & Products
                        <div class="tree-children">
                            <div class="tree-leaf" onclick="selectFunction('sales')">
                                <span class="tree-icon">📈</span> Product Sales
                            </div>
                            <div class="tree-leaf" onclick="selectFunction('transactions')">
                                <span class="tree-icon">💳</span> Transactions
                            </div>
                        </div>
                    </div>
                    <div class="tree-node" onclick="toggleNode(this)">
                        <span class="tree-icon">📁</span> Analytics
                        <div class="tree-children">
                            <div class="tree-leaf" onclick="selectFunction('engagement')">
                                <span class="tree-icon">📊</span> Client Engagement
                            </div>
                            <div class="tree-leaf" onclick="selectFunction('performance')">
                                <span class="tree-icon">📉</span> Performance
                            </div>
                        </div>
                    </div>
                    <div class="tree-node" onclick="toggleNode(this)">
                        <span class="tree-icon">📁</span> AI/ML Tools
                        <div class="tree-children">
                            <div class="tree-leaf" onclick="selectFunction('segmentation')">
                                <span class="tree-icon">🎯</span> Segmentation
                            </div>
                            <div class="tree-leaf" onclick="selectFunction('scoring')">
                                <span class="tree-icon">📊</span> Credit Scoring
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Detail Panel -->
            <div class="detail-panel">
                <div id="dashboard-overview" class="function-panel active">
                    <fieldset>
                        <legend>Dashboard Overview</legend>
                        <p>Welcome, Relationship Manager! Manage VIP/corporate client accounts and banking products.</p>
                        
                        <div class="analytics-panel">
                            <div class="chart-title">Real-Time Analytics</div>
                            <div style="display: flex; gap: 8px;">
                                <div class="chart-container" style="flex: 1;">
                                    <div class="chart-title">Client Engagement (Last 7d)</div>
                                    <canvas id="clientEngagementChart" style="width: 100%; height: 150px;"></canvas>
                                    <button class="java-button small" onclick="exportChart('clientEngagement')">Export</button>
                                </div>
                                <div class="chart-container" style="flex: 1;">
                                    <div class="chart-title">Product Sales</div>
                                    <canvas id="productSalesChart" style="width: 100%; height: 150px;"></canvas>
                                    <button class="java-button small" onclick="exportChart('productSales')">Export</button>
                                </div>
                            </div>
                        </div>

                        <div class="ai-tools-panel">
                            <div class="chart-title">AI/ML Tools</div>
                            <button class="java-button small" onclick="testSegmentation()">Customer Segmentation</button>
                            <button class="java-button small" onclick="testCreditScore()">Credit Scoring</button>
                            <button class="java-button small" onclick="runWorkflow()">Run Workflow</button>
                            <div id="aiResult" class="ai-result">Click a tool to see results...</div>
                        </div>
                    </fieldset>
                </div>

                <div id="portfolio-panel" class="function-panel">
                    <fieldset>
                        <legend>Client Portfolio</legend>
                        <p>Access your client portfolio and account details.</p>
                        <button class="java-button" onclick="window.location.href='/rm/portfolio'">Open Portfolio</button>
                    </fieldset>
                </div>

                <div id="crm-panel" class="function-panel">
                    <fieldset>
                        <legend>CRM Tools</legend>
                        <p>Customer relationship management tools and utilities.</p>
                        <button class="java-button" onclick="window.location.href='/rm/crm'">Open CRM</button>
                    </fieldset>
                </div>

                <div id="sales-panel" class="function-panel">
                    <fieldset>
                        <legend>Product Sales</legend>
                        <p>Banking product sales tools and performance tracking.</p>
                        <button class="java-button" onclick="window.location.href='/rm/product-sales'">Open Sales</button>
                    </fieldset>
                </div>

                <div id="transactions-panel" class="function-panel">
                    <fieldset>
                        <legend>Transaction Initiation</legend>
                        <p>Initiate and manage client transactions.</p>
                        <button class="java-button" onclick="window.location.href='/rm/transaction-initiation'">Open Transactions</button>
                    </fieldset>
                </div>

                <div id="notifications-panel" class="function-panel">
                    <fieldset>
                        <legend>Real-Time Notifications</legend>
                        <div id="notifications-list" style="max-height: 200px; overflow-y: auto; border: 1px inset #d0d0d0; background: white;">
                            <div class="notification-item">No new notifications.</div>
                        </div>
                        <button class="java-button small" onclick="clearNotifications()">Clear All</button>
                        <button class="java-button small" onclick="refreshNotifications()">Refresh</button>
                    </fieldset>
                </div>
            </div>
        </div>

        <!-- Status Bar -->
        <div class="status-bar">
            <div class="status-section">User: Relationship Manager</div>
            <div class="status-section">Session: Active</div>
            <div class="status-section">Clients: <span id="client-count">Loading...</span></div>
            <div class="status-section">Last Update: <span id="last-update">--:--</span></div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Window control functions
        function minimizeWindow() {
            alert('Window minimize (demo)');
        }
        function maximizeWindow() {
            alert('Window maximize (demo)');
        }
        function closeWindow() {
            if (confirm('Close Relationship Manager Dashboard?')) {
                window.close();
            }
        }

        // Menu functions
        function showMenu(menuType) {
            alert('Menu: ' + menuType + ' (demo)');
        }

        // Toolbar functions
        function refreshDashboard() {
            location.reload();
        }
        function exportData() {
            alert('Export dashboard data (demo)');
        }
        function printReport() {
            window.print();
        }
        function newClient() {
            alert('New client form (demo)');
        }
        function searchClients() {
            alert('Search clients (demo)');
        }
        function showSettings() {
            alert('Dashboard settings (demo)');
        }

        // Tree navigation functions
        function toggleNode(node) {
            node.classList.toggle('expanded');
        }

        function selectFunction(functionName) {
            // Hide all panels
            document.querySelectorAll('.function-panel').forEach(panel => {
                panel.classList.remove('active');
            });
            
            // Show selected panel
            const panelMap = {
                'portfolio': 'portfolio-panel',
                'crm': 'crm-panel',
                'sales': 'sales-panel',
                'transactions': 'transactions-panel',
                'engagement': 'dashboard-overview',
                'performance': 'dashboard-overview',
                'segmentation': 'dashboard-overview',
                'scoring': 'dashboard-overview'
            };
            
            const panelId = panelMap[functionName] || 'dashboard-overview';
            document.getElementById(panelId).classList.add('active');
            
            // Update status
            updateLastUpdate();
        }

        // Chart functions
        function randomData(len, min, max) {
            return Array.from({length: len}, () => Math.floor(Math.random() * (max - min + 1)) + min);
        }

        // Initialize charts
        window.addEventListener('load', function() {
            const clientEngagementChart = new Chart(document.getElementById('clientEngagementChart'), {
                type: 'line',
                data: {
                    labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    datasets: [{
                        label: 'Engagements',
                        data: randomData(7, 5, 40),
                        borderColor: '#666',
                        backgroundColor: 'rgba(102,102,102,0.1)',
                        fill: true,
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true, 
                    maintainAspectRatio: false,
                    plugins: {legend: {display: false}},
                    scales: {
                        y: {beginAtZero: true, grid: {color: '#ddd'}},
                        x: {grid: {color: '#ddd'}}
                    }
                }
            });

            const productSalesChart = new Chart(document.getElementById('productSalesChart'), {
                type: 'bar',
                data: {
                    labels: ['Savings', 'Loans', 'Cards', 'Insurance', 'Investments'],
                    datasets: [{
                        label: 'Sales',
                        data: randomData(5, 1, 20),
                        backgroundColor: '#999',
                        borderColor: '#666',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true, 
                    maintainAspectRatio: false,
                    plugins: {legend: {display: false}},
                    scales: {
                        y: {beginAtZero: true, grid: {color: '#ddd'}},
                        x: {grid: {color: '#ddd'}}
                    }
                }
            });

            // Update client count and time
            document.getElementById('client-count').textContent = Math.floor(Math.random() * 150) + 50;
            updateLastUpdate();
        });

        function exportChart(type) {
            alert('Exporting ' + type + ' report (demo)');
        }

        // AI/ML functions
        function testSegmentation() {
            document.getElementById('aiResult').innerHTML = 'Processing segmentation...';
            setTimeout(() => {
                const segments = ['Premium', 'Standard', 'Basic', 'VIP'];
                const segment = segments[Math.floor(Math.random() * segments.length)];
                document.getElementById('aiResult').innerHTML = 'Customer Segment: ' + segment;
            }, 1000);
        }

        function testCreditScore() {
            document.getElementById('aiResult').innerHTML = 'Calculating credit score...';
            setTimeout(() => {
                const score = Math.floor(Math.random() * 300) + 500;
                const risk = score > 700 ? 'Low' : score > 600 ? 'Medium' : 'High';
                document.getElementById('aiResult').innerHTML = 'Credit Score: ' + score + '<br>Risk Level: ' + risk;
            }, 1000);
        }

        function runWorkflow() {
            document.getElementById('aiResult').innerHTML = 'Running workflow...';
            setTimeout(() => {
                document.getElementById('aiResult').innerHTML = 'Workflow completed successfully';
            }, 1500);
        }

        // Notification functions
        function addNotification(msg) {
            const list = document.getElementById('notifications-list');
            const div = document.createElement('div');
            div.className = 'notification-item';
            div.textContent = msg;
            list.insertBefore(div, list.firstChild);
            
            // Keep only last 10 notifications
            while (list.children.length > 10) {
                list.removeChild(list.lastChild);
            }
        }

        function clearNotifications() {
            document.getElementById('notifications-list').innerHTML = '<div class="notification-item">No new notifications.</div>';
        }

        function refreshNotifications() {
            const now = new Date().toLocaleTimeString();
            addNotification('[' + now + '] Dashboard refreshed');
        }

        // Status update function
        function updateLastUpdate() {
            document.getElementById('last-update').textContent = new Date().toLocaleTimeString();
        }

        // Auto-refresh notifications every 30 seconds
        setInterval(() => {
            const now = new Date().toLocaleTimeString();
            const messages = [
                'New client message received',
                'Transaction pending approval',
                'Portfolio update available',
                'System maintenance scheduled',
                'New product alert'
            ];
            const msg = messages[Math.floor(Math.random() * messages.length)];
            addNotification('[' + now + '] ' + msg);
        }, 30000);
    </script>
</body>
</html>
