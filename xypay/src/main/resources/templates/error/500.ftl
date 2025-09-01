<!DOCTYPE html>
<html>
<head>
    <title>XyPay Server Error - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay System - Critical Error Dialog</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">System</span>
            <span class="menu-item">Debug</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Error Content -->
        <div class="content-area" style="padding: 20px; text-align: center;">
            <div class="java-dialog" style="max-width: 500px; margin: 50px auto;">
                <div class="dialog-header">
                    <span class="dialog-icon">❌</span>
                    <span class="dialog-title">Internal Server Error</span>
                </div>
                <div class="dialog-content">
                    <div class="error-panel">
                        <h2 style="color: #d32f2f; margin-bottom: 16px;">Error 500</h2>
                        <p style="margin-bottom: 16px;">An internal server error has occurred in the XyPay system.</p>
                        <p style="margin-bottom: 20px; color: #666;">The server encountered an unexpected condition that prevented it from fulfilling the request.</p>
                        
                        <div class="error-details" style="background: #f5f5f5; border: 1px inset #c0c0c0; padding: 12px; margin: 16px 0; text-align: left;">
                            <strong>System Details:</strong><br>
                            Status Code: 500<br>
                            Error Type: Internal Server Error<br>
                            System Status: Service Disruption<br>
                            Timestamp: <span id="errorTime"></span><br>
                            Error ID: <span id="errorId"></span>
                        </div>
                        
                        <div class="dialog-buttons">
                            <button class="java-btn primary" onclick="window.location.reload()">Retry Request</button>
                            <button class="java-btn" onclick="window.location.href='/'">Return to Dashboard</button>
                            <button class="java-btn" onclick="reportError()">Report Error</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>System Error | Status: 500 Internal Server Error</span>
            <span>XyPay Error Handler v1.0</span>
        </div>
    </div>
    
    <script>
        // Set current timestamp and generate error ID
        document.getElementById('errorTime').textContent = new Date().toLocaleString();
        document.getElementById('errorId').textContent = 'ERR-' + Math.random().toString(36).substr(2, 9).toUpperCase();
        
        // Auto-focus on retry button
        document.querySelector('.java-btn.primary').focus();
        
        function reportError() {
            alert('Error report functionality would be implemented here.\nError details have been logged for system administrators.');
        }
    </script>
</body>
</html>
