#using a python slim image for security
FROM python:3.9-slim
#set a non root user for security to run the container
RUN useradd -m secureuser
USER secureuser
#update system packages to fix vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean


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