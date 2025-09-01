<!DOCTYPE html>
<html>
<head>
    <title>XyPay Access Denied - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay System - Access Control Dialog</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Security</span>
            <span class="menu-item">View</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Error Content -->
        <div class="content-area" style="padding: 20px; text-align: center;">
            <div class="java-dialog" style="max-width: 500px; margin: 50px auto;">
                <div class="dialog-header">
                    <span class="dialog-icon">🚫</span>
                    <span class="dialog-title">Access Denied</span>
                </div>
                <div class="dialog-content">
                    <div class="error-panel">
                        <h2 style="color: #d32f2f; margin-bottom: 16px;">Error 403</h2>
                        <p style="margin-bottom: 16px;">Access to this resource has been denied by the XyPay security system.</p>
                        <p style="margin-bottom: 20px; color: #666;">You do not have sufficient permissions to access this page or perform this operation.</p>
                        
                        <div class="error-details" style="background: #f5f5f5; border: 1px inset #c0c0c0; padding: 12px; margin: 16px 0; text-align: left;">
                            <strong>Security Details:</strong><br>
                            Status Code: 403<br>
                            Error Type: Forbidden Access<br>
                            Security Level: Restricted<br>
                            Timestamp: <span id="errorTime"></span>
                        </div>
                        
                        <div class="dialog-buttons">
                            <button class="java-btn primary" onclick="window.location.href='/login'">Login</button>
                            <button class="java-btn" onclick="window.location.href='/'">Return to Dashboard</button>
                            <button class="java-btn" onclick="history.back()">Go Back</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Security Alert | Status: 403 Access Denied</span>
            <span>XyPay Security Handler v1.0</span>
        </div>
    </div>
    
    <script>
        // Set current timestamp
        document.getElementById('errorTime').textContent = new Date().toLocaleString();
        
        // Auto-focus on login button
        document.querySelector('.java-btn.primary').focus();
    </script>
</body>
</html>
