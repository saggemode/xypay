<!DOCTYPE html>
<html>
<head>
    <title>Credit Check</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Credit Check</h2>
    <form action="/loan-officer/credit-score" method="get">
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <button type="submit" class="btn btn-primary">Check Credit Score</button>
    </form>
    <#if score??>
        <div class="alert alert-info mt-3">
            Credit score for ${customerName}: <strong>${score}</strong>
        </div>
    </#if>
</div>
</body>
</html>
