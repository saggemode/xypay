<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay System Setup Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay System Initialization Console - Setup Wizard</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Setup</span>
            <span class="menu-item">Configuration</span>
            <span class="menu-item">Validation</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">Validate Settings</button>
            <button class="toolbar-btn">Load Defaults</button>
            <button class="toolbar-btn">Test Connection</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Save Configuration</button>
            <button class="toolbar-btn">Initialize System</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Help</button>
            <button class="toolbar-btn">Documentation</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Setup Steps</div>
                
                <div class="tree-node selected" onclick="selectSetupStep(this, 'overview')">
                    <div class="tree-icon">📋</div>
                    Setup Overview
                </div>
                
                <div class="tree-node" onclick="selectSetupStep(this, 'bank-info')">
                    <div class="tree-icon">🏦</div>
                    Bank Information
                </div>
                
                <div class="tree-node" onclick="selectSetupStep(this, 'admin-account')">
                    <div class="tree-icon">👤</div>
                    Administrator Account
                </div>
                
                <div class="tree-node" onclick="selectSetupStep(this, 'system-config')">
                    <div class="tree-icon">⚙️</div>
                    System Configuration
                </div>
                
                <div class="tree-node" onclick="selectSetupStep(this, 'validation')">
                    <div class="tree-icon">✅</div>
                    Validation & Review
                </div>
                
                <div class="tree-node" onclick="selectSetupStep(this, 'initialization')">
                    <div class="tree-icon">🚀</div>
                    System Initialization
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">XyPay Core Banking System Setup</div>
                <div class="details-content" id="setup-content">
                    
                    <!-- Setup Form -->
                    <div class="config-section">
                        <div class="config-header">System Initialization Wizard</div>
                        <div class="config-content">
                            
                            <!-- Status Messages -->
                            <#if success??>
                                <div class="java-alert success" style="margin-bottom: 16px;">
                                    <strong>✅ Setup Complete!</strong><br>
                                    ${success}<br>
                                    <a href="/login" style="color: #0066cc; text-decoration: underline;">Click here to login to the system</a>
                                </div>
                            </#if>
                            
                            <#if error??>
                                <div class="java-alert error" style="margin-bottom: 16px;">
                                    <strong>❌ Setup Error:</strong><br>
                                    ${error}
                                </div>
                            </#if>
                            
                            <form action="/setup" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                
                                <!-- Bank Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">🏦 Bank Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Bank Name:</span>
                                        <input type="text" class="form-input" id="bankName" name="bankName" required placeholder="Enter the legal name of your financial institution">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">The official legal name of your financial institution</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Bank Code:</span>
                                        <input type="text" class="form-input" id="bankCode" name="bankCode" required placeholder="e.g., HQ001, MAIN, CENTRAL">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Unique identifier for your main branch (alphanumeric, 3-10 characters)</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Bank Address:</span>
                                        <textarea class="form-input" id="bankAddress" name="bankAddress" rows="3" placeholder="Enter the main branch address"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Contact Phone:</span>
                                        <input type="tel" class="form-input" id="bankPhone" name="bankPhone" placeholder="+234-xxx-xxx-xxxx">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Contact Email:</span>
                                        <input type="email" class="form-input" id="bankEmail" name="bankEmail" placeholder="info@yourbank.com">
                                    </div>
                                </fieldset>
                                
                                <!-- Administrator Account Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">👤 System Administrator Account</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">First Name:</span>
                                        <input type="text" class="form-input" id="adminFirstName" name="adminFirstName" required placeholder="Administrator's first name">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Last Name:</span>
                                        <input type="text" class="form-input" id="adminLastName" name="adminLastName" required placeholder="Administrator's last name">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Username:</span>
                                        <input type="text" class="form-input" id="adminUsername" name="adminUsername" required placeholder="Login username (no spaces)">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">This will be used to login to the system. Must be unique and contain no spaces.</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Email Address:</span>
                                        <input type="email" class="form-input" id="adminEmail" name="adminEmail" required placeholder="admin@yourbank.com">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Password:</span>
                                        <input type="password" class="form-input" id="adminPassword" name="adminPassword" required placeholder="Minimum 6 characters">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Must be at least 6 characters long. Use a strong password for security.</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Confirm Password:</span>
                                        <input type="password" class="form-input" id="adminConfirmPassword" name="adminConfirmPassword" required placeholder="Re-enter password">
                                    </div>
                                </fieldset>
                                
                                <!-- System Configuration Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">⚙️ Initial System Configuration</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Default Currency:</span>
                                        <select class="form-select" id="defaultCurrency" name="defaultCurrency">
                                            <option value="NGN">Nigerian Naira (NGN)</option>
                                            <option value="USD">US Dollar (USD)</option>
                                            <option value="EUR">Euro (EUR)</option>
                                            <option value="GBP">British Pound (GBP)</option>
                                            <option value="KES">Kenyan Shilling (KES)</option>
                                            <option value="GHS">Ghanaian Cedi (GHS)</option>
                                            <option value="ZAR">South African Rand (ZAR)</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Time Zone:</span>
                                        <select class="form-select" id="timeZone" name="timeZone">
                                            <option value="Africa/Lagos">West Africa Time (WAT)</option>
                                            <option value="UTC">Coordinated Universal Time (UTC)</option>
                                            <option value="America/New_York">Eastern Time (ET)</option>
                                            <option value="Europe/London">Greenwich Mean Time (GMT)</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Enable Demo Data:</span>
                                        <input type="checkbox" id="enableDemoData" name="enableDemoData" value="true" checked>
                                        <label for="enableDemoData" style="margin-left: 8px; font-size: 11px;">Load sample customers and transactions for testing</label>
                                    </div>
                                </fieldset>
                                
                                <!-- Setup Information -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px; background: #f8f8f8;">
                                    <legend style="font-weight: bold; font-size: 12px;">ℹ️ Post-Setup Capabilities</legend>
                                    
                                    <div style="font-size: 11px; color: #333;">
                                        <strong>After completing this setup, you will be able to:</strong>
                                        <ul style="margin: 8px 0 0 20px; padding: 0;">
                                            <li>Access the administrator dashboard and control panel</li>
                                            <li>Configure additional branches, departments, and users</li>
                                            <li>Set up banking products, services, and account types</li>
                                            <li>Define workflows, approval matrices, and permissions</li>
                                            <li>Configure interest rates, fees, and charges</li>
                                            <li>Set up KYC requirements and compliance rules</li>
                                            <li>Generate reports and analytics</li>
                                        </ul>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="button" class="java-btn" onclick="validateSetup()">Validate Configuration</button>
                                    <button type="submit" class="java-btn primary">🚀 Initialize Banking System</button>
                                    <button type="button" class="java-btn" onclick="loadDefaults()">Load Defaults</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>System Setup Ready | Configuration Status: <span id="configStatus">Pending</span> | Version: v1.0</span>
            <span>Setup Progress: <span id="setupProgress">0%</span></span>
        </div>
    </div>
    
    <script>
        function selectSetupStep(element, stepType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load step content
            const content = document.getElementById('setup-content');
            
            switch(stepType) {
                case 'overview':
                    content.innerHTML = getOverviewContent();
                    break;
                case 'bank-info':
                    content.innerHTML = getBankInfoContent();
                    break;
                case 'admin-account':
                    content.innerHTML = getAdminAccountContent();
                    break;
                case 'system-config':
                    content.innerHTML = getSystemConfigContent();
                    break;
                case 'validation':
                    content.innerHTML = getValidationContent();
                    break;
                case 'initialization':
                    content.innerHTML = getInitializationContent();
                    break;
                default:
                    // Keep default setup form
                    break;
            }
        }
        
        function validateSetup() {
            // Basic form validation
            const bankName = document.getElementById('bankName').value;
            const bankCode = document.getElementById('bankCode').value;
            const adminUsername = document.getElementById('adminUsername').value;
            const adminEmail = document.getElementById('adminEmail').value;
            const adminPassword = document.getElementById('adminPassword').value;
            const confirmPassword = document.getElementById('adminConfirmPassword').value;
            
            let errors = [];
            
            if (!bankName || bankName.length < 3) {
                errors.push('Bank name must be at least 3 characters long');
            }
            
            if (!bankCode || bankCode.length < 3) {
                errors.push('Bank code must be at least 3 characters long');
            }
            
            if (!adminUsername || adminUsername.includes(' ')) {
                errors.push('Username cannot contain spaces');
            }
            
            if (!adminEmail || !adminEmail.includes('@')) {
                errors.push('Please enter a valid email address');
            }
            
            if (!adminPassword || adminPassword.length < 6) {
                errors.push('Password must be at least 6 characters long');
            }
            
            if (adminPassword !== confirmPassword) {
                errors.push('Passwords do not match');
            }
            
            if (errors.length > 0) {
                alert('Validation Errors:\n\n' + errors.join('\n'));
                document.getElementById('configStatus').textContent = 'Invalid';
                document.getElementById('configStatus').style.color = 'red';
            } else {
                alert('✅ Configuration validation successful!\n\nAll required fields are properly filled.');
                document.getElementById('configStatus').textContent = 'Valid';
                document.getElementById('configStatus').style.color = 'green';
                updateProgress(80);
            }
        }
        
        function loadDefaults() {
            if (confirm('Load default configuration values?\n\nThis will overwrite any existing values.')) {
                document.getElementById('bankName').value = 'XyPay Financial Services';
                document.getElementById('bankCode').value = 'XYPAY001';
                document.getElementById('bankAddress').value = '123 Banking Street\nFinancial District\nLagos, Nigeria';
                document.getElementById('bankPhone').value = '+234-1-234-5678';
                document.getElementById('bankEmail').value = 'info@xypay.com';
                document.getElementById('adminFirstName').value = 'System';
                document.getElementById('adminLastName').value = 'Administrator';
                document.getElementById('adminUsername').value = 'admin';
                document.getElementById('adminEmail').value = 'admin@xypay.com';
                alert('Default values loaded successfully!');
                updateProgress(60);
            }
        }
        
        function updateProgress(percentage) {
            document.getElementById('setupProgress').textContent = percentage + '%';
        }
        
        function getOverviewContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Setup Overview</div>
                    <div class="config-content">
                        <div style="font-size: 12px; line-height: 1.6;">
                            <h4>Welcome to XyPay Core Banking System Setup</h4>
                            <p>This wizard will guide you through the initial configuration of your banking system.</p>
                            
                            <h5>Setup Steps:</h5>
                            <ol>
                                <li><strong>Bank Information</strong> - Configure your institution details</li>
                                <li><strong>Administrator Account</strong> - Create the system administrator</li>
                                <li><strong>System Configuration</strong> - Set basic system preferences</li>
                                <li><strong>Validation</strong> - Verify all settings are correct</li>
                                <li><strong>Initialization</strong> - Complete the setup process</li>
                            </ol>
                            
                            <div style="background: #f0f0f0; border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px;">
                                <strong>Important Notes:</strong>
                                <ul>
                                    <li>Ensure you have administrative privileges on this system</li>
                                    <li>Keep your administrator credentials secure</li>
                                    <li>The setup process cannot be undone without a system reset</li>
                                    <li>All fields marked as required must be completed</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getBankInfoContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Bank Information Configuration</div>
                    <div class="config-content">
                        <p>Configure your financial institution's basic information.</p>
                        <!-- Bank info form would go here -->
                    </div>
                </div>
            `;
        }
        
        function getAdminAccountContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Administrator Account Setup</div>
                    <div class="config-content">
                        <p>Create the primary system administrator account.</p>
                        <!-- Admin account form would go here -->
                    </div>
                </div>
            `;
        }
        
        function getSystemConfigContent() {
            return `
                <div class="config-section">
                    <div class="config-header">System Configuration</div>
                    <div class="config-content">
                        <p>Configure basic system settings and preferences.</p>
                        <!-- System config form would go here -->
                    </div>
                </div>
            `;
        }
        
        function getValidationContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Configuration Validation</div>
                    <div class="config-content">
                        <p>Review and validate your configuration before initialization.</p>
                        <button class="java-btn primary" onclick="validateSetup()">Run Validation</button>
                    </div>
                </div>
            `;
        }
        
        function getInitializationContent() {
            return `
                <div class="config-section">
                    <div class="config-header">System Initialization</div>
                    <div class="config-content">
                        <p>Initialize the banking system with your configuration.</p>
                        <div style="text-align: center;">
                            <button class="java-btn primary">🚀 Initialize System</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Password confirmation validation
        document.getElementById('adminConfirmPassword').addEventListener('input', function() {
            const password = document.getElementById('adminPassword').value;
            const confirm = this.value;
            
            if (password && confirm && password !== confirm) {
                this.style.borderColor = 'red';
            } else {
                this.style.borderColor = '';
            }
        });
        
        // Form progress tracking
        document.querySelectorAll('input, select, textarea').forEach(field => {
            field.addEventListener('input', function() {
                const totalFields = document.querySelectorAll('input[required], select[required], textarea[required]').length;
                const filledFields = Array.from(document.querySelectorAll('input[required], select[required], textarea[required]')).filter(f => f.value.trim() !== '').length;
                const progress = Math.round((filledFields / totalFields) * 70); // Max 70% for form completion
                updateProgress(progress);
            });
        });
        
        // Initialize
        window.onload = function() {
            document.getElementById('configStatus').textContent = 'Pending';
            document.getElementById('setupProgress').textContent = '0%';
        };
    </script>
</body>
</html>