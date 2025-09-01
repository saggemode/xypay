<!DOCTYPE html>
<html>
<head>
    <title>XyPay System Error - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay System - Error Dialog</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Edit</span>
            <span class="menu-item">View</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Error Content -->
        <div class="content-area" style="padding: 20px; text-align: center;">
            <div class="java-dialog" style="max-width: 500px; margin: 50px auto;">
                <div class="dialog-header">
                    <span class="dialog-icon">⚠️</span>
                    <span class="dialog-title">Page Not Found</span>
                </div>
                <div class="dialog-content">
                    <div class="error-panel">
                        <h2 style="color: #d32f2f; margin-bottom: 16px;">Error 404</h2>
                        <p style="margin-bottom: 16px;">The requested page could not be found on the XyPay system.</p>
                        <p style="margin-bottom: 20px; color: #666;">The page you are looking for does not exist or has been moved to a different location.</p>
                        
                        <div class="error-details" style="background: #f5f5f5; border: 1px inset #c0c0c0; padding: 12px; margin: 16px 0; text-align: left;">
                            <strong>Error Details:</strong><br>
                            Status Code: 404<br>
                            Error Type: Resource Not Found<br>
                            Timestamp: <span id="errorTime"></span>
                        </div>
                        
                        <div class="dialog-buttons">
                            <button class="java-btn primary" onclick="window.location.href='/'">Return to Dashboard</button>
                            <button class="java-btn" onclick="history.back()">Go Back</button>
                            <button class="java-btn" onclick="window.location.reload()">Retry</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>System Error | Status: 404 Not Found</span>
            <span>XyPay Error Handler v1.0</span>
        </div>
    </div>
    
    <script>
        // Set current timestamp
        document.getElementById('errorTime').textContent = new Date().toLocaleString();
        
        // Auto-focus on primary button
        document.querySelector('.java-btn.primary').focus();
    </script>
</body>
</html>
