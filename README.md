

---

# uber-api-dockerized

[![TravisCI](https://travis-ci.org/uber/Python-Sample-Application.svg?branch=master)](https://travis-ci.org/uber/Python-Sample-Application)  
[![Coverage Status](https://coveralls.io/repos/uber/Python-Sample-Application/badge.png)](https://coveralls.io/r/uber/Python-Sample-Application)

**Official Uber Developer Documentation:**  
[Uber Developer Portal](https://developer.uber.com/)

---

### Introduction

This repository contains a simple Python/Flask web application that integrates with Uber’s external API. Designed as a practical example, this project demonstrates how to use Uber’s API to build web applications that interact with Uber’s ride-sharing services. It provides developers with an accessible and extensible starting point to develop more complex applications and services on top of Uber’s capabilities.

The application is built using Python 2.7, and it showcases various Uber API endpoints for developers to experiment with and integrate into their own applications. The repository includes detailed documentation, making it easy for developers to understand and extend the functionality of the app. This app can be hosted locally or deployed to cloud platforms such as Heroku or AWS EC2.

---

### Features of the Application

- **Uber API Integration:** The app connects to Uber's external API to access a variety of services such as ride-hailing, user profile, and ride history.
- **Flask Web Framework:** The app is built using Flask, a micro-framework for Python that is easy to use and scalable.
- **OAuth Authentication:** The application allows users to authenticate with Uber's API using OAuth, providing secure access to user data.
- **Local and Cloud Deployment:** This app can be run locally on your development machine or deployed to cloud services like Heroku and AWS EC2 for wider accessibility.
- **Customizable:** Developers can extend and customize the application to suit their specific use cases, such as adding new API endpoints or integrating with other services.

---

### Prerequisites

Before you start using the application, ensure that the following prerequisites are met:

1. **Python 2.7:**  
   The application is developed using Python 2.7, and thus it is crucial to ensure that Python 2.7 is used in the environment where the app is being run. Python 2.7 is deprecated, but this application maintains compatibility for legacy reasons.
   
2. **Docker:**  
   Docker is used to containerize the application, ensuring that it runs consistently across different environments. If you wish to deploy the app using Docker, make sure Docker is installed and running on your local machine or cloud instance.
   
3. **AWS EC2 Instance (Optional):**  
   If you plan to deploy the app on AWS EC2, you will need to have an EC2 instance running and Docker installed on it.

4. **Heroku (Optional):**  
   The application can also be deployed to Heroku, a popular cloud platform for hosting web applications.

---

### How to Set Up and Use the Application

Follow these steps to get the Uber Python Sample Application up and running:

#### Step 1: Clone the Repository

Clone the Uber Python Sample Application repository to your local machine:

```bash
git clone https://github.com/uber/Python-Sample-Application.git
```

#### Step 2: Navigate to the Project Directory

Change to the project directory to access the application files:

```bash
cd Python-Sample-Application
```

#### Step 3: Modify the `app.py` File

In order to make the application accessible over the internet (not just on `localhost`), you need to modify the `app.py` file. Open the file using a text editor (such as `vim`, `nano`, or any IDE), and find the line where the Flask app is run. Modify the `app.run()` line to:

```python
app.run(host="0.0.0.0", debug=True, port=7000)
```

- `host="0.0.0.0"` allows the application to accept requests from external sources, making it accessible over the internet.
- `port=7000` specifies the port that the Flask application will run on.

Once you've made this change, save and close the file.

#### Step 4: Docker Setup

The easiest way to run this application is within a Docker container. To package the application into a Docker container, you will need a Dockerfile. Here’s the Dockerfile that ensures the application runs correctly in an isolated environment:

```Dockerfile
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
```

This Dockerfile defines the following:

- **Base Image:** `python:2.7` is used as the base image to run the application in Python 2.7.
- **Working Directory:** The working directory `/app` is set inside the container where the application files will reside.
- **Copying Application Files:** The application files are copied into the container.
- **Installing Dependencies:** The required Python dependencies are installed from `requirements.txt`.
- **Exposing Port 7000:** Port 7000 is exposed to allow access to the application.
- **Running the Application:** The Flask app is run when the container starts.

#### Step 5: Build the Docker Image

Once your Dockerfile is ready, build the Docker image by running the following command in the terminal:

```bash
docker build -t uber-python-sample-app .
```

This command will build the Docker image and tag it with the name `uber-python-sample-app`.

#### Step 6: Run the Docker Container

To run the application inside a Docker container and expose it on port 7000, execute the following command:

```bash
docker run -d -p 7000:7000 uber-python-sample-app
```

The `-d` flag runs the container in detached mode, and the `-p 7000:7000` flag binds the container’s port 7000 to the host’s port 7000.

#### Step 7: Access the Application

Once the container is running, you can access the application:

- If running locally, open your browser and navigate to:
  ```
  http://localhost:7000
  ```

- If deploying on an EC2 instance, use the public IP of the EC2 instance to access the application:
  ```
  http://<ec2-public-ip>:7000
  ```

You should now see the Flask application running, providing access to Uber's API functionality.

---

### Testing the Application

To ensure everything is working properly, you can run the provided tests:

#### Step 1: Install Testing Dependencies

The application uses `make` for dependency management. To install the required dependencies for testing, run the following command:

```bash
make bootstrap
```

#### Step 2: Run the Tests

To run the tests and validate the functionality of the application, use:

```bash
make test
```

#### Step 3: Regenerate Test Fixtures

If you need to regenerate the test fixtures, follow these steps:

1. Run the application to obtain an `auth_token` from the main page.
2. Copy the `auth_token` and replace it in the `test_endpoints.py` file where it is used.
3. Run the tests again to ensure everything is functioning properly.

---

### Contributing to the Application

We welcome contributions from the community! If you would like to contribute to this project, please follow these steps:

#### Step 1: Open a Ticket

If you find a bug or want to suggest a feature, please open an issue on GitHub. Ensure that the issue is detailed and provides enough context for the maintainers to understand the problem or request.

#### Step 2: Fork the Repository

If you plan to contribute code, fork the repository and create a new branch for your changes. This helps keep the main codebase clean and makes it easier to manage multiple contributions.

#### Step 3: Submit a Pull Request

- When submitting a pull request, make sure to include tests for the changes you have made.
- Ensure that the application passes the full test suite by running:
  ```bash
  make test
  ```

---

### Deploying to Heroku

You can easily deploy this application to Heroku, a cloud platform for hosting applications. To deploy the app to Heroku, click the button below:

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

After deploying to Heroku, you will need to configure the **redirect URI** in the Uber Developer Portal to match your Heroku application’s URL:

- Set your Uber OAuth app's redirect URI to:
  ```
  https://{your-app-name}.herokuapp.com/submit
  ```

You should also configure the `FLASK_DEBUG` environment variable to `False` on Heroku to properly serve the application with SSL traffic.

---

### Making Requests to Uber API

The base URL for all Uber API requests is:
```
https://api.uber.com/v1/
```

For a complete list of available endpoints, visit the [Uber API Endpoints Documentation](https://developer.uber.com/v1/endpoints/).

---

Let me know if you'd like to make any further adjustments or need additional details!
