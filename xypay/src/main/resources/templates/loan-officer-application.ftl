<!DOCTYPE html>
<html>
<head>
    <title>Loan Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Loan Application</h2>
    <form action="/loan-officer/application" method="post">
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="amount" class="form-label">Loan Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" required>
        </div>
        <button type="submit" class="btn btn-primary">Submit Application</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
