<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notification Center Console - Java Style</title>
    <link rel="stylesheet" href="/css/java-swing-style.css">
</head>
<body>
    <div class="java-window">
        <!-- Title Bar -->
        <div class="title-bar">
            <span>XyPay Notification Center - Message Management</span>
            <div class="window-controls">
                <div class="window-btn">_</div>
                <div class="window-btn">□</div>
                <div class="window-btn">×</div>
            </div>
        </div>
        
        <!-- Menu Bar -->
        <div class="menu-bar">
            <span class="menu-item">File</span>
            <span class="menu-item">View</span>
            <span class="menu-item">Filter</span>
            <span class="menu-item">Actions</span>
            <span class="menu-item">Help</span>
        </div>
        
        <!-- Toolbar -->
        <div class="toolbar">
            <button class="toolbar-btn">Refresh</button>
            <button class="toolbar-btn">Mark All Read</button>
            <button class="toolbar-btn">Clear Read</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Filter Unread</button>
            <button class="toolbar-btn">Export</button>
            <div class="toolbar-separator"></div>
            <button class="toolbar-btn">Settings</button>
        </div>
        
        <!-- Main Content Area -->
        <div class="content-area">
            <!-- Left Navigation Panel -->
            <div class="tree-panel">
                <div class="tree-header">Notification Types</div>
                
                <div class="tree-node selected" onclick="filterNotifications(this, 'all')">
                    <div class="tree-icon">📧</div>
                    All Notifications
                </div>
                
                <div class="tree-node" onclick="filterNotifications(this, 'unread')">
                    <div class="tree-icon">🔴</div>
                    Unread Messages
                </div>
                
                <div class="tree-node" onclick="filterNotifications(this, 'system')">
                    <div class="tree-icon">⚙️</div>
                    System Alerts
                </div>
                
                <div class="tree-node" onclick="filterNotifications(this, 'transaction')">
                    <div class="tree-icon">💰</div>
                    Transaction Alerts
                </div>
                
                <div class="tree-node" onclick="filterNotifications(this, 'security')">
                    <div class="tree-icon">🔒</div>
                    Security Notices
                </div>
                
                <div class="tree-node" onclick="filterNotifications(this, 'user')">
                    <div class="tree-icon">👤</div>
                    User Activities
                </div>
            </div>
            
            <!-- Right Details Panel -->
            <div class="details-panel">
                <div class="details-header">Notification Management Center</div>
                <div class="details-content">
                    
                    <div class="config-section">
                        <div class="config-header">System Notifications</div>
                        <div class="config-content">
                            
                            <!-- Notification Statistics -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-bottom: 16px; background: #f8f8f8;">
                                <legend style="font-weight: bold; font-size: 12px;">📊 Notification Summary</legend>
                                
                                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 12px;">
                                    <div style="text-align: center;">
                                        <div style="font-weight: bold; font-size: 14px; color: #333;" id="totalCount">0</div>
                                        <div style="font-size: 10px; color: #666;">Total</div>
                                    </div>
                                    <div style="text-align: center;">
                                        <div style="font-weight: bold; font-size: 14px; color: #d32f2f;" id="unreadCount">0</div>
                                        <div style="font-size: 10px; color: #666;">Unread</div>
                                    </div>
                                    <div style="text-align: center;">
                                        <div style="font-weight: bold; font-size: 14px; color: #388e3c;" id="readCount">0</div>
                                        <div style="font-size: 10px; color: #666;">Read</div>
                                    </div>
                                    <div style="text-align: center;">
                                        <div style="font-weight: bold; font-size: 14px; color: #f57c00;" id="priorityCount">0</div>
                                        <div style="font-size: 10px; color: #666;">Priority</div>
                                    </div>
                                </div>
                            </fieldset>
                            
                            <!-- Notifications Table -->
                            <div style="border: 1px inset #c0c0c0; background: white;">
                                <table style="width: 100%; border-collapse: collapse; font-size: 11px;">
                                    <thead style="background: #e0e0e0; border-bottom: 1px solid #999;">
                                        <tr>
                                            <th style="padding: 6px; text-align: left; border-right: 1px solid #999; font-weight: bold;">Status</th>
                                            <th style="padding: 6px; text-align: left; border-right: 1px solid #999; font-weight: bold;">Message</th>
                                            <th style="padding: 6px; text-align: left; border-right: 1px solid #999; font-weight: bold;">Timestamp</th>
                                            <th style="padding: 6px; text-align: left; border-right: 1px solid #999; font-weight: bold;">Type</th>
                                            <th style="padding: 6px; text-align: center; font-weight: bold;">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="notificationTableBody">
                                        <#list notifications as n>
                                            <tr style="border-bottom: 1px solid #ddd; <#if !n.read>background: #fff3cd;</#if>" data-notification-id="${n.id}" data-read="${n.read?c}">
                                                <td style="padding: 6px; border-right: 1px solid #ddd; text-align: center;">
                                                    <#if n.read>
                                                        <span style="color: #28a745;">✓ Read</span>
                                                    <#else>
                                                        <span style="color: #dc3545; font-weight: bold;">● Unread</span>
                                                    </#if>
                                                </td>
                                                <td style="padding: 6px; border-right: 1px solid #ddd;">
                                                    <div style="<#if !n.read>font-weight: bold;</#if>">${n.message}</div>
                                                </td>
                                                <td style="padding: 6px; border-right: 1px solid #ddd; font-size: 10px; color: #666;">
                                                    ${n.timestamp}
                                                </td>
                                                <td style="padding: 6px; border-right: 1px solid #ddd; font-size: 10px;">
                                                    <span style="background: #e3f2fd; padding: 2px 6px; border-radius: 3px;">System</span>
                                                </td>
                                                <td style="padding: 6px; text-align: center;">
                                                    <#if !n.read>
                                                        <form action="/notifications/read" method="post" style="display: inline; margin: 0;">
                                                            <input type="hidden" name="id" value="${n.id}"/>
                                                            <button type="submit" class="java-btn" style="font-size: 9px; padding: 2px 6px;" onclick="markAsRead(${n.id})">Mark Read</button>
                                                        </form>
                                                    <#else>
                                                        <span style="color: #999; font-size: 9px;">Read</span>
                                                    </#if>
                                                    <button type="button" class="java-btn" style="font-size: 9px; padding: 2px 6px; margin-left: 4px;" onclick="viewDetails(${n.id})">Details</button>
                                                </td>
                                            </tr>
                                        <#else>
                                            <tr>
                                                <td colspan="5" style="padding: 20px; text-align: center; color: #666; font-style: italic;">
                                                    No notifications found. The system will display new notifications here as they arrive.
                                                </td>
                                            </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            </div>
                            
                            <!-- Action Buttons -->
                            <div style="text-align: center; margin-top: 16px;">
                                <button type="button" class="java-btn" onclick="refreshNotifications()">🔄 Refresh</button>
                                <button type="button" class="java-btn" onclick="markAllRead()">✓ Mark All Read</button>
                                <button type="button" class="java-btn" onclick="clearReadNotifications()">🗑️ Clear Read</button>
                                <button type="button" class="java-btn" onclick="exportNotifications()">📤 Export</button>
                            </div>
                            
                            <!-- Notification Settings -->
                            <fieldset style="border: 1px inset #c0c0c0; padding: 12px; margin-top: 16px;">
                                <legend style="font-weight: bold; font-size: 12px;">⚙️ Notification Settings</legend>
                                
                                <div style="font-size: 11px;">
                                    <div style="margin-bottom: 8px;">
                                        <input type="checkbox" id="autoRefresh" checked>
                                        <label for="autoRefresh" style="margin-left: 6px;">Auto-refresh notifications every 30 seconds</label>
                                    </div>
                                    
                                    <div style="margin-bottom: 8px;">
                                        <input type="checkbox" id="soundAlerts" checked>
                                        <label for="soundAlerts" style="margin-left: 6px;">Play sound for new notifications</label>
                                    </div>
                                    
                                    <div style="margin-bottom: 8px;">
                                        <input type="checkbox" id="emailNotifications">
                                        <label for="emailNotifications" style="margin-left: 6px;">Send email notifications for critical alerts</label>
                                    </div>
                                    
                                    <div style="margin-bottom: 8px;">
                                        <label for="retentionDays" style="margin-right: 8px;">Keep notifications for:</label>
                                        <select id="retentionDays" class="form-select" style="width: 100px; display: inline-block;">
                                            <option value="7">7 days</option>
                                            <option value="30" selected>30 days</option>
                                            <option value="90">90 days</option>
                                            <option value="365">1 year</option>
                                        </select>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
        <!-- Status Bar -->
        <div class="status-bar">
            <span>Notification Center Ready | Filter: <span id="currentFilter">All Notifications</span> | Last Updated: <span id="lastUpdated">Now</span></span>
            <span>Status: <span id="connectionStatus">Connected</span></span>
        </div>
    </div>
    
    <script>
        let autoRefreshInterval;
        
        function filterNotifications(element, filterType) {
            // Update tree selection
            if (element) {
                document.querySelectorAll('.tree-node').forEach(node => {
                    node.classList.remove('selected');
                });
                element.classList.add('selected');
            }
            
            // Update filter display
            document.getElementById('currentFilter').textContent = filterType.charAt(0).toUpperCase() + filterType.slice(1) + ' Notifications';
            
            // Filter table rows
            const rows = document.querySelectorAll('#notificationTableBody tr[data-notification-id]');
            rows.forEach(row => {
                const isRead = row.getAttribute('data-read') === 'true';
                let showRow = true;
                
                switch(filterType) {
                    case 'unread':
                        showRow = !isRead;
                        break;
                    case 'read':
                        showRow = isRead;
                        break;
                    case 'all':
                    default:
                        showRow = true;
                        break;
                }
                
                row.style.display = showRow ? '' : 'none';
            });
            
            updateNotificationCounts();
        }
        
        function markAsRead(notificationId) {
            // This would normally be handled by the form submission
            // But we can update the UI immediately for better UX
            const row = document.querySelector(`tr[data-notification-id="${notificationId}"]`);
            if (row) {
                row.setAttribute('data-read', 'true');
                row.style.background = '';
                
                // Update status cell
                const statusCell = row.querySelector('td:first-child');
                statusCell.innerHTML = '<span style="color: #28a745;">✓ Read</span>';
                
                // Update actions cell
                const actionsCell = row.querySelector('td:last-child');
                actionsCell.innerHTML = '<span style="color: #999; font-size: 9px;">Read</span><button type="button" class="java-btn" style="font-size: 9px; padding: 2px 6px; margin-left: 4px;" onclick="viewDetails(' + notificationId + ')">Details</button>';
                
                updateNotificationCounts();
            }
        }
        
        function viewDetails(notificationId) {
            alert('Notification Details\n\nID: ' + notificationId + '\nThis would show detailed information about the notification in a real implementation.');
        }
        
        function refreshNotifications() {
            document.getElementById('connectionStatus').textContent = 'Refreshing...';
            
            setTimeout(() => {
                document.getElementById('lastUpdated').textContent = new Date().toLocaleTimeString();
                document.getElementById('connectionStatus').textContent = 'Connected';
                alert('✅ Notifications refreshed successfully!');
            }, 1000);
        }
        
        function markAllRead() {
            if (confirm('Mark all notifications as read?')) {
                const unreadRows = document.querySelectorAll('#notificationTableBody tr[data-read="false"]');
                unreadRows.forEach(row => {
                    const notificationId = row.getAttribute('data-notification-id');
                    if (notificationId) {
                        markAsRead(notificationId);
                    }
                });
                alert('✅ All notifications marked as read!');
            }
        }
        
        function clearReadNotifications() {
            if (confirm('Remove all read notifications? This action cannot be undone.')) {
                const readRows = document.querySelectorAll('#notificationTableBody tr[data-read="true"]');
                readRows.forEach(row => {
                    row.remove();
                });
                updateNotificationCounts();
                alert('✅ Read notifications cleared!');
            }
        }
        
        function exportNotifications() {
            alert('📤 Export Notifications\n\nThis would export the current notification list to CSV, PDF, or Excel format in a real implementation.');
        }
        
        function updateNotificationCounts() {
            const allRows = document.querySelectorAll('#notificationTableBody tr[data-notification-id]');
            const visibleRows = Array.from(allRows).filter(row => row.style.display !== 'none');
            const unreadRows = visibleRows.filter(row => row.getAttribute('data-read') === 'false');
            const readRows = visibleRows.filter(row => row.getAttribute('data-read') === 'true');
            
            document.getElementById('totalCount').textContent = visibleRows.length;
            document.getElementById('unreadCount').textContent = unreadRows.length;
            document.getElementById('readCount').textContent = readRows.length;
            document.getElementById('priorityCount').textContent = Math.floor(visibleRows.length * 0.1); // Simulate priority count
        }
        
        function setupAutoRefresh() {
            const autoRefreshCheckbox = document.getElementById('autoRefresh');
            
            if (autoRefreshCheckbox.checked) {
                autoRefreshInterval = setInterval(() => {
                    document.getElementById('lastUpdated').textContent = new Date().toLocaleTimeString();
                }, 30000); // 30 seconds
            } else {
                if (autoRefreshInterval) {
                    clearInterval(autoRefreshInterval);
                }
            }
        }
        
        // Initialize
        window.onload = function() {
            updateNotificationCounts();
            document.getElementById('lastUpdated').textContent = new Date().toLocaleTimeString();
            document.getElementById('connectionStatus').textContent = 'Connected';
            
            // Setup auto-refresh
            document.getElementById('autoRefresh').addEventListener('change', setupAutoRefresh);
            setupAutoRefresh();
        };
    </script>
</body>
</html>
