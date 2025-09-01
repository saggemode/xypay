<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teller Deposit Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Teller Console - Deposit Service</span>
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
            <span class="menu-item">Reports</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Deposit</button>
            <button class="toolbar-btn">Account Lookup</button>
            <button class="toolbar-btn">Verify Funds</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Print Receipt</button>
            <button class="toolbar-btn">Transaction History</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Help</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Deposit Services</div>
                
                <div class="tree-node selected" onclick="selectService(this, 'cash-deposit')">
                    <div class="tree-icon">💵</div>
                    Cash Deposit
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'check-deposit')">
                    <div class="tree-icon">📄</div>
                    Check Deposit
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'transfer-deposit')">
                    <div class="tree-icon">🔄</div>
                    Transfer Deposit
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'bulk-deposit')">
                    <div class="tree-icon">📦</div>
                    Bulk Deposit
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'deposit-history')">
                    <div class="tree-icon">📋</div>
                    Deposit History
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Account Deposit Transaction</div>
                <div class="details-content">
                    
                    <div class="config-section">
                        <div class="config-header">Deposit Processing</div>
                        <div class="config-content">
                            
                            <!-- Result Messages -->
                            <#if result??>
                                <div class="java-alert success" style="margin-bottom: 16px;">
                                    <strong>✅ Transaction Result:</strong><br>
                                    ${result}
                                </div>
                            </#if>
                            
                            <form action="/teller/deposit" method="post">
                                
                                <!-- Account Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">🏦 Account Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Number:</span>
                                        <input type="text" class="form-input" id="accountNumber" name="accountNumber" required placeholder="Enter account number">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Account to receive the deposit</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Holder:</span>
                                        <input type="text" class="form-input" id="accountHolder" name="accountHolder" readonly placeholder="Will be populated after account lookup">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Current Balance:</span>
                                        <input type="text" class="form-input" id="currentBalance" name="currentBalance" readonly placeholder="Current account balance">
                                    </div>
                                    
                                    <div style="text-align: center; margin: 12px 0;">
                                        <button type="button" class="java-btn" onclick="lookupAccount()">Lookup Account</button>
                                    </div>
                                </fieldset>
                                
                                <!-- Deposit Details Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">💵 Deposit Details</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Deposit Type:</span>
                                        <select class="form-select" id="depositType" name="depositType" onchange="updateDepositFields()">
                                            <option value="CASH">Cash Deposit</option>
                                            <option value="CHECK">Check Deposit</option>
                                            <option value="TRANSFER">Transfer Deposit</option>
                                            <option value="MONEY_ORDER">Money Order</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Deposit Amount:</span>
                                        <input type="number" step="0.01" class="form-input" id="amount" name="amount" required placeholder="0.00">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Amount to be deposited into the account</div>
                                    
                                    <div class="form-row" id="checkNumberRow" style="display: none;">
                                        <span class="form-label">Check Number:</span>
                                        <input type="text" class="form-input" id="checkNumber" name="checkNumber" placeholder="Check number">
                                    </div>
                                    
                                    <div class="form-row" id="referenceRow">
                                        <span class="form-label">Reference Number:</span>
                                        <input type="text" class="form-input" id="referenceNumber" name="referenceNumber" placeholder="Transaction reference">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Description:</span>
                                        <textarea class="form-input" id="description" name="description" rows="2" placeholder="Deposit description or notes"></textarea>
                                    </div>
                                </fieldset>
                                
                                <!-- Customer Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">👤 Customer Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer Name:</span>
                                        <input type="text" class="form-input" id="customerName" name="customerName" placeholder="Name of person making deposit">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Phone Number:</span>
                                        <input type="tel" class="form-input" id="phoneNumber" name="phoneNumber" placeholder="+234-xxx-xxx-xxxx">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">ID Type:</span>
                                        <select class="form-select" id="idType" name="idType">
                                            <option value="">Select ID Type</option>
                                            <option value="DRIVERS_LICENSE">Driver's License</option>
                                            <option value="PASSPORT">Passport</option>
                                            <option value="NATIONAL_ID">National ID</option>
                                            <option value="VOTER_ID">Voter ID</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">ID Number:</span>
                                        <input type="text" class="form-input" id="idNumber" name="idNumber" placeholder="Identification number">
                                    </div>
                                </fieldset>
                                
                                <!-- Transaction Summary -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px; background: #f8f8f8;">
                                    <legend style="font-weight: bold; font-size: 12px;">📊 Transaction Summary</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Deposit Amount:</span>
                                        <input type="text" class="form-input" id="summaryAmount" readonly placeholder="0.00">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Processing Fee:</span>
                                        <input type="text" class="form-input" id="processingFee" value="0.00" readonly>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Net Deposit:</span>
                                        <input type="text" class="form-input" id="netDeposit" readonly placeholder="0.00">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">New Balance:</span>
                                        <input type="text" class="form-input" id="newBalance" readonly placeholder="Will be calculated">
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="button" class="java-btn" onclick="calculateSummary()">Calculate Summary</button>
                                    <button type="submit" class="java-btn primary">💵 Process Deposit</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                </div>
                            </form>
                            
                            <#if !result??>
                                <div style="background: #f8f8f8; border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px; font-size: 11px; color: #666;">
                                    <strong>Instructions:</strong> Enter the account number and lookup account details. 
                                    Fill in deposit amount and customer information, then process the deposit.
                                </div>
                            </#if>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Teller Console Ready | Service: Deposit Processing | Session: Active</span>
            <span>Transaction Status: <span id="transactionStatus">Ready</span></span>
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
            document.getElementById('transactionStatus').textContent = 'Service: ' + serviceType.replace('-', ' ').toUpperCase();
            
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
            document.getElementById('transactionStatus').textContent = 'Looking up account...';
            
            setTimeout(() => {
                // Simulate account data
                document.getElementById('accountHolder').value = 'John Doe';
                document.getElementById('currentBalance').value = '₦25,450.00';
                alert('✅ Account found!\n\nAccount Holder: John Doe\nAccount Type: Savings\nStatus: Active\nCurrent Balance: ₦25,450.00');
                document.getElementById('transactionStatus').textContent = 'Account Verified';
            }, 1500);
        }
        
        function updateDepositFields() {
            const depositType = document.getElementById('depositType').value;
            const checkNumberRow = document.getElementById('checkNumberRow');
            
            if (depositType === 'CHECK') {
                checkNumberRow.style.display = 'block';
                document.getElementById('checkNumber').required = true;
            } else {
                checkNumberRow.style.display = 'none';
                document.getElementById('checkNumber').required = false;
            }
        }
        
        function calculateSummary() {
            const amount = parseFloat(document.getElementById('amount').value || 0);
            const currentBalance = parseFloat(document.getElementById('currentBalance').value.replace(/[₦,]/g, '') || 0);
            const processingFee = parseFloat(document.getElementById('processingFee').value || 0);
            
            if (amount <= 0) {
                alert('❌ Please enter a valid deposit amount.');
                return;
            }
            
            const netDeposit = amount - processingFee;
            const newBalance = currentBalance + netDeposit;
            
            document.getElementById('summaryAmount').value = '₦' + amount.toFixed(2);
            document.getElementById('netDeposit').value = '₦' + netDeposit.toFixed(2);
            document.getElementById('newBalance').value = '₦' + newBalance.toFixed(2);
            
            document.getElementById('transactionStatus').textContent = 'Summary Calculated';
        }
        
        function clearForm() {
            if (confirm('Clear all form data?')) {
                document.querySelector('form').reset();
                document.getElementById('accountHolder').value = '';
                document.getElementById('currentBalance').value = '';
                document.getElementById('summaryAmount').value = '';
                document.getElementById('netDeposit').value = '';
                document.getElementById('newBalance').value = '';
                document.getElementById('transactionStatus').textContent = 'Ready';
                updateDepositFields();
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
            document.getElementById('transactionStatus').textContent = 'Ready';
            updateDepositFields();
        };
    </script>
</body>
</html>
