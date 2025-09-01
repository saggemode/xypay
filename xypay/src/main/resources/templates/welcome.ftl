<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Welcome Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Core Banking System - Welcome & Setup</span>
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
            <span class="menu-item">Documentation</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">System Overview</button>
            <button class="toolbar-btn">Quick Setup</button>
            <button class="toolbar-btn">Documentation</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Support</button>
            <button class="toolbar-btn">About</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Setup Guide</div>
                
                <div class="tree-node selected" onclick="selectSection(this, 'welcome')">
                    <div class="tree-icon">🏠</div>
                    Welcome
                </div>
                
                <div class="tree-node" onclick="selectSection(this, 'system-overview')">
                    <div class="tree-icon">📋</div>
                    System Overview
                </div>
                
                <div class="tree-node" onclick="selectSection(this, 'setup-steps')">
                    <div class="tree-icon">⚙️</div>
                    Setup Steps
                </div>
                
                <div class="tree-node" onclick="selectSection(this, 'requirements')">
                    <div class="tree-icon">📝</div>
                    Requirements
                </div>
                
                <div class="tree-node" onclick="selectSection(this, 'support')">
                    <div class="tree-icon">💬</div>
                    Support & Help
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Welcome to XyPay Core Banking System</div>
                <div class="details-content" id="welcome-content">
                    
                    <div class="config-section">
                        <div class="config-header">🏦 XyPay Core Banking Platform</div>
                        <div class="config-content">
                            
                            <!-- Welcome Message -->
                            <div style="text-align: center; margin-bottom: 24px;">
                                <div style="background: #f0f0f0; border: 2px inset #c0c0c0; padding: 16px; margin-bottom: 16px;">
                                    <div style="font-size: 24px; font-weight: bold; color: #333; margin-bottom: 8px;">XyPay</div>
                                    <div style="font-size: 14px; color: #666;">Core Banking System v1.0</div>
                                </div>
                                
                                <div style="font-size: 16px; font-weight: bold; margin-bottom: 12px;">Welcome to Your Banking Solution</div>
                                <div style="font-size: 12px; color: #666; line-height: 1.5;">
                                    Thank you for choosing XyPay as your core banking platform. 
                                    To begin using the system, you'll need to complete the initial setup process.
                                </div>
                            </div>
                            
                            <!-- Setup Status -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px; background: #fff8dc;">
                                <legend style="font-weight: bold; font-size: 12px;">🚨 Setup Required</legend>
                                
                                <div style="font-size: 12px; color: #333; margin-bottom: 12px;">
                                    <strong>Current Status:</strong> System requires initial configuration
                                </div>
                                
                                <div style="font-size: 11px; color: #666; line-height: 1.4;">
                                    Before you can access the banking modules, you must complete the setup wizard to:
                                    <ul style="margin: 8px 0 0 20px; padding: 0;">
                                        <li>Configure your bank information and settings</li>
                                        <li>Create the first system administrator account</li>
                                        <li>Set up initial system preferences</li>
                                        <li>Initialize the database and security settings</li>
                                    </ul>
                                </div>
                            </fieldset>
                            
                            <!-- Setup Components -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">📋 Setup Components</legend>
                                
                                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 12px; margin-bottom: 12px;">
                                    
                                    <div style="border: 1px inset #c0c0c0; padding: 8px; text-align: center; background: #f8f8f8;">
                                        <div style="font-size: 20px; margin-bottom: 4px;">👤</div>
                                        <div style="font-weight: bold; font-size: 11px; margin-bottom: 4px;">Administrator Account</div>
                                        <div style="font-size: 10px; color: #666; line-height: 1.3;">
                                            Create the first system administrator with full access to all modules and configurations
                                        </div>
                                    </div>
                                    
                                    <div style="border: 1px inset #c0c0c0; padding: 8px; text-align: center; background: #f8f8f8;">
                                        <div style="font-size: 20px; margin-bottom: 4px;">🏦</div>
                                        <div style="font-weight: bold; font-size: 11px; margin-bottom: 4px;">Bank Configuration</div>
                                        <div style="font-size: 10px; color: #666; line-height: 1.3;">
                                            Set up your bank's basic information, branch structure, and operational settings
                                        </div>
                                    </div>
                                    
                                    <div style="border: 1px inset #c0c0c0; padding: 8px; text-align: center; background: #f8f8f8;">
                                        <div style="font-size: 20px; margin-bottom: 4px;">⚙️</div>
                                        <div style="font-weight: bold; font-size: 11px; margin-bottom: 4px;">System Settings</div>
                                        <div style="font-size: 10px; color: #666; line-height: 1.3;">
                                            Configure currencies, time zones, security policies, and regulatory compliance
                                        </div>
                                    </div>
                                    
                                </div>
                            </fieldset>
                            
                            <!-- Post-Setup Features -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">🚀 Available After Setup</legend>
                                
                                <div style="font-size: 11px; color: #333; line-height: 1.4;">
                                    <strong>Once setup is complete, you'll have access to:</strong>
                                    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 8px; margin-top: 8px;">
                                        <div>
                                            <ul style="margin: 0; padding-left: 16px; font-size: 10px;">
                                                <li>Customer account management</li>
                                                <li>Transaction processing</li>
                                                <li>Loan and credit services</li>
                                                <li>KYC and compliance tools</li>
                                            </ul>
                                        </div>
                                        <div>
                                            <ul style="margin: 0; padding-left: 16px; font-size: 10px;">
                                                <li>Reporting and analytics</li>
                                                <li>User and role management</li>
                                                <li>Branch operations</li>
                                                <li>System administration</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            
                            <!-- Action Buttons -->
                            <div style="text-align: center; margin-top: 24px;">
                                <a href="/setup" class="java-btn primary" style="text-decoration: none; display: inline-block; margin: 0 8px;">
                                    🚀 Begin Setup Process
                                </a>
                                <button type="button" class="java-btn" onclick="showSystemInfo()">System Information</button>
                                <button type="button" class="java-btn" onclick="showHelp()">Help & Support</button>
                            </div>
                            
                            <!-- System Information -->
                            <div style="background: #f0f0f0; border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px; font-size: 10px; color: #666;">
                                <strong>System Information:</strong><br>
                                Version: XyPay Core Banking System v1.0<br>
                                Build: Production Release<br>
                                Platform: Java Spring Boot with FreeMarker Templates<br>
                                Database: Ready for initialization<br>
                                Status: Awaiting initial setup
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>XyPay Core Banking System | Status: Setup Required | Version: v1.0</span>
            <span>Setup Progress: <span id="setupProgress">Not Started</span></span>
        </div>
    </div>
    
    <script>
        function selectSection(element, sectionType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load section content
            const content = document.getElementById('welcome-content');
            
            switch(sectionType) {
                case 'welcome':
                    // Keep default welcome content
                    break;
                case 'system-overview':
                    content.innerHTML = getSystemOverviewContent();
                    break;
                case 'setup-steps':
                    content.innerHTML = getSetupStepsContent();
                    break;
                case 'requirements':
                    content.innerHTML = getRequirementsContent();
                    break;
                case 'support':
                    content.innerHTML = getSupportContent();
                    break;
            }
        }
        
        function showSystemInfo() {
            alert('XyPay Core Banking System\n\nVersion: 1.0\nBuild: Production Release\nPlatform: Java Spring Boot\nDatabase: MySQL/PostgreSQL Compatible\nSecurity: Enterprise Grade\nCompliance: Banking Regulations Ready\n\nStatus: Awaiting Initial Setup');
        }
        
        function showHelp() {
            alert('XyPay Setup Help\n\n1. Click "Begin Setup Process" to start\n2. Follow the setup wizard steps\n3. Complete all required fields\n4. Review and confirm settings\n5. Initialize the system\n\nFor technical support:\n- Email: support@xypay.com\n- Phone: +1-800-XYPAY-HELP\n- Documentation: Available after setup');
        }
        
        function getSystemOverviewContent() {
            return `
                <div class="config-section">
                    <div class="config-header">System Overview</div>
                    <div class="config-content">
                        <div style="font-size: 12px; line-height: 1.6;">
                            <h4>XyPay Core Banking System Architecture</h4>
                            <p>A comprehensive banking platform built for modern financial institutions.</p>
                            
                            <h5>Key Features:</h5>
                            <ul>
                                <li>Multi-user role-based access control</li>
                                <li>Real-time transaction processing</li>
                                <li>Comprehensive audit trails</li>
                                <li>Regulatory compliance tools</li>
                                <li>Scalable microservices architecture</li>
                            </ul>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getSetupStepsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Setup Process Steps</div>
                    <div class="config-content">
                        <div style="font-size: 12px; line-height: 1.6;">
                            <h4>Complete Setup in 5 Easy Steps</h4>
                            
                            <ol>
                                <li><strong>Bank Information</strong> - Enter your institution details</li>
                                <li><strong>Administrator Account</strong> - Create the first admin user</li>
                                <li><strong>System Configuration</strong> - Set preferences and settings</li>
                                <li><strong>Validation</strong> - Review all configurations</li>
                                <li><strong>Initialization</strong> - Complete the setup process</li>
                            </ol>
                            
                            <p><strong>Estimated Time:</strong> 10-15 minutes</p>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getRequirementsContent() {
            return `
                <div class="config-section">
                    <div class="config-header">System Requirements</div>
                    <div class="config-content">
                        <div style="font-size: 12px; line-height: 1.6;">
                            <h4>Minimum System Requirements</h4>
                            
                            <h5>Server Requirements:</h5>
                            <ul>
                                <li>Java 11 or higher</li>
                                <li>4GB RAM minimum (8GB recommended)</li>
                                <li>10GB available disk space</li>
                                <li>MySQL 8.0 or PostgreSQL 12+</li>
                            </ul>
                            
                            <h5>Browser Support:</h5>
                            <ul>
                                <li>Chrome 90+ (Recommended)</li>
                                <li>Firefox 88+</li>
                                <li>Safari 14+</li>
                                <li>Edge 90+</li>
                            </ul>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getSupportContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Support & Help</div>
                    <div class="config-content">
                        <div style="font-size: 12px; line-height: 1.6;">
                            <h4>Get Help with XyPay</h4>
                            
                            <h5>Support Channels:</h5>
                            <ul>
                                <li><strong>Email:</strong> support@xypay.com</li>
                                <li><strong>Phone:</strong> +1-800-XYPAY-HELP</li>
                                <li><strong>Live Chat:</strong> Available 24/7</li>
                                <li><strong>Documentation:</strong> Comprehensive guides available</li>
                            </ul>
                            
                            <h5>Common Setup Issues:</h5>
                            <ul>
                                <li>Database connection problems</li>
                                <li>Port configuration issues</li>
                                <li>Permission and security settings</li>
                                <li>Initial data loading</li>
                            </ul>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('setupProgress').textContent = 'Not Started';
        };
    </script>
</body>
</html>