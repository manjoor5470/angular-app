# first fetch image of node.js from docker hub
FROM node:18.17.1

# set the working directory inside container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the Angular application for production
RUN npm run build --prod

# Expose the port on which your Angular app runs (default is 80)
EXPOSE 80

# Define the command to start your Angular app
CMD ["npm", "start"]