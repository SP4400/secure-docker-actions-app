#using a python slim image for security
FROM python:3.9-slim
#set a non root user for security to run the container
RUN useradd -m secureuser
USER secureuser
# setting up the working directory for the container
WORKDIR /app
#copy the requirements.txt to the container
COPY app/requirements.txt .
#install the requirements.txt
RUN pip install -r --no-cache-dir requirements.txt

#copy the contents to the container

COPY app/ .
#expose the port
EXPOSE 5000

#run the application
CMD [ "python", "app.py" ]