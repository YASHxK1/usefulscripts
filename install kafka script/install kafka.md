# 🧭 How to use it

1. Save this file as `install_kafka.sh`.

2. Give it permission to run:

   ```bash
   chmod +x install_kafka.sh
   ```

3. Run it:

   ```bash
   ./install_kafka.sh
   ```

4. After it finishes
   Kafka & Zookeeper will both run automatically at boot.

5. Verify:

   ```bash
   sudo systemctl status kafka
   sudo systemctl status zookeeper
   ```

6. To test quickly:

   ```bash
   /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
   ```
