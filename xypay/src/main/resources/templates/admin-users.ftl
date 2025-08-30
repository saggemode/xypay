<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - XY Pay Banking System</title>
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
        .actions {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 25px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            margin: 0 10px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-success {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }
        .btn-warning {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            color: white;
        }
        .btn-danger {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .users-table {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        .users-table table {
            width: 100%;
            border-collapse: collapse;
        }
        .users-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: bold;
        }
        .users-table td {
            padding: 15px;
            border-bottom: 1px solid #ecf0f1;
            color: #34495e;
        }
        .users-table tr:hover {
            background: rgba(102, 126, 234, 0.1);
        }
        .users-table tr:last-child td {
            border-bottom: none;
        }
        .role-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: bold;
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
        .empty-state {
            text-align: center;
            padding: 50px;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>👥 User Management</h1>
            <p>Manage system users, roles, and permissions</p>
        </div>

        <div class="actions">
            <a href="/admin/users/new" class="btn btn-success">➕ Add New User</a>
            <a href="/admin/roles" class="btn btn-warning">🔐 Role Management</a>
        </div>

        <div class="row mb-3">
            <div class="col-md-4">
                <input type="text" class="form-control" id="userSearch" placeholder="Search by username or email..." onkeyup="filterUsers()">
            </div>
            <div class="col-md-3">
                <select class="form-select" id="roleFilter" onchange="filterUsers()">
                    <option value="">All Roles</option>
                    <option value="ROLE_SUPERUSER">Superuser</option>
                    <option value="ROLE_ADMIN">Admin</option>
                    <option value="ROLE_TELLER">Teller</option>
                    <option value="ROLE_CUSTOMER_SERVICE_OFFICER">CSO</option>
                    <option value="ROLE_LOAN_OFFICER">Loan Officer</option>
                    <option value="ROLE_RELATIONSHIP_MANAGER">Relationship Manager</option>
                    <option value="ROLE_OPERATIONS_OFFICER">Operations Officer</option>
                    <option value="ROLE_COMPLIANCE_OFFICER">Compliance Officer</option>
                    <option value="ROLE_TREASURY_OFFICER">Treasury Officer</option>
                    <option value="ROLE_IT_SUPPORT">IT Support</option>
                    <option value="ROLE_BRANCH_MANAGER">Branch Manager</option>
                    <option value="ROLE_OPERATIONS_MANAGER">Operations Manager</option>
                    <option value="ROLE_CHIEF_RISK_OFFICER">Chief Risk Officer</option>
                    <option value="ROLE_EXECUTIVE">Executive</option>
                </select>
            </div>
            <div class="col-md-3">
                <button class="btn btn-outline-primary" onclick="exportUsersCSV()">Export CSV</button>
            </div>
        </div>
        <script>
function filterUsers() {
    var search = document.getElementById('userSearch').value.toLowerCase();
    var role = document.getElementById('roleFilter').value;
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        var username = row.querySelector('td:nth-child(2)').innerText.toLowerCase();
        var email = row.querySelector('td:nth-child(4)').innerText.toLowerCase();
        var userRoles = row.querySelector('td:nth-child(5)').innerText;
        var show = (username.includes(search) || email.includes(search)) && (role === '' || userRoles.includes(role));
        row.style.display = show ? '' : 'none';
    });
}
function exportUsersCSV() {
    var csv = 'ID,Username,First Name,Last Name,Email,Roles\n';
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        if (row.style.display !== 'none') {
            var cols = row.querySelectorAll('td');
            var line = Array.from(cols).map(td => '"' + td.innerText.replace(/"/g, '""') + '"').join(',');
            csv += line + '\n';
        }
    });
    var blob = new Blob([csv], {type: 'text/csv'});
    var link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'users.csv';
    link.click();
}
</script>

        <div class="users-table">
            <#if users?? && users?size gt 0>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Name</th>
                            <th>Roles</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <#list users as user>
                            <tr>
                                <td>${user.id!''}</td>
                                <td>${user.username!''}</td>
                                <td>${user.email!''}</td>
                                <td>${user.firstName!''} ${user.lastName!''}</td>
                                <td>
                                    <#if user.roles??>
                                        <#list user.roles?split(",") as role>
                                            <span class="role-badge">${role}</span>
                                        </#list>
                                    </#if>
                                </td>
                                <td>
                                    <a href="/admin/users/${user.id}/edit" class="btn btn-primary">✏️ Edit</a>
                                    <form method="post" action="/admin/users/${user.id}/delete" style="display: inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">🗑️ Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </#list>
                    </tbody>
                </table>
            <#else>
                <div class="empty-state">
                    <h3>No users found</h3>
                    <p>Start by adding your first user to the system.</p>
                    <a href="/admin/users/new" class="btn btn-success">Add First User</a>
                </div>
            </#if>
        </div>

        <div style="text-align: center;">
            <a href="/superuser/dashboard" class="back-btn">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
