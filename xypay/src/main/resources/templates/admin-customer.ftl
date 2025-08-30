<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Customer Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container py-4">
    <h1>Customer Management</h1>
    <button class="btn btn-primary mb-3" onclick="showOnboardModal()">Onboard Customer</button>
    <table class="table" id="customerTable">
        <thead><tr><th>ID</th><th>Name</th><th>KYC Status</th><th>Actions</th></tr></thead>
        <tbody></tbody>
    </table>
</div>
<!-- Onboard Modal -->
<div class="modal" tabindex="-1" id="onboardModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Onboard Customer</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="onboardName" placeholder="Name">
        <input class="form-control mb-2" id="onboardLegalId" placeholder="Legal ID">
        <input class="form-control mb-2" id="onboardKycStatus" placeholder="KYC Status">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="onboardCustomer()">Onboard</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- KYC Modal -->
<div class="modal" tabindex="-1" id="kycModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"><h5 class="modal-title">Verify KYC</h5></div>
      <div class="modal-body">
        <input class="form-control mb-2" id="kycDocType" placeholder="Document Type">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" onclick="verifyKYC()">Verify</button>
        <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
let customers = [];
let selectedCustomerId = null;
function loadCustomers() {
    fetch('/api/customers')
        .then(r=>r.json())
        .then(data => {
            customers = data;
            let rows = '';
            data.forEach(c => {
                rows += `<tr><td>${c.id}</td><td>${c.name}</td><td>${c.kycStatus}</td><td>
                    <button class='btn btn-sm btn-info' onclick='showKycModal(${c.id})'>Verify KYC</button>
                    <button class='btn btn-sm btn-secondary' onclick='viewCustomer(${c.id})'>View</button>
                </td></tr>`;
            });
            document.querySelector('#customerTable tbody').innerHTML = rows;
        });
}
function showOnboardModal() {
    new bootstrap.Modal(document.getElementById('onboardModal')).show();
}
function onboardCustomer() {
    const name = document.getElementById('onboardName').value;
    const legalId = document.getElementById('onboardLegalId').value;
    const kycStatus = document.getElementById('onboardKycStatus').value;
    fetch('/api/customers/onboard', {
        method: 'POST',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: `name=${encodeURIComponent(name)}&legalId=${encodeURIComponent(legalId)}&kycStatus=${encodeURIComponent(kycStatus)}`
    }).then(()=>{loadCustomers();bootstrap.Modal.getInstance(document.getElementById('onboardModal')).hide();});
}
function showKycModal(id) {
    selectedCustomerId = id;
    new bootstrap.Modal(document.getElementById('kycModal')).show();
}
function verifyKYC() {
    const docType = document.getElementById('kycDocType').value;
    fetch(`/api/customers/${selectedCustomerId}/verify-kyc?documentType=${encodeURIComponent(docType)}`, {method:'POST'})
        .then(()=>{loadCustomers();bootstrap.Modal.getInstance(document.getElementById('kycModal')).hide();});
}
function viewCustomer(id) {
    fetch(`/api/customers/${id}`)
        .then(r=>r.json())
        .then(c => alert(`Name: ${c.name}\nLegal ID: ${c.legalId}\nKYC: ${c.kycStatus}`));
}
loadCustomers();
</script>
</body>
</html>
