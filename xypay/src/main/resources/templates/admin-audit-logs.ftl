<!DOCTYPE html>
<html>
<head>
    <title>Audit Logs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Audit Logs</h2>
    <div class="row mb-3">
        <div class="col-md-4">
            <input type="text" class="form-control" id="auditLogSearch" placeholder="Search audit logs..." onkeyup="filterAuditLogs()">
        </div>
        <div class="col-md-3">
            <button class="btn btn-outline-primary" onclick="exportAuditLogsCSV()">Export Audit Logs CSV</button>
        </div>
    </div>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>User</th>
                <th>Action</th>
                <th>Details</th>
                <th>Timestamp</th>
            </tr>
        </thead>
        <tbody>
            <#list logs as log>
                <tr>
                    <td>${log.user}</td>
                    <td>${log.action}</td>
                    <td>${log.details}</td>
                    <td>${log.timestamp}</td>
                </tr>
            </#list>
        </tbody>
    </table>
</div>
<script>
function filterAuditLogs() {
    var search = document.getElementById('auditLogSearch').value.toLowerCase();
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        var text = row.innerText.toLowerCase();
        row.style.display = text.includes(search) ? '' : 'none';
    });
}
function exportAuditLogsCSV() {
    var csv = 'Time,User,Action,Entity,Details\n';
    var rows = document.querySelectorAll('table tbody tr');
    rows.forEach(function(row) {
        if (row.style.display !== 'none') {
            var cols = row.querySelectorAll('td');
            var line = Array.from(cols).map(td => '"' + td.innerText.replace(/"/g, '""') + '"').join(',');
            csv += line + '\n';
        }
    });
    var blob = new Blob([csv], {type: 'text/csv'});
    var link = document.createElement('a');
    link.href = URL.createObjectURL(blob);
    link.download = 'audit-logs.csv';
    link.click();
}
</script>
</body>
</html>
