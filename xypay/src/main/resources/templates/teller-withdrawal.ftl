<!DOCTYPE html>
<html>
<head>
    <title>Withdrawal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Withdrawal Form</h2>
    <form action="/teller/withdrawal" method="post">
        <div class="mb-3">
            <label for="accountNumber" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
        </div>
        <div class="mb-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit Withdrawal</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
