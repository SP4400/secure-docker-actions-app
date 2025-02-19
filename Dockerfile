#using a python slim image for security
FROM python:3.14.0a5-alpine3.21
#update system packages to fix vulnerabilities
#RUN apt-get update && apt-get upgrade -y
#set a non root user for security to run the container
RUN adduser -D -u 1000 secureuser
USER secureuser
# setting up the working directory for the container
WORKDIR /app
#copy the requirements.txt to the container
COPY app/requirements.txt .
#upgrade set-up tools
RUN pip install --upgrade setuptools
#install the requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

#copy the contents to the container

COPY app/ .
#expose the port
EXPOSE 5000

#run the application
CMD [ "python", "app.py" ]