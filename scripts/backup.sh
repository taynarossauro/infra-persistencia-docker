#!/bin/bash

set -e

VOLUME_NAME="mysql-prod-data"
BACKUP_DIR="./backups"
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/${VOLUME_NAME}_${DATE}.tar.gz"
LOG_FILE="${BACKUP_DIR}/backup_${DATE}.log"

mkdir -p "$BACKUP_DIR"

echo "Iniciando backup do volume: $VOLUME_NAME" | tee -a "$LOG_FILE"
echo "Arquivo de destino: $BACKUP_FILE" | tee -a "$LOG_FILE"

sudo docker run --rm \
  -v ${VOLUME_NAME}:/volume \
  -v $(pwd)/${BACKUP_DIR}:/backup \
  alpine \
  tar czf /backup/$(basename "$BACKUP_FILE") -C /volume .

echo "Backup finalizado com sucesso em: $(date)" | tee -a "$LOG_FILE"
ls -lh "$BACKUP_FILE" | tee -a "$LOG_FILE"