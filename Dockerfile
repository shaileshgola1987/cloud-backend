# Use lightweight Node image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy application code
COPY . .

# Set production environment
ENV NODE_ENV=production
ENV PORT=5500

# Expose backend port
EXPOSE 5500

# Start the application
CMD ["npm", "start"]