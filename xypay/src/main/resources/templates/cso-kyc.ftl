<!DOCTYPE html>
<html>
<head>
    <title>KYC Verification</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>KYC Verification</h2>
    <form action="/cso/kyc" method="post">
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="kycDocument" class="form-label">KYC Document</label>
            <input type="file" class="form-control" id="kycDocument" name="kycDocument" required>
        </div>
        <button type="submit" class="btn btn-primary">Verify KYC</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
