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

Part II: Prometheus Setup and Docker Compose
1. Prometheus Setup:
    * Added a prometheus.yml configuration file to the project directory under /solution/prometheus/.
    * Configured Prometheus to scrape metrics from the CSVServer container at port 9300.
2. Docker Compose Configuration:
    * Modified the existing docker-compose.yaml file to integrate both CSVServer and Prometheus services.
    * Ensured the Prometheus container would run alongside the CSVServer container and collect metrics.
3. Verification:
    * Ensured that Prometheus was successfully scraping the metrics from the CSVServer by accessing the Prometheus dashboard at http://localhost:9090.
    * Verified that the CSVServer metrics were being collected and displayed correctly.

* Successfully integrated Prometheus with the CSVServer using Docker Compose.
* Prometheus was able to collect and display metrics related to the CSVServer.
* The solution worked as expected without any errors, and metrics were accessible in the Prometheus dashboard.

Part III: Final Testing and Validation
1. Final Docker Compose Validation:
    * Ran the complete Docker Compose setup with both CSVServer and Prometheus containers.
    * Ensured that both services were up and running without issues ,confirmed with docker ps -a and docker logs
2. Metrics Scraping Validation:
    * Accessed the Prometheus web UI at http://localhost:9090 to check if the metrics from the CSVServer were being scraped correctly.
    * Verified the targets in Prometheus to ensure CSVServer was listed and scraping metrics at port 9300.
3. Access to CSVServer:
    * Checked that the CSVServer application was accessible at http://localhost:9393 with the appropriate border set to "Orange".
    * Ensured that the inputFile data generated earlier was displayed correctly in the web application.

* The entire solution, including CSVServer and Prometheus monitoring, was working as expected.
* Prometheus successfully collected metrics and displayed them in its dashboard.
* The CSVServer application was accessible with the correct configurations  and the setup is ready .
Committed the remianing changes  including updated README.md  to GitHub.
