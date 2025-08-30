<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Open Banking API Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>Open Banking API Test</h1>
    <button class="btn btn-primary mb-3" onclick="loadAccounts()">List Accounts</button>
    <div id="accounts"></div>
    <div id="details"></div>
    <hr>
    <h2>Initiate Payment</h2>
    <form id="paymentForm" onsubmit="return sendPayment()">
        <div class="mb-2"><input class="form-control" id="payTo" placeholder="To Account" required></div>
        <div class="mb-2"><input class="form-control" id="payAmount" placeholder="Amount" type="number" required></div>
        <div class="mb-2"><input class="form-control" id="payCurrency" placeholder="Currency (e.g. GBP)" required></div>
        <button class="btn btn-success">Send Payment</button>
    </form>
    <div id="paymentResult" class="mt-2"></div>
</div>
<script>
function loadAccounts() {
    fetch('/api/openbanking/accounts').then(r=>r.json()).then(data => {
        let html = '<table class="table"><thead><tr><th>ID</th><th>IBAN</th><th>Type</th><th>Currency</th><th>Actions</th></tr></thead><tbody>';
        data.forEach(a => {
            html += `<tr><td>${a.accountId}</td><td>${a.iban}</td><td>${a.type}</td><td>${a.currency}</td><td>
                <button class='btn btn-sm btn-info' onclick='viewBalance("${a.accountId}")'>Balance</button>
                <button class='btn btn-sm btn-secondary' onclick='viewTx("${a.accountId}")'>Transactions</button>
            </td></tr>`;
        });
        html += '</tbody></table>';
        document.getElementById('accounts').innerHTML = html;
    });
}
function viewBalance(id) {
    fetch(`/api/openbanking/accounts/${id}/balances`).then(r=>r.json()).then(d => {
        document.getElementById('details').innerHTML = `<b>Balance for ${id}:</b> ${d.balance} ${d.currency}`;
    });
}
function viewTx(id) {
    fetch(`/api/openbanking/accounts/${id}/transactions`).then(r=>r.json()).then(data => {
        let html = `<b>Transactions for ${id}:</b><table class='table'><thead><tr><th>ID</th><th>Amount</th><th>Currency</th><th>Description</th></tr></thead><tbody>`;
        data.forEach(t => {
            html += `<tr><td>${t.transactionId}</td><td>${t.amount}</td><td>${t.currency}</td><td>${t.description}</td></tr>`;
        });
        html += '</tbody></table>';
        document.getElementById('details').innerHTML = html;
    });
}
function sendPayment() {
    const body = {
        to: document.getElementById('payTo').value,
        amount: document.getElementById('payAmount').value,
        currency: document.getElementById('payCurrency').value
    };
    fetch('/api/openbanking/payments', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(body)
    }).then(r=>r.json()).then(d => {
        document.getElementById('paymentResult').innerText = 'Payment status: ' + d.status + ' (ID: ' + d.paymentId + ')';
    });
    return false;
}
</script>
</body>
</html>
