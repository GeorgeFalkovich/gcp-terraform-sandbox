#!/bin/bash

# Update the package index
echo "Updating package index..."
sudo apt update -y

# Install MySQL server
echo "Installing MySQL server..."
sudo apt install mysql-server -y

# Start MySQL service
echo "Starting MySQL service..."
sudo systemctl start mysql

# Enable MySQL to start on boot
echo "Enabling MySQL to start on boot..."
sudo systemctl enable mysql

# Run MySQL secure installation
echo "Running MySQL secure installation..."
sudo mysql_secure_installation <<EOF

y # Enable VALIDATE PASSWORD PLUGIN (choose "y" for Yes or "n" for No)
2 # Set password validation level (0 = Low, 1 = Medium, 2 = Strong)
root # Replace with your MySQL root password
root # Confirm the MySQL root password
y # Remove anonymous users
y # Disallow root login remotely
y # Remove test database and access to it
y # Reload privilege tables now
EOF

echo "MySQL installation and initial setup are complete."

# Confirm MySQL status
echo "MySQL service status:"
sudo systemctl status mysql | grep Active

sleep 60

#!/bin/bash

# MySQL credentials
DB_USER="root"
DB_PASSWORD="your_password" # Replace with your MySQL root password
DB_NAME="music_store"

# Connect to MySQL and create the database and table if they don't exist
echo "Creating database and table..."

mysql -u"$DB_USER" -p"$DB_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
USE $DB_NAME;

CREATE TABLE IF NOT EXISTS guitars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(50),
    type VARCHAR(50),
    color VARCHAR(50),
    year INT
);
EOF

# Arrays for brands, types, and colors
brands=("Fender" "Gibson" "Jackson" "Ibanez" "Yamaha" "PRS" "ESP" "Charvel" "Epiphone" "Schecter")
types=("Stratocaster" "LesPaul" "Dinky" "RG" "Pacifica" "Custom24" "LTD" "ProMod" "SG" "Omen")
colors=("Black" "Sunburst" "Red" "Blue" "Green" "White" "Yellow" "Purple" "Natural" "Silver")

# Insert 100 rows with different combinations of brand, type, color, and year
echo "Inserting 100 rows into 'guitars' table..."

mysql -u"$DB_USER" -p"$DB_PASSWORD" <<EOF
USE $DB_NAME;
$(for i in {1..100}; do
    brand="${brands[$((RANDOM % ${#brands[@]}))]}"
    type="${types[$((RANDOM % ${#types[@]}))]}"
    color="${colors[$((RANDOM % ${#colors[@]}))]}"
    year=$((1950 + RANDOM % 71))  # Random year between 1950 and 2020
    echo "INSERT INTO guitars (brand, type, color, year) VALUES ('$brand', '$type', '$color', $year);"
done)
EOF

echo "100 rows with varying brands, types, colors, and build years inserted successfully."




GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
