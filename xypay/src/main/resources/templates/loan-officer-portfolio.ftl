<!DOCTYPE html>
<html>
<head>
    <title>Loan Portfolio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Loan Portfolio</h2>
    <div class="alert alert-success">Loan portfolio details will be displayed here.</div>
    <#if result??>
        <div class="alert alert-info mt-3">${result}</div>
    </#if>
    <#if loans?? && loans?size > 0>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <#list loans as loan>
                    <tr>
                        <td>${loan.customerName}</td>
                        <td>${loan.amount}</td>
                        <td>${loan.status}</td>
                        <td>
                            <#if loan.status == "PENDING">
                                <form action="/loan-officer/portfolio/${loan.id}/approve" method="post" style="display:inline;">
                                    <button class="btn btn-success btn-sm">Approve</button>
                                </form>
                                <form action="/loan-officer/portfolio/${loan.id}/reject" method="post" style="display:inline;">
                                    <button class="btn btn-danger btn-sm">Reject</button>
                                </form>
                            </#if>
                            <a href="/loan-officer/portfolio/${loan.id}/schedule" class="btn btn-info btn-sm">Repayment Schedule</a>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </#if>
</div>
</body>
</html>
