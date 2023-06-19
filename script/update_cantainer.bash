#!/bin/bash

# Name des Docker Hub Repositorys und des Images
repository="cantonerobin"
image="modul300_ci-cd"


# Aktuelle Version des lokalen Images abrufen
current_version=$(docker inspect --format='{{.Id}}' $image)

# Aktuelle Version des Images auf Docker Hub abrufen
latest_version=$(curl -s "https://hub.docker.com/v2/repositories/$repository/tags/?page_size=1" | jq -r '.results[0].name')

# Prüfen, ob ein neues Image vorhanden ist
if [ "$current_version" != "$latest_version" ]; then
  echo "Ein neues Image wurde gefunden. Aktualisiere das Image..."

  # Container stoppen
  docker stop $image

  # Neues Image herunterladen
  docker pull $repository:$latest_version

  # Container mit dem neuen Image starten
      docker run -d \
        --name web \
        --restart unless-stopped \
        --expose 80 \
        --network my-network \
        cantonerobin/modul300_ci-cd:latest

  echo "Das Image wurde aktualisiert und der Container wurde neu gestartet."
else
  echo "Es ist keine Aktualisierung erforderlich. Das Image ist bereits auf dem neuesten Stand."
fi

