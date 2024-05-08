# Use an official Python runtime as a parent image
FROM python:3.9.2-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install pipenv
RUN pip install --upgrade pip && \
    pip install pipenv==2022.1.8

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app

# Install any needed packages specified in Pipfile
RUN pipenv install

# Make port 9000 available to the world outside this container
EXPOSE 9000

# Define environment variable
ENV UVICORN_HOST=0.0.0.0
ENV UVICORN_PORT=9000

# Run the application
CMD ["pipenv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000"]
