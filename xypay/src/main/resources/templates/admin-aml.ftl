<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - AML Monitoring</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>AML Monitoring</h1>
    <form id="checkForm" class="mb-3" onsubmit="return checkTransaction()">
        <div class="row g-2">
            <div class="col"><input class="form-control" id="txId" placeholder="Transaction ID"></div>
            <div class="col"><input class="form-control" id="txAmount" placeholder="Amount"></div>
            <div class="col"><input class="form-control" id="txCurrency" placeholder="Currency"></div>
            <div class="col"><button class="btn btn-primary">Check</button></div>
        </div>
    </form>
    <h2>Alerts</h2>
    <ul class="list-group" id="alertList"></ul>
</div>
<script>
function loadAlerts() {
    fetch('/api/aml/alerts').then(r=>r.json()).then(alerts => {
        document.getElementById('alertList').innerHTML = alerts.map(a=>`<li class='list-group-item'>${a}</li>`).join('');
    });
}
function checkTransaction() {
    const tx = {
        id: document.getElementById('txId').value,
        amount: document.getElementById('txAmount').value,
        currency: document.getElementById('txCurrency').value
    };
    fetch('/api/aml/check', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(tx)
    }).then(()=>loadAlerts());
    return false;
}
loadAlerts();
</script>
</body>
</html>
