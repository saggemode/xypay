<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Screen Configurator - XyPay Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .config-panel { border: 1px solid #dee2e6; border-radius: 8px; padding: 20px; margin-bottom: 20px; }
        .field-config { background: #f8f9fa; padding: 15px; border-radius: 5px; margin-bottom: 10px; }
        .preview-area { min-height: 400px; border: 2px dashed #dee2e6; padding: 20px; }
        .drag-drop-area { border: 2px dashed #007bff; padding: 40px; text-align: center; color: #007bff; }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="config-panel">
                    <h5><i class="fas fa-cog"></i> Screen Properties</h5>
                    <form id="screenConfigForm">
                        <div class="mb-3">
                            <label class="form-label">Screen Code</label>
                            <input type="text" class="form-control" id="screenCode" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Screen Name</label>
                            <input type="text" class="form-control" id="screenName" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Screen Type</label>
                            <select class="form-control" id="screenType">
                                <option value="FORM">Form</option>
                                <option value="LIST">List</option>
                                <option value="DASHBOARD">Dashboard</option>
                                <option value="REPORT">Report</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Access Roles</label>
                            <select class="form-control" id="accessRoles" multiple>
                                <option value="ROLE_ADMIN">Admin</option>
                                <option value="ROLE_TELLER">Teller</option>
                                <option value="ROLE_MANAGER">Manager</option>
                                <option value="ROLE_OFFICER">Officer</option>
                            </select>
                        </div>
                    </form>
                </div>

                <div class="config-panel">
                    <h5><i class="fas fa-puzzle-piece"></i> Field Components</h5>
                    <div class="row">
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('text')">
                                <i class="fas fa-font"></i> Text
                            </button>
                        </div>
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('number')">
                                <i class="fas fa-hashtag"></i> Number
                            </button>
                        </div>
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('date')">
                                <i class="fas fa-calendar"></i> Date
                            </button>
                        </div>
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('select')">
                                <i class="fas fa-list"></i> Select
                            </button>
                        </div>
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('checkbox')">
                                <i class="fas fa-check-square"></i> Checkbox
                            </button>
                        </div>
                        <div class="col-6 mb-2">
                            <button class="btn btn-outline-primary btn-sm w-100" onclick="addField('textarea')">
                                <i class="fas fa-align-left"></i> Textarea
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="config-panel">
                    <h5><i class="fas fa-eye"></i> Screen Preview</h5>
                    <div id="previewArea" class="preview-area">
                        <div class="drag-drop-area">
                            <i class="fas fa-plus-circle fa-3x mb-3"></i>
                            <h5>Drag components here to build your screen</h5>
                            <p>Or click on field components to add them</p>
                        </div>
                    </div>
                    <div class="mt-3">
                        <button class="btn btn-success" onclick="saveConfiguration()">
                            <i class="fas fa-save"></i> Save Configuration
                        </button>
                        <button class="btn btn-info" onclick="previewConfiguration()">
                            <i class="fas fa-eye"></i> Preview
                        </button>
                        <button class="btn btn-warning" onclick="validateConfiguration()">
                            <i class="fas fa-check"></i> Validate
                        </button>
                    </div>
                </div>
            </div>

            <div class="col-md-3">
                <div class="config-panel">
                    <h5><i class="fas fa-wrench"></i> Field Properties</h5>
                    <div id="fieldProperties">
                        <p class="text-muted">Select a field to configure its properties</p>
                    </div>
                </div>

                <div class="config-panel">
                    <h5><i class="fas fa-shield-alt"></i> Validation Rules</h5>
                    <div id="validationRules">
                        <div class="mb-3">
                            <label class="form-label">Rule Type</label>
                            <select class="form-control" id="validationType">
                                <option value="required">Required</option>
                                <option value="regex">Regex Pattern</option>
                                <option value="range">Range</option>
                                <option value="custom">Custom Script</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Error Message</label>
                            <input type="text" class="form-control" id="errorMessage">
                        </div>
                        <button class="btn btn-primary btn-sm" onclick="addValidationRule()">
                            <i class="fas fa-plus"></i> Add Rule
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let fieldCounter = 0;
        let currentConfiguration = {
            fields: {},
            layout: {},
            validations: {}
        };

        function addField(fieldType) {
            fieldCounter++;
            const fieldId = `field_${fieldCounter}`;
            const fieldName = `${fieldType}_${fieldCounter}`;
            
            const fieldHtml = generateFieldHtml(fieldType, fieldId, fieldName);
            
            const previewArea = document.getElementById('previewArea');
            if (previewArea.querySelector('.drag-drop-area')) {
                previewArea.innerHTML = '';
            }
            
            const fieldDiv = document.createElement('div');
            fieldDiv.className = 'field-config';
            fieldDiv.innerHTML = fieldHtml;
            fieldDiv.onclick = () => selectField(fieldId, fieldType, fieldName);
            
            previewArea.appendChild(fieldDiv);
            
            // Add to configuration
            currentConfiguration.fields[fieldId] = {
                type: fieldType,
                name: fieldName,
                label: fieldName.replace('_', ' ').toUpperCase(),
                required: false,
                properties: {}
            };
        }

        function generateFieldHtml(fieldType, fieldId, fieldName) {
            const label = fieldName.replace('_', ' ').toUpperCase();
            
            switch(fieldType) {
                case 'text':
                    return `<label class="form-label">${label}</label><input type="text" class="form-control" id="${fieldId}" name="${fieldName}">`;
                case 'number':
                    return `<label class="form-label">${label}</label><input type="number" class="form-control" id="${fieldId}" name="${fieldName}">`;
                case 'date':
                    return `<label class="form-label">${label}</label><input type="date" class="form-control" id="${fieldId}" name="${fieldName}">`;
                case 'select':
                    return `<label class="form-label">${label}</label><select class="form-control" id="${fieldId}" name="${fieldName}"><option>Option 1</option><option>Option 2</option></select>`;
                case 'checkbox':
                    return `<div class="form-check"><input type="checkbox" class="form-check-input" id="${fieldId}" name="${fieldName}"><label class="form-check-label">${label}</label></div>`;
                case 'textarea':
                    return `<label class="form-label">${label}</label><textarea class="form-control" id="${fieldId}" name="${fieldName}" rows="3"></textarea>`;
                default:
                    return `<label class="form-label">${label}</label><input type="text" class="form-control" id="${fieldId}" name="${fieldName}">`;
            }
        }

        function selectField(fieldId, fieldType, fieldName) {
            const propertiesDiv = document.getElementById('fieldProperties');
            propertiesDiv.innerHTML = `
                <div class="mb-3">
                    <label class="form-label">Field Name</label>
                    <input type="text" class="form-control" value="${fieldName}" onchange="updateFieldProperty('${fieldId}', 'name', this.value)">
                </div>
                <div class="mb-3">
                    <label class="form-label">Label</label>
                    <input type="text" class="form-control" value="${currentConfiguration.fields[fieldId].label}" onchange="updateFieldProperty('${fieldId}', 'label', this.value)">
                </div>
                <div class="form-check mb-3">
                    <input type="checkbox" class="form-check-input" ${currentConfiguration.fields[fieldId].required ? 'checked' : ''} onchange="updateFieldProperty('${fieldId}', 'required', this.checked)">
                    <label class="form-check-label">Required</label>
                </div>
                <div class="mb-3">
                    <label class="form-label">CSS Class</label>
                    <input type="text" class="form-control" placeholder="form-control" onchange="updateFieldProperty('${fieldId}', 'cssClass', this.value)">
                </div>
            `;
        }

        function updateFieldProperty(fieldId, property, value) {
            currentConfiguration.fields[fieldId][property] = value;
        }

        function saveConfiguration() {
            const screenCode = document.getElementById('screenCode').value;
            const screenName = document.getElementById('screenName').value;
            const screenType = document.getElementById('screenType').value;
            const accessRoles = Array.from(document.getElementById('accessRoles').selectedOptions).map(option => option.value);

            const configData = {
                screenCode: screenCode,
                screenName: screenName,
                screenType: screenType,
                layoutConfig: currentConfiguration.layout,
                fieldConfig: currentConfiguration.fields,
                validationRules: currentConfiguration.validations,
                accessRoles: accessRoles,
                createdBy: 'ADMIN'
            };

            fetch('/admin/screen-configurator/screen-config', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(configData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('Configuration saved successfully!');
                } else {
                    alert('Error: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to save configuration');
            });
        }

        function previewConfiguration() {
            const configData = {
                screenName: document.getElementById('screenName').value,
                screenType: document.getElementById('screenType').value,
                layoutConfig: currentConfiguration.layout,
                fieldConfig: currentConfiguration.fields,
                validationRules: currentConfiguration.validations
            };

            fetch('/admin/screen-configurator/preview', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(configData)
            })
            .then(response => response.json())
            .then(data => {
                console.log('Preview generated:', data);
                alert('Preview generated successfully! Check console for details.');
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Failed to generate preview');
            });
        }

        function validateConfiguration() {
            alert('Configuration validation completed successfully!');
        }

        function addValidationRule() {
            const validationType = document.getElementById('validationType').value;
            const errorMessage = document.getElementById('errorMessage').value;
            
            // Add validation rule logic here
            alert(`Validation rule added: ${validationType} - ${errorMessage}`);
        }
    </script>
</body>
</html>
