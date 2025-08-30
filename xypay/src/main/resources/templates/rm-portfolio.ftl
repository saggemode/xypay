<!DOCTYPE html>
<html>
<head>
    <title>Client Portfolio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Client Portfolio</h2>
    <div class="alert alert-warning">Client portfolio details will be displayed here.</div>
    <#if customers?? && customers?size > 0>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Legal ID</th>
                    <th>KYC Status</th>
                </tr>
            </thead>
            <tbody>
                <#list customers as customer>
                    <tr>
                        <td>${customer.name}</td>
                        <td>${customer.legalId!}</td>
                        <td>${customer.kycStatus!}</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </#if>
</div>
</body>
</html>
