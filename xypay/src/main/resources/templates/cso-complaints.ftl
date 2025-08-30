<!DOCTYPE html>
<html>
<head>
    <title>Customer Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Customer Complaints</h2>
    <form action="/cso/complaints" method="post">
        <div class="mb-3">
            <label for="customerName" class="form-label">Customer Name</label>
            <input type="text" class="form-control" id="customerName" name="customerName" required>
        </div>
        <div class="mb-3">
            <label for="complaint" class="form-label">Complaint</label>
            <textarea class="form-control" id="complaint" name="complaint" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit Complaint</button>
    </form>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
