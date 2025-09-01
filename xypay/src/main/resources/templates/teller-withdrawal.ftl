<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teller Withdrawal Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Teller Console - Withdrawal Service</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">Transaction</span>
            <span class="menu-item">Account</span>
            <span class="menu-item">Security</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Withdrawal</button>
            <button class="toolbar-btn">Account Lookup</button>
            <button class="toolbar-btn">Verify Identity</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Check Balance</button>
            <button class="toolbar-btn">Transaction Limits</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Help</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Withdrawal Services</div>
                
                <div class="tree-node selected" onclick="selectService(this, 'cash-withdrawal')">
                    <div class="tree-icon">💸</div>
                    Cash Withdrawal
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'atm-withdrawal')">
                    <div class="tree-icon">🏧</div>
                    ATM Withdrawal
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'transfer-withdrawal')">
                    <div class="tree-icon">🔄</div>
                    Transfer Withdrawal
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'emergency-withdrawal')">
                    <div class="tree-icon">🚨</div>
                    Emergency Withdrawal
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'withdrawal-history')">
                    <div class="tree-icon">📋</div>
                    Withdrawal History
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Account Withdrawal Transaction</div>
                <div class="details-content">
                    
                    <div class="config-section">
                        <div class="config-header">Withdrawal Processing</div>
                        <div class="config-content">
                            
                            <!-- Result Messages -->
                            <#if result??>
                                <div class="java-alert success" style="margin-bottom: 16px;">
                                    <strong>✅ Transaction Result:</strong><br>
                                    ${result}
                                </div>
                            </#if>
                            
                            <form action="/teller/withdrawal" method="post">
                                
                                <!-- Account Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">🏦 Account Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Number:</span>
                                        <input type="text" class="form-input" id="accountNumber" name="accountNumber" required placeholder="Enter account number">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Account from which to withdraw funds</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Holder:</span>
                                        <input type="text" class="form-input" id="accountHolder" name="accountHolder" readonly placeholder="Will be populated after account lookup">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Available Balance:</span>
                                        <input type="text" class="form-input" id="availableBalance" name="availableBalance" readonly placeholder="Available balance">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Daily Limit Remaining:</span>
                                        <input type="text" class="form-input" id="dailyLimit" name="dailyLimit" readonly placeholder="Daily withdrawal limit">
                                    </div>
                                    
                                    <div style="text-align: center; margin: 12px 0;">
                                        <button type="button" class="java-btn" onclick="lookupAccount()">Lookup Account</button>
                                        <button type="button" class="java-btn" onclick="checkLimits()">Check Limits</button>
                                    </div>
                                </fieldset>
                                
                                <!-- Withdrawal Details Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">💸 Withdrawal Details</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Withdrawal Type:</span>
                                        <select class="form-select" id="withdrawalType" name="withdrawalType" onchange="updateWithdrawalFields()">
                                            <option value="CASH">Cash Withdrawal</option>
                                            <option value="TRANSFER">Transfer to Another Account</option>
                                            <option value="CHECK">Cashier's Check</option>
                                            <option value="EMERGENCY">Emergency Withdrawal</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Withdrawal Amount:</span>
                                        <input type="number" step="0.01" class="form-input" id="amount" name="amount" required placeholder="0.00">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Amount to be withdrawn from the account</div>
                                    
                                    <div class="form-row" id="transferAccountRow" style="display: none;">
                                        <span class="form-label">Transfer To Account:</span>
                                        <input type="text" class="form-input" id="transferAccount" name="transferAccount" placeholder="Destination account number">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Purpose/Description:</span>
                                        <textarea class="form-input" id="purpose" name="purpose" rows="2" placeholder="Purpose of withdrawal"></textarea>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Reference Number:</span>
                                        <input type="text" class="form-input" id="referenceNumber" name="referenceNumber" placeholder="Transaction reference">
                                    </div>
                                </fieldset>
                                
                                <!-- Customer Verification Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">🔒 Customer Verification</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Name:</span>
                                        <input type="text" class="form-input" id="customerName" name="customerName" required placeholder="Full name of customer">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">ID Type:</span>
                                        <select class="form-select" id="idType" name="idType" required>
                                            <option value="">Select ID Type</option>
                                            <option value="DRIVERS_LICENSE">Driver's License</option>
                                            <option value="PASSPORT">Passport</option>
                                            <option value="NATIONAL_ID">National ID</option>
                                            <option value="VOTER_ID">Voter ID</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">ID Number:</span>
                                        <input type="text" class="form-input" id="idNumber" name="idNumber" required placeholder="Identification number">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Phone Number:</span>
                                        <input type="tel" class="form-input" id="phoneNumber" name="phoneNumber" placeholder="+234-xxx-xxx-xxxx">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">PIN/Password:</span>
                                        <input type="password" class="form-input" id="customerPin" name="customerPin" placeholder="Customer PIN or password">
                                    </div>
                                    
                                    <div style="text-align: center; margin: 12px 0;">
                                        <button type="button" class="java-btn" onclick="verifyIdentity()">Verify Identity</button>
                                    </div>
                                </fieldset>
                                
                                <!-- Transaction Summary -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px; background: #f8f8f8;">
                                    <legend style="font-weight: bold; font-size: 12px;">📊 Transaction Summary</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Withdrawal Amount:</span>
                                        <input type="text" class="form-input" id="summaryAmount" readonly placeholder="0.00">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Transaction Fee:</span>
                                        <input type="text" class="form-input" id="transactionFee" value="2.50" readonly>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Total Deduction:</span>
                                        <input type="text" class="form-input" id="totalDeduction" readonly placeholder="0.00">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Remaining Balance:</span>
                                        <input type="text" class="form-input" id="remainingBalance" readonly placeholder="Will be calculated">
                                    </div>
                                    
                                    <div class="form-row">
                                        <input type="checkbox" id="confirmWithdrawal" name="confirmWithdrawal" required>
                                        <label for="confirmWithdrawal" style="margin-left: 8px; font-size: 11px;">I confirm the withdrawal details are correct</label>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="button" class="java-btn" onclick="calculateSummary()">Calculate Summary</button>
                                    <button type="submit" class="java-btn primary">💸 Process Withdrawal</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                </div>
                            </form>
                            
                            <#if !result??>
                                <div style="background: #f8f8f8; border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px; font-size: 11px; color: #666;">
                                    <strong>Security Notice:</strong> Verify customer identity before processing any withdrawal. 
                                    Check account balance and daily limits. Ensure all required fields are completed.
                                </div>
                            </#if>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Teller Console Ready | Service: Withdrawal Processing | Session: Active</span>
            <span>Security Status: <span id="securityStatus">Pending Verification</span></span>
        </div>
    </div>
    
    <script>
        function selectService(element, serviceType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Update status
            document.getElementById('securityStatus').textContent = 'Service: ' + serviceType.replace('-', ' ').toUpperCase();
            
            // In a real application, this would load different service forms
            alert('Service selected: ' + serviceType.replace('-', ' ').toUpperCase());
        }
        
        function lookupAccount() {
            const accountNumber = document.getElementById('accountNumber').value;
            
            if (!accountNumber) {
                alert('❌ Please enter an account number first.');
                return;
            }
            
            // Simulate account lookup
            document.getElementById('securityStatus').textContent = 'Looking up account...';
            
            setTimeout(() => {
                // Simulate account data
                document.getElementById('accountHolder').value = 'Jane Smith';
                document.getElementById('availableBalance').value = '₦45,230.75';
                document.getElementById('dailyLimit').value = '₦50,000.00';
                alert('✅ Account found!\n\nAccount Holder: Jane Smith\nAccount Type: Current\nStatus: Active\nAvailable Balance: ₦45,230.75');
                document.getElementById('securityStatus').textContent = 'Account Located';
            }, 1500);
        }
        
        function checkLimits() {
            const amount = parseFloat(document.getElementById('amount').value || 0);
            const availableBalance = parseFloat(document.getElementById('availableBalance').value.replace(/[₦,]/g, '') || 0);
            const dailyLimit = parseFloat(document.getElementById('dailyLimit').value.replace(/[₦,]/g, '') || 0);
            
            if (amount <= 0) {
                alert('❌ Please enter a withdrawal amount first.');
                return;
            }
            
            let warnings = [];
            
            if (amount > availableBalance) {
                warnings.push('Insufficient funds - Amount exceeds available balance');
            }
            
            if (amount > dailyLimit) {
                warnings.push('Daily limit exceeded - Amount exceeds daily withdrawal limit');
            }
            
            if (warnings.length > 0) {
                alert('⚠️ Limit Check Warnings:\n\n' + warnings.join('\n'));
                document.getElementById('securityStatus').textContent = 'Limit Warning';
            } else {
                alert('✅ Limit check passed - Withdrawal amount is within limits');
                document.getElementById('securityStatus').textContent = 'Limits OK';
            }
        }
        
        function updateWithdrawalFields() {
            const withdrawalType = document.getElementById('withdrawalType').value;
            const transferAccountRow = document.getElementById('transferAccountRow');
            
            if (withdrawalType === 'TRANSFER') {
                transferAccountRow.style.display = 'block';
                document.getElementById('transferAccount').required = true;
            } else {
                transferAccountRow.style.display = 'none';
                document.getElementById('transferAccount').required = false;
            }
        }
        
        function verifyIdentity() {
            const customerName = document.getElementById('customerName').value;
            const idType = document.getElementById('idType').value;
            const idNumber = document.getElementById('idNumber').value;
            
            if (!customerName || !idType || !idNumber) {
                alert('❌ Please fill in customer name, ID type, and ID number for verification.');
                return;
            }
            
            // Simulate identity verification
            document.getElementById('securityStatus').textContent = 'Verifying identity...';
            
            setTimeout(() => {
                alert('✅ Identity verification completed.\n\nCustomer: ' + customerName + '\nID Type: ' + idType + '\nStatus: Verified\nMatch: Confirmed');
                document.getElementById('securityStatus').textContent = 'Identity Verified';
            }, 2000);
        }
        
        function calculateSummary() {
            const amount = parseFloat(document.getElementById('amount').value || 0);
            const availableBalance = parseFloat(document.getElementById('availableBalance').value.replace(/[₦,]/g, '') || 0);
            const transactionFee = parseFloat(document.getElementById('transactionFee').value || 0);
            
            if (amount <= 0) {
                alert('❌ Please enter a valid withdrawal amount.');
                return;
            }
            
            const totalDeduction = amount + transactionFee;
            const remainingBalance = availableBalance - totalDeduction;
            
            document.getElementById('summaryAmount').value = '₦' + amount.toFixed(2);
            document.getElementById('totalDeduction').value = '₦' + totalDeduction.toFixed(2);
            document.getElementById('remainingBalance').value = '₦' + remainingBalance.toFixed(2);
            
            document.getElementById('securityStatus').textContent = 'Summary Calculated';
        }
        
        function clearForm() {
            if (confirm('Clear all form data?')) {
                document.querySelector('form').reset();
                document.getElementById('accountHolder').value = '';
                document.getElementById('availableBalance').value = '';
                document.getElementById('dailyLimit').value = '';
                document.getElementById('summaryAmount').value = '';
                document.getElementById('totalDeduction').value = '';
                document.getElementById('remainingBalance').value = '';
                document.getElementById('securityStatus').textContent = 'Pending Verification';
                updateWithdrawalFields();
            }
        }
        
        // Auto-update summary when amount changes
        document.getElementById('amount').addEventListener('input', function() {
            const amount = parseFloat(this.value || 0);
            if (amount > 0) {
                document.getElementById('summaryAmount').value = '₦' + amount.toFixed(2);
                calculateSummary();
            }
        });
        
        // Initialize
        window.onload = function() {
            document.getElementById('securityStatus').textContent = 'Pending Verification';
            updateWithdrawalFields();
        };
    </script>
</body>
</html>
