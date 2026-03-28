#!/bin/bash

# Install nginx
sudo apt update -y
sudo apt install -y nginx

# Set permissions
sudo chmod -R 755 /var/www/html

# Create directory
sudo mkdir -p /var/www/html/app1

# Get hostname
HOSTNAME=$(hostname)

# Create index.html
sudo tee /var/www/html/app1/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Stay Motivated 🚀</title>
  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
      text-align: center;
    }
    .container {
      backdrop-filter: blur(10px);
      background: rgba(255, 255, 255, 0.1);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.2);
      max-width: 600px;
    }
    h1 { font-size: 2.5rem; }
    .quote { font-size: 1.5rem; font-style: italic; }
    .footer { margin-top: 20px; font-size: 0.9rem; }
  </style>
</head>
<body>
  <div class="container">
    <h1>🚀 Keep Going - $HOSTNAME</h1>
    <p class="quote">
      "Success is not final, failure is not fatal: it is the courage to continue that counts."
    </p>
    <div class="footer">Built with 💻 & Motivation</div>
  </div>
</body>
</html>
EOF

sudo tee /var/www/html/index.html > /dev/null <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Stay Motivated 🚀</title>
  <style>
    body {
      margin: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
      text-align: center;
    }
    .container {
      backdrop-filter: blur(10px);
      background: rgba(255, 255, 255, 0.1);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.2);
      max-width: 600px;
    }
    h1 { font-size: 2.5rem; }
    .quote { font-size: 1.5rem; font-style: italic; }
    .footer { margin-top: 20px; font-size: 0.9rem; }
  </style>
</head>
<body>
  <div class="container">
    <h1>🚀 Keep Going - $HOSTNAME</h1>
    <p class="quote">
      "Success is not final, failure is not fatal: it is the courage to continue that counts."
    </p>
    <div class="footer">Built with 💻 & Motivation</div>
  </div>
</body>
</html>
EOF

# Restart nginx
sudo systemctl enable nginx
sudo systemctl restart nginx
