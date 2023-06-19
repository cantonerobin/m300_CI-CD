#!/bin/bash
# Stop running container
docker-compose -f /path/to/docker-compose.yml down

# Pull new Image
docker-compose -f /path/to/docker-compose.yml pull

# Start container
docker-compose -f /path/to/docker-compose.yml up -d