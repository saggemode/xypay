<!DOCTYPE html>
<html>
<head>
    <title>Account Lookup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Account Lookup</h2>
    <form action="/teller/account-lookup" method="get">
        <div class="mb-3">
            <label for="accountNumber" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
        </div>
        <button type="submit" class="btn btn-primary">Lookup</button>
    </form>
    <#if account??>
        <div class="alert alert-success mt-3">
            <strong>Account Found:</strong><br>
            Account Number: ${account.accountNumber}<br>
            Account Type: ${account.accountType}<br>
            Status: ${account.status}
        </div>
    </#if>
    <#if balance??>
        <div class="alert alert-info mt-3">
            <strong>Current Balance:</strong> ${balance}
        </div>
    </#if>
    <#if transactions?? && transactions?size > 0>
        <h5 class="mt-4">Transaction History</h5>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <#list transactions as tx>
                    <tr>
                        <td>${tx.type}</td>
                        <td>${tx.amount}</td>
                        <td>${tx.status}</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </#if>
    <#if error??>
        <div class="alert alert-danger mt-3">${error}</div>
    </#if>
</div>
</body>
</html>
