#!/bin/bash

set -e

VOLUME_NAME="mysql-prod-data"
BACKUP_FILE="$1"

if [ -z "$BACKUP_FILE" ]; then
  echo "Uso: ./scripts/restore.sh backups/arquivo-backup.tar.gz"
  exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Arquivo de backup não encontrado: $BACKUP_FILE"
  exit 1
fi

echo "Restaurando backup: $BACKUP_FILE"
echo "Volume de destino: $VOLUME_NAME"

sudo docker volume create "$VOLUME_NAME"

sudo docker run --rm \
  -v ${VOLUME_NAME}:/volume \
  -v $(pwd)/backups:/backup \
  alpine \
  sh -c "rm -rf /volume/* && tar xzf /backup/$(basename "$BACKUP_FILE") -C /volume"

echo "Restauração finalizada com sucesso."