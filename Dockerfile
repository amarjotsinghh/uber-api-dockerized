# Use a base image compatible with Python 2
FROM python:2.7

# Set the working directory in the container
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 7000 to the outside
EXPOSE 7000

# Run the application
CMD ["python", "app.py"]
