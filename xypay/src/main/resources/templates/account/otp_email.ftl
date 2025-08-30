<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background-color: #f8f9fa;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
        }
        .otp-code {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
            letter-spacing: 2px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            text-align: center;
            margin: 20px 0;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 20px 0;
        }
        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            font-size: 12px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Account Verification</h1>
    </div>
    
    <p>Hello ${username!"User"},</p>
    
    <p>Thank you for registering with our banking system. To complete your registration, please use the following OTP code:</p>
    
    <div class="otp-code">${otp!"000000"}</div>
    
    <p>This code will expire in ${otp_expiry_minutes!10} minutes.</p>
    
    <p>Alternatively, you can verify your account by clicking the button below:</p>
    
    <div style="text-align: center;">
        <a href="${verification_link!'#'}" class="button">Verify Account</a>
    </div>
    
    <p>If the button doesn't work, you can also copy and paste the following link into your browser:</p>
    <p>${verification_link!'#'}</p>
    
    <p>If you did not request this verification, please ignore this email or contact our support team.</p>
    
    <div class="footer">
        <p>This is an automated message. Please do not reply to this email.</p>
        <p>&copy; 2025 XY Pay. All rights reserved.</p>
    </div>
</body>
</html>