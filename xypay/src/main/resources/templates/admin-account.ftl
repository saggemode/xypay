<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Account Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>Account Management</h1>
    <button class="btn btn-primary mb-3" onclick="showOpenModal()">Open Account</button>
    <table class="table" id="accountTable">
        <thead><tr><th>ID</th><th>Customer ID</th><th>Type</th><th>Currency</th><th>Status</th><th>Actions</th></tr></thead>
        <tbody></tbody>
    </table>
</div>
<!-- Open Modal -->
<div class="modal" tabindex="-1" id="openModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Open Account</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="openCustomerId" placeholder="Customer ID">
        <input class="form-control mb-2" id="openCurrency" placeholder="Currency">
        <input class="form-control mb-2" id="openType" placeholder="Account Type">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="openAccount()">Open</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function loadAccounts() {
    fetch('/api/accounts')
        .then(r=>r.json())
        .then(data => {
            let rows = '';
            data.forEach(a => {
                rows += `<tr><td>${a.accountId}</td><td>${a.customerId||''}</td><td>${a.type||a.accountType||''}</td><td>${a.currency}</td><td>${a.status||''}</td><td>
                    <button class='btn btn-sm btn-danger' onclick='closeAccount(${a.accountId})'>Close</button>
                    <button class='btn btn-sm btn-secondary' onclick='viewStatus(${a.accountId})'>Status</button>
                </td></tr>`;
            });
            document.querySelector('#accountTable tbody').innerHTML = rows;
        });
}
function showOpenModal() {
    new bootstrap.Modal(document.getElementById('openModal')).show();
}
function openAccount() {
    const customerId = document.getElementById('openCustomerId').value;
    const currency = document.getElementById('openCurrency').value;
    const type = document.getElementById('openType').value;
    fetch('/api/accounts/open', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `customerId=${encodeURIComponent(customerId)}&currency=${encodeURIComponent(currency)}&accountType=${encodeURIComponent(type)}`
    }).then(()=>{loadAccounts();bootstrap.Modal.getInstance(document.getElementById('openModal')).hide();});
}
function closeAccount(id) {
    fetch(`/api/accounts/${id}/close`, {method:'POST'}).then(loadAccounts);
}
function viewStatus(id) {
    fetch(`/api/accounts/${id}/status`).then(r=>r.text()).then(s=>alert('Status: '+s));
}
loadAccounts();
</script>
</body>
</html>
