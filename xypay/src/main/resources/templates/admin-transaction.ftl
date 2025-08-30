<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Transaction Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>Transaction Management</h1>
    <button class="btn btn-primary mb-3" onclick="showDepositModal()">Deposit</button>
    <button class="btn btn-secondary mb-3" onclick="showWithdrawModal()">Withdraw</button>
    <button class="btn btn-success mb-3" onclick="showTransferModal()">Transfer</button>
    <table class="table" id="txTable">
        <thead><tr><th>ID</th><th>Account ID</th><th>Type</th><th>Amount</th><th>Currency</th><th>Status</th><th>Reference</th></tr></thead>
        <tbody></tbody>
    </table>
</div>
<!-- Deposit Modal -->
<div class="modal" tabindex="-1" id="depositModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Deposit</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="depositAccountId" placeholder="Account ID">
        <input class="form-control mb-2" id="depositAmount" placeholder="Amount">
        <input class="form-control mb-2" id="depositCurrency" placeholder="Currency">
        <input class="form-control mb-2" id="depositRef" placeholder="Reference">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="deposit()">Deposit</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Withdraw Modal -->
<div class="modal" tabindex="-1" id="withdrawModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Withdraw</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="withdrawAccountId" placeholder="Account ID">
        <input class="form-control mb-2" id="withdrawAmount" placeholder="Amount">
        <input class="form-control mb-2" id="withdrawCurrency" placeholder="Currency">
        <input class="form-control mb-2" id="withdrawRef" placeholder="Reference">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="withdraw()">Withdraw</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- Transfer Modal -->
<div class="modal" tabindex="-1" id="transferModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Transfer</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="transferFrom" placeholder="From Account ID">
        <input class="form-control mb-2" id="transferTo" placeholder="To Account ID">
        <input class="form-control mb-2" id="transferAmount" placeholder="Amount">
        <input class="form-control mb-2" id="transferCurrency" placeholder="Currency">
        <input class="form-control mb-2" id="transferRef" placeholder="Reference">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="transfer()">Transfer</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function loadTransactions() {
    fetch('/api/transactions')
        .then(r=>r.json())
        .then(data => {
            let rows = '';
            data.forEach(t => {
                rows += `<tr><td>${t.id}</td><td>${t.accountId}</td><td>${t.type}</td><td>${t.amount}</td><td>${t.currency}</td><td>${t.status}</td><td>${t.reference}</td></tr>`;
            });
            document.querySelector('#txTable tbody').innerHTML = rows;
        });
}
function showDepositModal() {
    new bootstrap.Modal(document.getElementById('depositModal')).show();
}
function deposit() {
    const accountId = document.getElementById('depositAccountId').value;
    const amount = document.getElementById('depositAmount').value;
    const currency = document.getElementById('depositCurrency').value;
    const ref = document.getElementById('depositRef').value;
    fetch('/api/transactions/deposit', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `accountId=${encodeURIComponent(accountId)}&amount=${encodeURIComponent(amount)}&currency=${encodeURIComponent(currency)}&reference=${encodeURIComponent(ref)}`
    }).then(()=>{loadTransactions();bootstrap.Modal.getInstance(document.getElementById('depositModal')).hide();});
}
function showWithdrawModal() {
    new bootstrap.Modal(document.getElementById('withdrawModal')).show();
}
function withdraw() {
    const accountId = document.getElementById('withdrawAccountId').value;
    const amount = document.getElementById('withdrawAmount').value;
    const currency = document.getElementById('withdrawCurrency').value;
    const ref = document.getElementById('withdrawRef').value;
    fetch('/api/transactions/withdraw', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `accountId=${encodeURIComponent(accountId)}&amount=${encodeURIComponent(amount)}&currency=${encodeURIComponent(currency)}&reference=${encodeURIComponent(ref)}`
    }).then(()=>{loadTransactions();bootstrap.Modal.getInstance(document.getElementById('withdrawModal')).hide();});
}
function showTransferModal() {
    new bootstrap.Modal(document.getElementById('transferModal')).show();
}
function transfer() {
    const from = document.getElementById('transferFrom').value;
    const to = document.getElementById('transferTo').value;
    const amount = document.getElementById('transferAmount').value;
    const currency = document.getElementById('transferCurrency').value;
    const ref = document.getElementById('transferRef').value;
    fetch('/api/transactions/transfer', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `fromAccountId=${encodeURIComponent(from)}&toAccountId=${encodeURIComponent(to)}&amount=${encodeURIComponent(amount)}&currency=${encodeURIComponent(currency)}&reference=${encodeURIComponent(ref)}`
    }).then(()=>{loadTransactions();bootstrap.Modal.getInstance(document.getElementById('transferModal')).hide();});
}
loadTransactions();
</script>
</body>
</html>
