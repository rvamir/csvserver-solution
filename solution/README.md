# InfraCloud CSV Server Assignment - Part I

## Steps and Commands Executed

1. Pulled and ran the container:
   docker run -d --name csv_server infracloudio/csvserver:latest

2. Found error (inputdata missing), created gencsv.sh:
   ./gencsv.sh 2 8

3. Ran the container with volume, port mapping, and env var:
   docker run -d --name csv_server -v $(pwd)/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER=Orange infracloudio/csvserver:latest

4. Verified app at:
   http://localhost:9393

5. Saved outputs as instructed.
