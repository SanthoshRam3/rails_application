# Use the official Ruby 3.1.4 image with patch 223
FROM ruby:3.1.4

# Install nodejs and postgresql-client
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory to /sample_project
WORKDIR /sample_project

# Copy the current directory contents into the container at /sample_project
COPY . /sample_project

# Install any needed packages specified in Gemfile
RUN bundle install

# Copy the entrypoint script into the container and make it executable
COPY entrypoint.sh /sample_project/entrypoint.sh
RUN chmod +x entrypoint.sh

# Define the script to run when the container starts
ENTRYPOINT ["/sample_project/entrypoint.sh"]

# Expose port 3000 to the outside world
EXPOSE 3000

# Define the command to run the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
