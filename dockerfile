# Use the latest Node.js base image
FROM node:latest

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json files
COPY package*.json ./

# Get the git commit hash as an argument
ARG COMMIT_HASH
ENV GIT_COMMIT_HASH=$COMMIT_HASH

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 3000 to access the app
EXPOSE 3000

# Run npm install and then start the app
CMD ["sh", "-c", "npm install && npm start"]
