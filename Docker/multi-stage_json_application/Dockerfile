# Stage 1: Build Stage
FROM node:16 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json to the container
COPY package.json package-lock.json ./

# Install all dependencies (including dev dependencies)
RUN npm install

# Copy the source code (app source code)
COPY src/ ./src/

# Stage 2: Production Stage
FROM node:16-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json from the build stage
COPY --from=build /app/package.json /app/package-lock.json ./

# Install only production dependencies (ignores dev dependencies)
RUN npm install --only=production

# Copy the app source code from the build stage
COPY --from=build /app/src /app/src

# Expose the port the app will run on
EXPOSE 3000

# Run the app
CMD ["node", "src/index.js"]
