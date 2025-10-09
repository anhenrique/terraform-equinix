#!/usr/bin/env bash
set -euo pipefail

CONFIG_FILE="/etc/ssh/sshd_config"
BACKUP_FILE="/etc/ssh/sshd_config.bak.$(date +%F_%H-%M-%S)"

# Verifica se está rodando como root
if [ "$(id -u)" -ne 0 ]; then
  echo "[ERRO] Este script precisa ser executado como root." >&2
  exit 1
fi

echo "[INFO] Criando backup em $BACKUP_FILE ..."
cp "$CONFIG_FILE" "$BACKUP_FILE"

# Altera PermitRootLogin
if grep -qE "^#?PermitRootLogin" "$CONFIG_FILE"; then
  sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin yes/' "$CONFIG_FILE"
else
  echo "PermitRootLogin yes" >> "$CONFIG_FILE"
fi

# Altera PasswordAuthentication
if grep -qE "^#?PasswordAuthentication" "$CONFIG_FILE"; then
  sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' "$CONFIG_FILE"
else
  echo "PasswordAuthentication yes" >> "$CONFIG_FILE"
fi

echo "[INFO] Testando sintaxe do sshd ..."
sshd -t

echo "[INFO] Reiniciando serviço SSH ..."
if command -v systemctl >/dev/null 2>&1; then
  systemctl restart sshd
else
  service ssh restart
fi

echo "[SUCESSO] Configuração aplicada. Root login e autenticação por senha ativados."

sudo reboot now