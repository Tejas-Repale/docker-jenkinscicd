# Use official Python slim image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Upgrade pip first
RUN python -m pip install --upgrade pip

# Install requirements with host network to avoid DNS issues
RUN pip install --no-cache-dir -r requirements.txt

# Expose container port
EXPOSE 8080

# Run the app
CMD ["python", "app.py"]

