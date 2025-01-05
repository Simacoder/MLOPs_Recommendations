# Use an official python runtime as parent image
FROM python:3.10-slim

# set the working directory in the container
WORKDIR /app

# install build dependencies and Python dev tools
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy the currently directory contents into container at /app
COPY . /app

# Install any needed packages specified in requirements.txt 
RUN pip install --no-cache-dir -r requirements.txt

# expose port 5000 to the outside world
EXPOSE 5000

# Define envinroment variable
ENV FLASK_APP=app.py

# run the application
CMD ["flask", "run", "--host=0.0.0.0"]