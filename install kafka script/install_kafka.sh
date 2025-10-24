#!/bin/bash
set -e

echo "=== Updating system ==="
sudo apt update -y && sudo apt upgrade -y

echo "=== Installing Java ==="
sudo apt install -y openjdk-17-jdk wget

echo "=== Creating Kafka directory ==="
cd /opt
sudo mkdir -p /opt/kafka
cd /opt

echo "=== Downloading Apache Kafka 3.8.0 ==="
sudo wget -q https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz

echo "=== Extracting Kafka ==="
sudo tar -xzf kafka_2.13-3.8.0.tgz
sudo mv kafka_2.13-3.8.0 kafka
sudo rm kafka_2.13-3.8.0.tgz

echo "=== Setting permissions ==="
sudo chown -R $USER:$USER /opt/kafka

echo "=== Creating systemd services ==="

# Zookeeper service
cat <<EOF | sudo tee /etc/systemd/system/zookeeper.service > /dev/null
[Unit]
Description=Apache Zookeeper Server
After=network.target

[Service]
Type=simple
ExecStart=/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties
ExecStop=/opt/kafka/bin/zookeeper-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
EOF

# Kafka service
cat <<EOF | sudo tee /etc/systemd/system/kafka.service > /dev/null
[Unit]
Description=Apache Kafka Server
After=zookeeper.service

[Service]
Type=simple
ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
ExecStop=/opt/kafka/bin/kafka-server-stop.sh
Restart=on-abnormal

[Install]
WantedBy=multi-user.target
EOF

echo "=== Enabling and starting services ==="
sudo systemctl daemon-reload
sudo systemctl enable zookeeper
sudo systemctl enable kafka
sudo systemctl start zookeeper
sudo systemctl start kafka

echo "=== Kafka installation complete ==="
echo "Check status using: sudo systemctl status kafka"
