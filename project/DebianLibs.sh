#!/bin/bash

# 1. Exporter la liste des paquets installés dans un fichier
dpkg --get-selections > /tmp/liste_paquets.txt

# 2. (Optionnel) Nettoyer le fichier pour ne garder que les noms des paquets
# La commande ci-dessus produit "nom_paquet\tinstall", on garde juste le nom
awk '{print $1}' /tmp/liste_paquets.txt > /tmp/liste_paquets_noms.txt

# 3. Pour réinstaller :
# D'abord mettre à jour les sources
sudo apt-get update

# Ensuite, réinstaller tous les paquets listés
# La commande apt-get install accepte les noms de paquets en argument
# Note: Cela réinstallera les versions disponibles dans les dépôts actuels
# sudo xargs apt-get install -y < /tmp/liste_paquets_noms.txt