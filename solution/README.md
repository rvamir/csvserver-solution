InfraCloud CSV Server Assignment

Part I: Setting Up CSVServer and Troubleshooting
1. Pulled and ran the container: docker run -d --name csv_server infracloudio/csvserver:latest
2. Identified the error (inputdata missing) and created the gencsv.sh script: The csvserver container was not working as expected because it was missing the input data. To resolve this, I created a bash script gencsv.sh that generates a file named inputFile with the following structure: ./gencsv.sh 2 8
3. Ran the container with volume, port mapping, and environment variable: With the inputFile generated, I ran the container with the volume mapped to pass the inputFile into the container. I also exposed port 9393 and set the environment variable CSVSERVER_BORDER to "Orange": docker run -d --name csv_server -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
4. Verified the application was working: I accessed the application at http://localhost:9393 to confirm it was up and running, displaying the data and with an orange border.
5. Saved outputs as instructed:
    * Executed the following commands to save the outputs: curl -o ./part-1-output http://localhost:9393/raw
    * wget -O ./part-1-output http://localhost:9393/raw
    * docker logs [container_id] >& part-1-logs
Committed the changes including gencsv.sh, inputFile,README.md, part-1-cmd, part-1-output, and part-1-logs to GitHub.

Part II: Docker Compose Setup
1. Deleted previously running container.
2. Created docker-compose.yaml to run csvserver.
3. Created .env file (csvserver.env) for environment variables: CSVSERVER_BORDER=Orange
4. Ran the application using: docker-compose up -d
5. Verified:
    * App accessible at http://localhost:9393
    * Data and styling were correctly applied from inputFile and environment variable.

Part III: Prometheus Integration
Prometheus Setup:
1. Created prometheus.yml config file under solution/prometheus/.
2. Configured Prometheus to scrape csvserver metrics at port 9300
Docker Compose Update:
1. Extended docker-compose.yaml to include Prometheus service
2. Ran Prometheus with CSVServer using: docker-compose up -d
3. Verified:
    * Prometheus dashboard at http://localhost:9090
    * Queried csvserver_records, saw correct metrics line.
    * Confirmed Prometheus successfully scrapes metrics.

Committed the remianing changes  including updated README.md  to GitHub.
