echo "Installing Siege"
sudo apt update -y
sudo apt install siege -y

echo "Installing Vegeta"
sudo curl -LO 'https://github.com/tsenart/vegeta/releases/download/v6.3.0/vegeta-v6.3.0-linux-386.tar.gz'
tar xvzf vegeta-v6.3.0-linux-386.tar.gz
pwd
ls -la
whoami