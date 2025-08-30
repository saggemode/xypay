<!DOCTYPE html>
<html>
<head>
    <title>Risk Assessment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Risk Assessment</h2>
    <div class="alert alert-warning">Risk assessment tools and results will be available here.</div>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
</div>
</body>
</html>
