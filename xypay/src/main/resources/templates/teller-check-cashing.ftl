<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teller Check Cashing Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Teller Console - Check Cashing Service</span>
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
            <span class="menu-item">Verification</span>
            <span class="menu-item">Reports</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Transaction</button>
            <button class="toolbar-btn">Verify Check</button>
            <button class="toolbar-btn">Account Lookup</button>
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
                <div class="tree-header">Check Services</div>
                
                <div class="tree-node selected" onclick="selectService(this, 'check-cashing')">
                    <div class="tree-icon">💰</div>
                    Check Cashing
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'check-verification')">
                    <div class="tree-icon">🔍</div>
                    Check Verification
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'check-deposit')">
                    <div class="tree-icon">📥</div>
                    Check Deposit
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'transaction-history')">
                    <div class="tree-icon">📋</div>
                    Transaction History
                </div>
                
                <div class="tree-node" onclick="selectService(this, 'daily-summary')">
                    <div class="tree-icon">📊</div>
                    Daily Summary
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Check Cashing Transaction</div>
                <div class="details-content">
                    
                    <div class="config-section">
                        <div class="config-header">Check Cashing Service</div>
                        <div class="config-content">
                            
                            <!-- Result Messages -->
                            <#if result??>
                                <div class="java-alert success" style="margin-bottom: 16px;">
                                    <strong>✅ Transaction Result:</strong><br>
                                    ${result}
                                </div>
                            </#if>
                            
                            <form method="post" action="/teller/check-cashing" autocomplete="off">
                                
                                <!-- Check Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">💰 Check Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Check Number:</span>
                                        <input type="text" class="form-input" id="checkNumber" name="checkNumber" required placeholder="Enter check number">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">The unique check number printed on the check</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Check Amount:</span>
                                        <input type="number" step="0.01" class="form-input" id="amount" name="amount" required placeholder="0.00">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Amount written on the check (must match exactly)</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Check Date:</span>
                                        <input type="date" class="form-input" id="checkDate" name="checkDate">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Payee Name:</span>
                                        <input type="text" class="form-input" id="payeeName" name="payeeName" placeholder="Name on check">
                                    </div>
                                </fieldset>
                                
                                <!-- Account Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">🏦 Account Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Account Number:</span>
                                        <input type="text" class="form-input" id="accountNumber" name="accountNumber" required placeholder="Enter account number">
                                    </div>
                                    <div style="font-size: 10px; color: #666; margin-bottom: 12px;">Account number from which the check is drawn</div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Routing Number:</span>
                                        <input type="text" class="form-input" id="routingNumber" name="routingNumber" placeholder="Bank routing number">
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Bank Name:</span>
                                        <input type="text" class="form-input" id="bankName" name="bankName" placeholder="Issuing bank name">
                                    </div>
                                </fieldset>
                                
                                <!-- Customer Information Section -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">👤 Customer Information</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Customer ID:</span>
                                        <input type="text" class="form-input" id="customerId" name="customerId" placeholder="Customer identification">
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
                                        <span class="form-label">Phone Number:</span>
                                        <input type="tel" class="form-input" id="phoneNumber" name="phoneNumber" placeholder="+234-xxx-xxx-xxxx">
                                    </div>
                                </fieldset>
                                
                                <!-- Transaction Options -->
                                <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px;">
                                    <legend style="font-weight: bold; font-size: 12px;">⚙️ Transaction Options</legend>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Service Fee:</span>
                                        <input type="number" step="0.01" class="form-input" id="serviceFee" name="serviceFee" value="5.00" readonly>
                                    </div>
                                    
                                    <div class="form-row">
                                        <span class="form-label">Cash Out Amount:</span>
                                        <input type="number" step="0.01" class="form-input" id="cashOutAmount" name="cashOutAmount" readonly placeholder="Calculated automatically">
                                    </div>
                                    
                                    <div class="form-row">
                                        <input type="checkbox" id="verifyFunds" name="verifyFunds" value="true" checked>
                                        <label for="verifyFunds" style="margin-left: 8px; font-size: 11px;">Verify funds availability before cashing</label>
                                    </div>
                                    
                                    <div class="form-row">
                                        <input type="checkbox" id="printReceipt" name="printReceipt" value="true" checked>
                                        <label for="printReceipt" style="margin-left: 8px; font-size: 11px;">Print transaction receipt</label>
                                    </div>
                                </fieldset>
                                
                                <div style="text-align: center; margin-top: 20px;">
                                    <button type="button" class="java-btn" onclick="verifyCheck()">Verify Check</button>
                                    <button type="submit" class="java-btn primary">💰 Cash Check</button>
                                    <button type="button" class="java-btn" onclick="clearForm()">Clear Form</button>
                                </div>
                            </form>
                            
                            <#if !result??>
                                <div style="background: #f8f8f8; border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px; font-size: 11px; color: #666;">
                                    <strong>Instructions:</strong> Fill out all required fields to process a check cashing transaction. 
                                    Verify customer identification and check authenticity before proceeding.
                                </div>
                            </#if>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Teller Console Ready | Service: Check Cashing | Session: Active</span>
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
            document.getElementById('transactionStatus').textContent = 'Service Selected: ' + serviceType.replace('-', ' ').toUpperCase();
            
            // In a real application, this would load different service forms
            alert('Service selected: ' + serviceType.replace('-', ' ').toUpperCase());
        }
        
        function verifyCheck() {
            const checkNumber = document.getElementById('checkNumber').value;
            const accountNumber = document.getElementById('accountNumber').value;
            const amount = document.getElementById('amount').value;
            
            if (!checkNumber || !accountNumber || !amount) {
                alert('❌ Please fill in check number, account number, and amount before verification.');
                return;
            }
            
            // Simulate check verification
            document.getElementById('transactionStatus').textContent = 'Verifying...';
            
            setTimeout(() => {
                alert('✅ Check verification completed.\n\nCheck Status: Valid\nFunds Available: Yes\nAccount Status: Active');
                document.getElementById('transactionStatus').textContent = 'Verified';
                
                // Calculate cash out amount (amount minus service fee)
                const cashOut = parseFloat(amount) - parseFloat(document.getElementById('serviceFee').value || 0);
                document.getElementById('cashOutAmount').value = cashOut.toFixed(2);
            }, 2000);
        }
        
        function clearForm() {
            if (confirm('Clear all form data?')) {
                document.querySelector('form').reset();
                document.getElementById('cashOutAmount').value = '';
                document.getElementById('transactionStatus').textContent = 'Ready';
            }
        }
        
        // Auto-calculate cash out amount when amount or service fee changes
        document.getElementById('amount').addEventListener('input', calculateCashOut);
        document.getElementById('serviceFee').addEventListener('input', calculateCashOut);
        
        function calculateCashOut() {
            const amount = parseFloat(document.getElementById('amount').value || 0);
            const serviceFee = parseFloat(document.getElementById('serviceFee').value || 0);
            const cashOut = amount - serviceFee;
            
            if (amount > 0) {
                document.getElementById('cashOutAmount').value = cashOut.toFixed(2);
            }
        }
        
        // Initialize
        window.onload = function() {
            document.getElementById('transactionStatus').textContent = 'Ready';
        };
    </script>
</body>
</html>
