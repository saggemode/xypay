<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics Data Export/Import</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>Analytics Data Export/Import</h1>
    <div class="mb-3">
        <button class="btn btn-primary me-2" onclick="downloadJson()">Download JSON</button>
        <button class="btn btn-secondary" onclick="downloadCsv()">Download CSV</button>
    </div>
    <form id="importForm" onsubmit="return uploadData()">
        <div class="mb-2">
            <select class="form-select" id="importType">
                <option value="json">JSON</option>
                <option value="csv">CSV</option>
            </select>
        </div>
        <div class="mb-2"><textarea class="form-control" id="importInput" rows="8" placeholder="Paste data here" required></textarea></div>
        <button class="btn btn-success">Import Data</button>
    </form>
    <div id="importResult" class="mt-2"></div>
</div>
<script>
function downloadJson() {
    fetch('/api/analytics/export').then(r=>r.json()).then(data => {
        const blob = new Blob([JSON.stringify(data, null, 2)], {type: 'application/json'});
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'analytics.json';
        a.click();
        URL.revokeObjectURL(url);
    });
}
function downloadCsv() {
    fetch('/api/analytics/export', {headers: {'Accept': 'text/csv'}}).then(r=>r.text()).then(csv => {
        const blob = new Blob([csv], {type: 'text/csv'});
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'analytics.csv';
        a.click();
        URL.revokeObjectURL(url);
    });
}
function uploadData() {
    const type = document.getElementById('importType').value;
    const data = document.getElementById('importInput').value;
    let url = '/api/analytics/import';
    let headers = {};
    let body = data;
    if (type === 'json') {
        headers['Content-Type'] = 'application/json';
    } else {
        headers['Content-Type'] = 'text/csv';
    }
    fetch(url, {method: 'POST', headers, body}).then(r=>r.text()).then(msg => {
        document.getElementById('importResult').innerText = msg;
    });
    return false;
}
</script>
</body>
</html>
