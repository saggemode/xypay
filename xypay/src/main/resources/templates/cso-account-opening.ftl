<!DOCTYPE html>
<html>
<head>
    <title>Account Opening</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Account Opening</h2>
    <form action="/cso/account-opening" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="accountType" class="form-label">Account Type</label>
            <select class="form-control" id="accountType" name="accountType" required>
                <option value="savings">Savings</option>
                <option value="current">Current</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="currency" class="form-label">Currency</label>
            <select class="form-control" id="currency" name="currency" required>
                <option value="NGN">Nigerian Naira (NGN)</option>
                <option value="USD">US Dollar (USD)</option>
                <option value="EUR">Euro (EUR)</option>
                <option value="GBP">British Pound (GBP)</option>
                <option value="KES">Kenyan Shilling (KES)</option>
                <option value="GHS">Ghanaian Cedi (GHS)</option>
                <option value="ZAR">South African Rand (ZAR)</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="legalId" class="form-label">Legal ID (e.g., BVN, NIN, Passport)</label>
            <input type="text" class="form-control" id="legalId" name="legalId" required>
        </div>
        <div class="mb-3">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" required>
        </div>
        <div class="mb-3">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" required>
        </div>
        <div class="mb-3">
            <label for="kycStatus" class="form-label">KYC Status</label>
            <select class="form-control" id="kycStatus" name="kycStatus" required>
                <option value="BASIC">Basic</option>
                <option value="STANDARD">Standard</option>
                <option value="ENHANCED">Enhanced</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Open Account</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
