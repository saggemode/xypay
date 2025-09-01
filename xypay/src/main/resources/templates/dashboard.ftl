<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Dashboard - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Dashboard - User Interface</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">View</span>
            <span class="menu-item">Tools</span>
            <span class="menu-item">Window</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">Home</button>
            <button class="toolbar-btn">Refresh</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Profile</button>
            <button class="toolbar-btn">Settings</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn" onclick="window.location.href='/logout'">Logout</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Navigation</div>
                
                <div class="tree-node selected">
                    <div class="tree-icon">🏠</div>
                    Dashboard
                </div>
                
                <div class="tree-node">
                    <div class="tree-icon">👥</div>
                    User Management
                </div>
                
                <div class="tree-node">
                    <div class="tree-icon">💰</div>
                    Wallet Management
                </div>
                
                <div class="tree-node">
                    <div class="tree-icon">💳</div>
                    Transactions
                </div>
                
                <div class="tree-node">
                    <div class="tree-icon">📊</div>
                    Reports
                </div>
                
                <div class="tree-node">
                    <div class="tree-icon">⚙️</div>
                    System Settings
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Dashboard Overview</div>
                <div class="details-content">
                    
                    <!-- Welcome Message -->
                    <div class="config-section">
                        <div class="config-header">Welcome Message</div>
                        <div class="config-content">
                            <p>✓ Welcome! You have successfully logged in to XyPay.</p>
                            <p>System Status: <strong>Online</strong> | Last Login: <span id="lastLogin"></span></p>
                        </div>
                    </div>
                    
                    <!-- Quick Actions -->
                    <div class="config-section">
                        <div class="config-header">Quick Actions</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Module</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                <tr>
                                    <td>👥 Users</td>
                                    <td>Manage system users and permissions</td>
                                    <td style="color: green;">Active</td>
                                    <td><button class="java-btn">Open</button></td>
                                </tr>
                                <tr>
                                    <td>💰 Wallets</td>
                                    <td>View and manage wallet accounts</td>
                                    <td style="color: green;">Active</td>
                                    <td><button class="java-btn">Open</button></td>
                                </tr>
                                <tr>
                                    <td>💳 Transactions</td>
                                    <td>Monitor and process transactions</td>
                                    <td style="color: green;">Active</td>
                                    <td><button class="java-btn">Open</button></td>
                                </tr>
                                <tr>
                                    <td>⚙️ Settings</td>
                                    <td>System configuration and setup</td>
                                    <td style="color: green;">Active</td>
                                    <td><button class="java-btn">Open</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- System Information -->
                    <div class="config-section">
                        <div class="config-header">System Information</div>
                        <div class="config-content">
                            <div class="form-row">
                                <span class="form-label">Server Status:</span>
                                <span style="color: green; font-weight: bold;">Online</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Database:</span>
                                <span style="color: green; font-weight: bold;">Connected</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Active Users:</span>
                                <span id="activeUsers">Loading...</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">System Version:</span>
                                <span>XyPay v2.1.0</span>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Action Buttons -->
                    <div style="margin-top: 16px; text-align: center;">
                        <button class="java-btn primary">View Full Reports</button>
                        <button class="java-btn">System Diagnostics</button>
                        <button class="java-btn">Export Data</button>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Ready | XyPay Dashboard Loaded Successfully</span>
            <span>User: <span id="currentUser">Loading...</span> | Session Active</span>
        </div>
    </div>
    
    <script>
        // Initialize dashboard data
        document.getElementById('lastLogin').textContent = new Date().toLocaleString();
        document.getElementById('activeUsers').textContent = Math.floor(Math.random() * 50) + 10;
        document.getElementById('currentUser').textContent = 'user@xypay.com';
        
        // Tree navigation
        document.querySelectorAll('.tree-node').forEach(node => {
            node.addEventListener('click', function() {
                document.querySelectorAll('.tree-node').forEach(n => n.classList.remove('selected'));
                this.classList.add('selected');
            });
        });
    </script>
</body>
</html>
