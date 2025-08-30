<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ISO 20022 Export/Import</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>ISO 20022 Export/Import</h1>
    <button class="btn btn-primary mb-3" onclick="downloadXml()">Download Sample XML</button>
    <form id="importForm" onsubmit="return uploadXml()">
        <div class="mb-2"><textarea class="form-control" id="xmlInput" rows="8" placeholder="Paste ISO 20022 XML here" required></textarea></div>
        <button class="btn btn-success">Import XML</button>
    </form>
    <div id="importResult" class="mt-2"></div>
</div>
<script>
function downloadXml() {
    fetch('/api/iso20022/export').then(r=>r.text()).then(xml => {
        const blob = new Blob([xml], {type: 'application/xml'});
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'iso20022-sample.xml';
        a.click();
        URL.revokeObjectURL(url);
    });
}
function uploadXml() {
    const xml = document.getElementById('xmlInput').value;
    fetch('/api/iso20022/import', {
        method: 'POST',
        headers: {'Content-Type': 'application/xml'},
        body: xml
    }).then(r=>r.text()).then(msg => {
        document.getElementById('importResult').innerText = msg;
    });
    return false;
}
</script>
</body>
</html>
