Purpose of Dockerfile
To host image of internal application using Docker. The app will be accessible to different teams. 

Step 1 Use command "FROM python:3.8-slim" to use Python runtime as parent image

If you are using a M1/M2 chip Mac, you should use the following image instead: --platform=linux/amd64 public.ecr.aws/docker/library/python:3.9.10-slim-buster. 

step 2 Use command to set work directory to /app which is in the folder
"WORKDIR /app"
Step 3 copy the application files in the container
COPY . /app

Step 4 Install system dependencies and ODBC driver
 RUN apt-get update && apt-get install -y \
    unixodbc unixodbc-dev odbcinst odbcinst1debian2 libpq-dev gcc && \
    apt-get install -y gnupg && \
    apt-get install -y wget && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    wget -qO- https://packages.microsoft.com/config/debian/10/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get purge -y --auto-remove wget && \  
    apt-get clean

Step 5 - Install pip and setuptools
RUN pip install --upgrade pip setuptools

Step 6 - Install Python packages specified in requirements.txt
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

Step 7 - Expose port 
EXPOSE 5000

Step 8 - Define Startup Command
CMD ["python", "./app.py"]




Commands used within setting up Docker file
docker tag <name of the image> <docker-hub-username>/<image-name>:<tag>. - tag the document

docker push - upload the doc onto Docker

docker run -p 5000:5000 <name of the image>. This maps port 5000 from your local machine to the container, enabling access to the containerized application from your local development environment. 



 Remove Containers: Use the docker ps -a command to list all containers, including stopped ones. Remove any unnecessary containers with docker rm <container-id> to free up resources.

 Remove Images: List all images using docker images -a and remove any unneeded images with docker rmi <image-id> to reclaim disk space
