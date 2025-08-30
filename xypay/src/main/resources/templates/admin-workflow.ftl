<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workflow Builder</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .workflow-step { background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 8px; padding: 16px; margin-bottom: 12px; cursor: move; }
        .workflow-step.dragging { opacity: 0.5; }
        .workflow-actions { margin-top: 24px; }
    </style>
</head>
<body>
    <main class="container py-4">
        <h1>Workflow Builder</h1>
        <div id="workflowSteps">
            <!-- Steps will be rendered here -->
        </div>
        <div class="workflow-actions">
            <button class="btn btn-primary" onclick="addStep()">Add Step</button>
            <button class="btn btn-success" onclick="saveWorkflow()">Save Workflow</button>
            <button class="btn btn-info" onclick="runWorkflow()">Test/Run Workflow</button>
        </div>
    </main>
    <script>
        let steps = [
            { name: 'Start', enabled: true, approver: 'System' },
            { name: 'Manager Approval', enabled: true, approver: 'Manager' },
            { name: 'Compliance Check', enabled: true, approver: 'Compliance' },
            { name: 'Finalize', enabled: true, approver: 'System' }
        ];
        function renderSteps() {
            const container = document.getElementById('workflowSteps');
            container.innerHTML = '';
            steps.forEach((step, idx) => {
                const div = document.createElement('div');
                div.className = 'workflow-step';
                div.draggable = true;
                div.ondragstart = e => { e.dataTransfer.setData('text/plain', idx); div.classList.add('dragging'); };
                div.ondragend = e => div.classList.remove('dragging');
                div.ondragover = e => e.preventDefault();
                div.ondrop = e => {
                    e.preventDefault();
                    const from = +e.dataTransfer.getData('text/plain');
                    const to = idx;
                    if (from !== to) {
                        const moved = steps.splice(from, 1)[0];
                        steps.splice(to, 0, moved);
                        renderSteps();
                    }
                };
                div.innerHTML = `
                    <input type="text" value="${step.name}" onchange="steps[${idx}].name=this.value" class="form-control mb-2" />
                    <label><input type="checkbox" ${step.enabled ? 'checked' : ''} onchange="steps[${idx}].enabled=this.checked"> Enabled</label>
                    <select class="form-select mt-2" onchange="steps[${idx}].approver=this.value">
                        <option value="System" ${step.approver==='System'?'selected':''}>System</option>
                        <option value="Manager" ${step.approver==='Manager'?'selected':''}>Manager</option>
                        <option value="Compliance" ${step.approver==='Compliance'?'selected':''}>Compliance</option>
                        <option value="Risk" ${step.approver==='Risk'?'selected':''}>Risk</option>
                    </select>
                    <button class="btn btn-danger btn-sm mt-2" onclick="removeStep(${idx})">Remove</button>
                `;
                container.appendChild(div);
            });
        }
        function addStep() {
            steps.push({ name: 'New Step', enabled: true, approver: 'System' });
            renderSteps();
        }
        function removeStep(idx) {
            steps.splice(idx, 1);
            renderSteps();
        }
        function saveWorkflow() {
            fetch('/api/preferences', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ workflowConfig: JSON.stringify(steps) })
            }).then(r => r.json()).then(() => alert('Workflow saved!'));
        }
        function runWorkflow() {
            alert('Workflow executed (demo only).');
        }
        renderSteps();
    </script>
</body>
</html>
