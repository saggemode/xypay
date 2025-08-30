<!DOCTYPE html>
<html>
<head>
    <title>Error - XY Pay</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="alert alert-danger">
        <h4 class="alert-heading">An error occurred!</h4>
        <p>Status: ${status!}</p>
        <p>Message: ${message!}</p>
        <#if exception??>
            <p>Exception: ${exception!}</p>
        </#if>
        <hr>
        <a href="/" class="btn btn-primary">Go Home</a>
    </div>
</div>
</body>
</html>
