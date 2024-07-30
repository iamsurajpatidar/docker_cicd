#This line specifies the base image for our application's Docker image for os file and python dependencies
FROM python:3.10

# Use build-time variable APP_HOME for app dict
ARG APP_HOME=/app

#Change working directory.
WORKDIR ${APP_HOME}

#Copy files and directories.
COPY ./requirements.txt /app/requirements.txt

#Execute build commands.
RUN pip install --no-cache-dir -r /app/requirements.txt


COPY . ${APP_HOME}

#Specify default commands
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
