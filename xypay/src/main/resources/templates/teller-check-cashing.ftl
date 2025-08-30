<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Cashing - Teller</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; }
        .form-container { background: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.04); padding: 32px 24px; max-width: 500px; margin: 40px auto; }
        .form-title { font-size: 1.6rem; font-weight: 700; color: #2d3748; margin-bottom: 24px; }
        .form-label { font-weight: 600; color: #4a5568; }
        .btn-primary { background: #3182ce; border: none; }
        .btn-primary:focus { outline: 2px solid #3182ce; outline-offset: 2px; }
        .result-area { margin-top: 24px; }
    </style>
</head>
<body>
    <main class="form-container" aria-label="Check Cashing Form">
        <div class="form-title">Check Cashing</div>
        <form method="post" action="/teller/check-cashing" autocomplete="off">
            <div class="mb-3">
                <label for="checkNumber" class="form-label">Check Number</label>
                <input type="text" class="form-control" id="checkNumber" name="checkNumber" required aria-required="true">
            </div>
            <div class="mb-3">
                <label for="accountNumber" class="form-label">Account Number</label>
                <input type="text" class="form-control" id="accountNumber" name="accountNumber" required aria-required="true">
            </div>
            <div class="mb-3">
                <label for="amount" class="form-label">Amount</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" required aria-required="true">
            </div>
            <button type="submit" class="btn btn-primary w-100">Cash Check</button>
        </form>
        <div class="result-area" aria-live="polite">
            <#if result??>
                <div class="alert alert-info mt-3">${result}</div>
            <#else>
                <div class="text-muted">Fill out the form to cash a check.</div>
            </#if>
        </div>
    </main>
</body>
</html>
