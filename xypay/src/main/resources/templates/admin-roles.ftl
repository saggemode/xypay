<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Management - XY Pay Banking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            backdrop-filter: blur(10px);
        }
        .header h1 {
            color: #2c3e50;
            margin: 0;
            font-size: 2.5em;
            text-align: center;
        }
        .header p {
            color: #7f8c8d;
            text-align: center;
            margin: 10px 0 0 0;
            font-size: 1.1em;
        }
        .roles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        .role-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-left: 5px solid #667eea;
        }
        .role-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
        }
        .role-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .role-icon {
            font-size: 2em;
            margin-right: 15px;
            width: 50px;
            text-align: center;
        }
        .role-title {
            flex: 1;
        }
        .role-name {
            color: #2c3e50;
            margin: 0;
            font-size: 1.3em;
            font-weight: bold;
        }
        .role-code {
            color: #7f8c8d;
            margin: 5px 0 0 0;
            font-size: 0.9em;
            font-family: monospace;
        }
        .role-description {
            color: #34495e;
            margin: 15px 0;
            line-height: 1.6;
        }
        .role-category {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: bold;
        }
        .stats-section {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            margin-bottom: 30px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }
        .stat-item {
            text-align: center;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 15px;
        }
        .stat-number {
            font-size: 2.5em;
            font-weight: bold;
            margin: 0;
        }
        .stat-label {
            margin: 5px 0 0 0;
            font-size: 0.9em;
            opacity: 0.9;
        }
        .back-btn {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }
        .back-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .category-section {
            margin-bottom: 40px;
        }
        .category-title {
            color: #2c3e50;
            font-size: 1.8em;
            margin: 0 0 20px 0;
            padding-bottom: 10px;
            border-bottom: 2px solid #667eea;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔐 Role Management</h1>
            <p>System roles, permissions, and access control</p>
        </div>

        <div class="stats-section">
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number">14</div>
                    <div class="stat-label">Total Roles</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">5</div>
                    <div class="stat-label">Categories</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">Active</div>
                    <div class="stat-label">System Status</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Coverage</div>
                </div>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col-md-6">
                <input type="text" class="form-control" id="roleSearch" placeholder="Search roles..." onkeyup="filterRoles()">
            </div>
            <div class="col-md-3">
                <button class="btn btn-outline-primary" onclick="exportRolesCSV()">Export CSV</button>
            </div>
        </div>
        <script>
        function filterRoles() {
            var search = document.getElementById('roleSearch').value.toLowerCase();
            var cards = document.querySelectorAll('.role-card');
            cards.forEach(function(card) {
                var title = card.querySelector('.role-title').innerText.toLowerCase();
                card.style.display = title.includes(search) ? '' : 'none';
            });
        }
        function exportRolesCSV() {
            var csv = 'Role Code,Role Name,Description,Category\n';
            var cards = document.querySelectorAll('.role-card');
            cards.forEach(function(card) {
                if (card.style.display !== 'none') {
                    var code = card.querySelector('.role-code').innerText;
                    var name = card.querySelector('.role-title').innerText;
                    var desc = card.querySelector('.role-description').innerText;
                    var cat = card.closest('.category-section').querySelector('.category-title').innerText;
                    csv += '"' + code + '","' + name + '","' + desc + '","' + cat + '"\n';
                }
            });
            var blob = new Blob([csv], {type: 'text/csv'});
            var link = document.createElement('a');
            link.href = URL.createObjectURL(blob);
            link.download = 'roles.csv';
            link.click();
        }
        </script>

        <#assign categories = {
            "System Administration": "🚀",
            "Administration": "⚙️",
            "Frontline Banking": "🏦",
            "Customer Service": "👥",
            "Lending": "💰",
            "Relationship Banking": "🤝",
            "Operations": "⚡",
            "Compliance": "🔒",
            "Treasury": "💎",
            "IT Support": "💻",
            "Branch Management": "🏢",
            "Operations Management": "📊",
            "Risk Management": "⚠️",
            "Executive": "👑"
        }>

        <#assign roleCategories = {}>
        <#list roles as role>
            <#if !roleCategories[role.category]??>
                <#assign roleCategories = roleCategories + {role.category: []}>
            </#if>
            <#assign roleCategories = roleCategories + {role.category: roleCategories[role.category] + [role]}>
        </#list>

        <#list roleCategories?keys as category>
            <div class="category-section">
                <h2 class="category-title">${categories[category]!""} ${category}</h2>
                <div class="roles-grid">
                    <#list roleCategories[category] as role>
                        <div class="role-card">
                            <div class="role-header">
                                <div class="role-icon">
                                    <#switch role.code>
                                        <#case "ROLE_SUPERUSER">🚀<#break>
                                        <#case "ROLE_ADMIN">⚙️<#break>
                                        <#case "ROLE_TELLER">🏦<#break>
                                        <#case "ROLE_CUSTOMER_SERVICE_OFFICER">👥<#break>
                                        <#case "ROLE_LOAN_OFFICER">💰<#break>
                                        <#case "ROLE_RELATIONSHIP_MANAGER">🤝<#break>
                                        <#case "ROLE_OPERATIONS_OFFICER">⚡<#break>
                                        <#case "ROLE_COMPLIANCE_OFFICER">🔒<#break>
                                        <#case "ROLE_TREASURY_OFFICER">💎<#break>
                                        <#case "ROLE_IT_SUPPORT">💻<#break>
                                        <#case "ROLE_BRANCH_MANAGER">🏢<#break>
                                        <#case "ROLE_OPERATIONS_MANAGER">📊<#break>
                                        <#case "ROLE_CHIEF_RISK_OFFICER">⚠️<#break>
                                        <#case "ROLE_EXECUTIVE">👑<#break>
                                        <#default>🔧
                                    </#switch>
                                </div>
                                <div class="role-title">
                                    <h3 class="role-name">${role.name}</h3>
                                    <p class="role-code">${role.code}</p>
                                </div>
                            </div>
                            <p class="role-description">${role.description}</p>
                            <span class="role-category">${role.category}</span>
                        </div>
                    </#list>
                </div>
            </div>
        </#list>

        <div style="text-align: center;">
            <a href="/admin/users" class="back-btn">← Back to User Management</a>
        </div>
    </div>
</body>
</html>
