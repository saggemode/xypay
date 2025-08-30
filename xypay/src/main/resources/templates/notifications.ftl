<!DOCTYPE html>
<html>
<head>
    <title>Notifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2>Notifications</h2>
    <table class="table table-bordered mt-3">
        <thead>
            <tr>
                <th>Message</th>
                <th>Timestamp</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <#list notifications as n>
                <tr>
                    <td>${n.message}</td>
                    <td>${n.timestamp}</td>
                    <td><#if n.read>Read<#else>Unread</#if></td>
                    <td>
                        <#if !n.read>
                        <form action="/notifications/read" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="${n.id}"/>
                            <button class="btn btn-success btn-sm">Mark as Read</button>
                        </form>
                        </#if>
                    </td>
                </tr>
            </#list>
        </tbody>
    </table>
</div>
</body>
</html>
