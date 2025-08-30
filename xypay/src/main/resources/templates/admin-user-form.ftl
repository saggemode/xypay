<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Form - XY Pay Banking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 600px;
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
        .form-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #2c3e50;
            font-weight: bold;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 2px solid #ecf0f1;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #667eea;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
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
        .btn-secondary {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        .form-actions {
            text-align: center;
            margin-top: 30px;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>${(user.id?? && user.id?has_content)?string('✏️ Edit User', '➕ Add New User')}</h1>
            <p>${(user.id?? && user.id?has_content)?string('Update user information', 'Create a new user account')}</p>
        </div>

        <div class="form-container">
            <#if user.id?? && user.id?has_content>
                <form method="post" action="/admin/users/${user.id}">
            <#else>
                <form method="post" action="/admin/users">
            </#if>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="username">Username *</label>
                        <input type="text" id="username" name="username" value="${user.username!''}" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" value="${user.email!''}" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="firstName">First Name *</label>
                        <input type="text" id="firstName" name="firstName" value="${user.firstName!''}" required>
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name *</label>
                        <input type="text" id="lastName" name="lastName" value="${user.lastName!''}" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password ${(user.id?? && user.id?has_content)?string('(leave blank to keep current)', '*')}</label>
                    <input type="password" id="password" name="password" ${(user.id?? && user.id?has_content)?string('', 'required')}>
                </div>

                <div class="form-group">
                    <button type="button" class="btn btn-secondary" onclick="generatePassword()">Generate Password</button>
                    <span id="generatedPassword" class="text-success ms-2"></span>
                </div>

                <div class="form-group">
                    <label for="roles">Roles *</label>
                    <select id="roles" name="roles" required>
                        <option value="">Select roles...</option>
                        <option value="ROLE_SUPERUSER" ${(user.roles?? && user.roles?contains('ROLE_SUPERUSER'))?string('selected', '')}>Superuser</option>
                        <option value="ROLE_ADMIN" ${(user.roles?? && user.roles?contains('ROLE_ADMIN'))?string('selected', '')}>Admin</option>
                        <option value="ROLE_TELLER" ${(user.roles?? && user.roles?contains('ROLE_TELLER'))?string('selected', '')}>Teller</option>
                        <option value="ROLE_CUSTOMER_SERVICE_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_CUSTOMER_SERVICE_OFFICER'))?string('selected', '')}>Customer Service Officer</option>
                        <option value="ROLE_LOAN_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_LOAN_OFFICER'))?string('selected', '')}>Loan Officer</option>
                        <option value="ROLE_RELATIONSHIP_MANAGER" ${(user.roles?? && user.roles?contains('ROLE_RELATIONSHIP_MANAGER'))?string('selected', '')}>Relationship Manager</option>
                        <option value="ROLE_OPERATIONS_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_OPERATIONS_OFFICER'))?string('selected', '')}>Operations Officer</option>
                        <option value="ROLE_COMPLIANCE_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_COMPLIANCE_OFFICER'))?string('selected', '')}>Compliance Officer</option>
                        <option value="ROLE_TREASURY_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_TREASURY_OFFICER'))?string('selected', '')}>Treasury Officer</option>
                        <option value="ROLE_IT_SUPPORT" ${(user.roles?? && user.roles?contains('ROLE_IT_SUPPORT'))?string('selected', '')}>IT Support</option>
                        <option value="ROLE_BRANCH_MANAGER" ${(user.roles?? && user.roles?contains('ROLE_BRANCH_MANAGER'))?string('selected', '')}>Branch Manager</option>
                        <option value="ROLE_OPERATIONS_MANAGER" ${(user.roles?? && user.roles?contains('ROLE_OPERATIONS_MANAGER'))?string('selected', '')}>Operations Manager</option>
                        <option value="ROLE_CHIEF_RISK_OFFICER" ${(user.roles?? && user.roles?contains('ROLE_CHIEF_RISK_OFFICER'))?string('selected', '')}>Chief Risk Officer</option>
                        <option value="ROLE_EXECUTIVE" ${(user.roles?? && user.roles?contains('ROLE_EXECUTIVE'))?string('selected', '')}>Executive</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">${(user.id?? && user.id?has_content)?string('Update User', 'Create User')}</button>
                    <a href="/admin/users" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>

        <div style="text-align: center;">
            <a href="/admin/users" class="back-btn">← Back to User Management</a>
        </div>
    </div>
    <script>
function generatePassword() {
    var charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+';
    var password = '';
    for (var i = 0; i < 12; i++) {
        var rand = Math.floor(Math.random() * charset.length);
        password += charset[rand];
    }
    document.getElementById('password').value = password;
    document.getElementById('generatedPassword').innerText = 'Copied!';
    navigator.clipboard.writeText(password);
}
</script>
</body>
</html>
