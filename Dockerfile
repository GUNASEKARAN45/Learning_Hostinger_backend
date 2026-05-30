# Use a lightweight Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package lists
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy application source files
COPY . .

# Expose the server port
EXPOSE 5000

# Set environment variable defaults
ENV NODE_ENV=production
ENV PORT=5000

# Start the application
CMD ["node", "server.js"]
