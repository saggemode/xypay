<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>XyPay Teller Station - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Teller Station - Transaction Processing Interface</span>
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
            <span class="menu-item">Tools</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">New Trans</button>
            <button class="toolbar-btn">Lookup</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Deposit</button>
            <button class="toolbar-btn">Withdraw</button>
            <button class="toolbar-btn">Transfer</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Balance</button>
            <button class="toolbar-btn">History</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Print</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Teller Operations</div>
                
                <div class="tree-node selected" onclick="selectOperation(this, 'dashboard')">
                    <div class="tree-icon">🏠</div>
                    Dashboard
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'deposit')">
                    <div class="tree-icon">💵</div>
                    Cash Deposit
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'withdrawal')">
                    <div class="tree-icon">💸</div>
                    Cash Withdrawal
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'check')">
                    <div class="tree-icon">📄</div>
                    Check Cashing
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'lookup')">
                    <div class="tree-icon">🔍</div>
                    Account Lookup
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'balance')">
                    <div class="tree-icon">⚖️</div>
                    Balance Inquiry
                </div>
                
                <div class="tree-node" onclick="selectOperation(this, 'history')">
                    <div class="tree-icon">📊</div>
                    Transaction History
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Teller Operations Center</div>
                <div class="details-content" id="operation-content">
                    
                    <!-- Dashboard Content -->
                    <div class="config-section">
                        <div class="config-header">Welcome, Teller</div>
                        <div class="config-content">
                            <p>Ready to process customer transactions. Select an operation from the left panel.</p>
                            <p><strong>Shift Status:</strong> <span style="color: green;">Active</span> | <strong>Till Balance:</strong> $<span id="tillBalance">5,000.00</span></p>
                        </div>
                    </div>
                    
                    <!-- Quick Transaction Panel -->
                    <div class="config-section">
                        <div class="config-header">Quick Transaction Access</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Operation</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                <tr>
                                    <td>💵 Cash Deposit</td>
                                    <td>Process customer cash deposits</td>
                                    <td style="color: green;">Available</td>
                                    <td><button class="java-btn" onclick="selectOperation(null, 'deposit')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>💸 Cash Withdrawal</td>
                                    <td>Process customer withdrawals</td>
                                    <td style="color: green;">Available</td>
                                    <td><button class="java-btn" onclick="selectOperation(null, 'withdrawal')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>📄 Check Cashing</td>
                                    <td>Cash customer checks</td>
                                    <td style="color: green;">Available</td>
                                    <td><button class="java-btn" onclick="selectOperation(null, 'check')">Start</button></td>
                                </tr>
                                <tr>
                                    <td>🔍 Account Lookup</td>
                                    <td>Search customer accounts</td>
                                    <td style="color: green;">Available</td>
                                    <td><button class="java-btn" onclick="selectOperation(null, 'lookup')">Start</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                    <!-- Recent Transactions -->
                    <div class="config-section">
                        <div class="config-header">Recent Transactions</div>
                        <div class="config-content">
                            <table class="java-table">
                                <tr>
                                    <th>Time</th>
                                    <th>Type</th>
                                    <th>Account</th>
                                    <th>Amount</th>
                                    <th>Status</th>
                                </tr>
                                <tr>
                                    <td id="trans1Time">--:--</td>
                                    <td>DEPOSIT</td>
                                    <td>****1234</td>
                                    <td>$250.00</td>
                                    <td style="color: green;">Complete</td>
                                </tr>
                                <tr>
                                    <td id="trans2Time">--:--</td>
                                    <td>WITHDRAWAL</td>
                                    <td>****5678</td>
                                    <td>$100.00</td>
                                    <td style="color: green;">Complete</td>
                                </tr>
                                <tr>
                                    <td id="trans3Time">--:--</td>
                                    <td>CHECK_CASH</td>
                                    <td>****9012</td>
                                    <td>$75.50</td>
                                    <td style="color: green;">Complete</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Teller Station Ready | Till: $<span id="statusTillBalance">5,000.00</span></span>
            <span>Teller: <span id="tellerName">teller@xypay.com</span> | Shift: <span id="shiftTime">08:00-16:00</span></span>
        </div>
    </div>
    
    <script>
        function selectOperation(element, operationType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Load operation content
            const content = document.getElementById('operation-content');
            
            switch(operationType) {
                case 'deposit':
                    content.innerHTML = getDepositContent();
                    break;
                case 'withdrawal':
                    content.innerHTML = getWithdrawalContent();
                    break;
                case 'check':
                    content.innerHTML = getCheckCashingContent();
                    break;
                case 'lookup':
                    content.innerHTML = getAccountLookupContent();
                    break;
                case 'balance':
                    content.innerHTML = getBalanceInquiryContent();
                    break;
                case 'history':
                    content.innerHTML = getTransactionHistoryContent();
                    break;
                default:
                    // Keep dashboard content
                    break;
            }
        }
        
        function getDepositContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Cash Deposit Transaction</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Account Number:</span>
                            <input type="text" class="form-input" placeholder="Enter account number">
                            <button class="java-btn">Verify</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Customer Name:</span>
                            <input type="text" class="form-input" placeholder="Auto-filled after verification">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Deposit Amount:</span>
                            <input type="number" class="form-input" placeholder="0.00" step="0.01">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Notes:</span>
                            <input type="text" class="form-input" placeholder="Optional transaction notes">
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Process Deposit</button>
                            <button class="java-btn">Clear Form</button>
                            <button class="java-btn">Cancel</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getWithdrawalContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Cash Withdrawal Transaction</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Account Number:</span>
                            <input type="text" class="form-input" placeholder="Enter account number">
                            <button class="java-btn">Verify</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Available Balance:</span>
                            <span style="color: green; font-weight: bold;">$1,250.00</span>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Withdrawal Amount:</span>
                            <input type="number" class="form-input" placeholder="0.00" step="0.01">
                        </div>
                        <div class="form-row">
                            <span class="form-label">PIN Verification:</span>
                            <input type="password" class="form-input" placeholder="Customer PIN">
                            <button class="java-btn">Verify PIN</button>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Process Withdrawal</button>
                            <button class="java-btn">Clear Form</button>
                            <button class="java-btn">Cancel</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getCheckCashingContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Check Cashing Service</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Check Number:</span>
                            <input type="text" class="form-input" placeholder="Enter check number">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Check Amount:</span>
                            <input type="number" class="form-input" placeholder="0.00" step="0.01">
                        </div>
                        <div class="form-row">
                            <span class="form-label">Payee Account:</span>
                            <input type="text" class="form-input" placeholder="Account to credit">
                            <button class="java-btn">Verify</button>
                        </div>
                        <div class="form-row">
                            <span class="form-label">ID Verification:</span>
                            <select class="form-select">
                                <option>Driver's License</option>
                                <option>Passport</option>
                                <option>National ID</option>
                            </select>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn primary">Cash Check</button>
                            <button class="java-btn">Hold Check</button>
                            <button class="java-btn">Cancel</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getAccountLookupContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Account Lookup & Search</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Search By:</span>
                            <select class="form-select">
                                <option>Account Number</option>
                                <option>Phone Number</option>
                                <option>Customer Name</option>
                                <option>Email Address</option>
                            </select>
                        </div>
                        <div class="form-row">
                            <span class="form-label">Search Value:</span>
                            <input type="text" class="form-input" placeholder="Enter search criteria">
                            <button class="java-btn primary">Search</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Account</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Balance</th>
                                <th>Status</th>
                            </tr>
                            <tr>
                                <td>****1234</td>
                                <td>John Doe</td>
                                <td>+234-xxx-xxxx</td>
                                <td>$1,250.00</td>
                                <td style="color: green;">Active</td>
                            </tr>
                        </table>
                    </div>
                </div>
            `;
        }
        
        function getBalanceInquiryContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Balance Inquiry</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Account Number:</span>
                            <input type="text" class="form-input" placeholder="Enter account number">
                            <button class="java-btn">Check Balance</button>
                        </div>
                        <div style="margin-top: 16px; padding: 12px; background: #f8f8f8; border: 1px inset #c0c0c0;">
                            <div class="form-row">
                                <span class="form-label">Available Balance:</span>
                                <span style="color: green; font-weight: bold; font-size: 14px;">$1,250.00</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Pending Transactions:</span>
                                <span>$0.00</span>
                            </div>
                            <div class="form-row">
                                <span class="form-label">Last Transaction:</span>
                                <span>Deposit $100.00 - Today 10:30 AM</span>
                            </div>
                        </div>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn">Print Balance</button>
                            <button class="java-btn">Clear</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        function getTransactionHistoryContent() {
            return `
                <div class="config-section">
                    <div class="config-header">Transaction History</div>
                    <div class="config-content">
                        <div class="form-row">
                            <span class="form-label">Account Number:</span>
                            <input type="text" class="form-input" placeholder="Enter account number">
                            <button class="java-btn">Load History</button>
                        </div>
                        <table class="java-table" style="margin-top: 16px;">
                            <tr>
                                <th>Date</th>
                                <th>Type</th>
                                <th>Amount</th>
                                <th>Balance</th>
                                <th>Reference</th>
                            </tr>
                            <tr>
                                <td>2024-01-15</td>
                                <td>DEPOSIT</td>
                                <td style="color: green;">+$100.00</td>
                                <td>$1,250.00</td>
                                <td>TXN001234</td>
                            </tr>
                            <tr>
                                <td>2024-01-14</td>
                                <td>WITHDRAWAL</td>
                                <td style="color: red;">-$50.00</td>
                                <td>$1,150.00</td>
                                <td>TXN001233</td>
                            </tr>
                            <tr>
                                <td>2024-01-13</td>
                                <td>TRANSFER</td>
                                <td style="color: red;">-$200.00</td>
                                <td>$1,200.00</td>
                                <td>TXN001232</td>
                            </tr>
                        </table>
                        <div style="margin-top: 16px; text-align: center;">
                            <button class="java-btn">Export PDF</button>
                            <button class="java-btn">Print Report</button>
                        </div>
                    </div>
                </div>
            `;
        }
        
        // Initialize dashboard
        window.onload = function() {
            // Set current time for recent transactions
            const now = new Date();
            document.getElementById('trans1Time').textContent = new Date(now.getTime() - 300000).toLocaleTimeString();
            document.getElementById('trans2Time').textContent = new Date(now.getTime() - 600000).toLocaleTimeString();
            document.getElementById('trans3Time').textContent = new Date(now.getTime() - 900000).toLocaleTimeString();
            
            // Set teller info
            document.getElementById('tellerName').textContent = 'teller@xypay.com';
            document.getElementById('shiftTime').textContent = '08:00-16:00';
        };
        
        // Add notification simulation
        setInterval(() => {
            const notifications = [
                'New customer deposit processed',
                'Till balance updated',
                'Transaction verification complete',
                'System backup completed'
            ];
            const randomNotification = notifications[Math.floor(Math.random() * notifications.length)];
            console.log('[' + new Date().toLocaleTimeString() + '] ' + randomNotification);
        }, 10000);
    </script>
</body>
</html>
