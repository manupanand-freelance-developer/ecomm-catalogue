FROM docker.io/redhat/ubi9-minimal:latest

# Install necessary tools
RUN microdnf install -y tar xz  bash

# Install Node.js (v22.14.0)
RUN cd /opt && \
    curl -LO https://nodejs.org/dist/v22.14.0/node-v22.14.0-linux-x64.tar.xz && \
    tar -xJf node-v22.14.0-linux-x64.tar.xz && \
    rm node-v22.14.0-linux-x64.tar.xz

# Add Node.js to PATH
ENV PATH="/opt/node-v22.14.0-linux-x64/bin:$PATH"

# Create app directory
WORKDIR /app

# Copy project files
COPY package.json server.js run.sh ./

# Install dependencies
RUN npm install

# Make sure run.sh is executable
RUN chmod +x ./run.sh

# Entrypoint
ENTRYPOINT ["bash", "./run.sh"]
