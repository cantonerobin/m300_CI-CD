    # Stoppen und Entfernen des bestehenden Containers
    docker-compose -f /path/to/docker-compose.yml down

    # Pullen des aktualisierten Images
    docker-compose -f /path/to/docker-compose.yml pull

    # Starten des aktualisierten Containers
    docker-compose -f /path/to/docker-compose.yml up -d