<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Login - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
    <style>
        .login-dialog {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            background: #e8e8e8;
            border: 2px outset #c0c0c0;
            z-index: 1000;
        }
        
        .login-content {
            padding: 20px;
        }
        
        .login-field {
            margin-bottom: 16px;
        }
        
        .login-field label {
            display: block;
            font-weight: bold;
            font-size: 12px;
            margin-bottom: 4px;
        }
        
        .login-field input {
            width: 100%;
            padding: 4px 6px;
            border: 1px inset #c0c0c0;
            font-size: 12px;
        }
        
        .login-buttons {
            text-align: center;
            margin-top: 20px;
        }
        
        .error-panel {
            background: #ffe0e0;
            border: 1px solid #ff8080;
            padding: 8px;
            margin-bottom: 16px;
            font-size: 11px;
            color: #cc0000;
        }
        
        .info-panel {
            background: #e0f0ff;
            border: 1px solid #80c0ff;
            padding: 8px;
            margin-bottom: 16px;
            font-size: 11px;
            color: #0066cc;
        }
        
        .login-footer {
            background: #f0f0f0;
            border-top: 1px solid #a0a0a0;
            padding: 8px;
            text-align: center;
            font-size: 10px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Authentication System</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Options</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Main Content -->
        <div style="padding: 40px; text-align: center; background: #f0f0f0; min-height: 400px;">
            
            <!-- Login Dialog -->
            <div class="login-dialog">
                <div class="title-bar">
                    <span>🔐 XyPay Admin Login</span>
                </div>
                
                <div class="login-content">
                    <#if RequestParameters.error??>
                        <div class="error-panel">
                            ❌ Invalid username or password.
                        </div>
                    </#if>
                    <#if RequestParameters.logout??>
                        <div class="info-panel">
                            ℹ️ You have been logged out successfully.
                        </div>
                    </#if>
                    
                    <form action="/login" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        
                        <div class="login-field">
                            <label for="username">👤 Username:</label>
                            <input type="text" id="username" name="username" required autocomplete="username">
                        </div>
                        
                        <div class="login-field">
                            <label for="password">🔑 Password:</label>
                            <input type="password" id="password" name="password" required autocomplete="current-password">
                        </div>
                        
                        <div class="login-buttons">
                            <button type="submit" class="java-btn primary">Login</button>
                            <button type="button" class="java-btn" onclick="clearForm()">Clear</button>
                        </div>
                    </form>
                </div>
                
                <div class="login-footer">
                    XyPay Core Banking System v2.1.0 - Java Style Interface
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Authentication Required | Please enter your credentials</span>
            <span>Secure Connection | SSL Enabled</span>
        </div>
    </div>
    
    <script>
        function clearForm() {
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
            document.getElementById('username').focus();
        }
        
        // Focus on username field when page loads
        window.onload = function() {
            document.getElementById('username').focus();
        };
        
        // Enter key handling
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                document.querySelector('form').submit();
            }
        });
    </script>
</body>
</html>