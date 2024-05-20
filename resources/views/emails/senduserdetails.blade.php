<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Log in Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
        }
        h1 {
            color: #0d6efd;
        }
        p {
            margin: 10px 0;
        }
        .otp-code {
            font-size: 1.5em;
            font-weight: bold;
            color: black;
        }
        .footer {
            margin-top: 20px;
            font-size: 0.875em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Log in details</h1>
        <p>Hi {{ $user->name }},</p>
        <p>Wlcome to Pefrank your Login details</p>
        <p class="otp-code">Username: {{ $username }}</p>
        <p class="otp-code">Password: {{ $password }}</p>
        <p>If you did not request an OTP code, please disregard this email.</p>
        <p>Thank you,</p>
        <p>SIMIS Team</p>
        <p class="footer">This is an automated message, please do not reply.</p>
    </div>
</body>
</html>
