#!/bin/bash
# clean_tmp.sh - Nettoyer /tmp en sécurité

AGE=${1:-3}  # Âge minimum en jours (défaut: 3)

echo "=== Nettoyage de /tmp (fichiers plus vieux que ${AGE} jours) ==="

# Taille avant
AVANT=$(du -sh /tmp 2>/dev/null | cut -f1)
echo "Espace utilisé avant : $AVANT"

# Supprimer les fichiers et dossiers vides plus vieux que $AGE jours
# En excluant les sockets Unix et répertoires système actifs
find /tmp -mindepth 1 -maxdepth 1 \
  ! -name '.X11-unix' \
  ! -name '.ICE-unix' \
  ! -name '.font-unix' \
  ! -name '.Test-unix' \
  ! -name 'systemd-private-*' \
  -mtime +"$AGE" -depth -exec rm -rf {} + 2>/dev/null

# Taille après
APRES=$(du -sh /tmp 2>/dev/null | cut -f1)
echo "Espace utilisé après  : $APRES"
echo "=== Terminé ==="