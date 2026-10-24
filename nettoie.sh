#!/bin/bash

echo "Début du nettoyage complet du système..."

# 1. Mise à jour des dépôts
echo "Mise à jour des dépôts..."
sudo apt update

# 2. Nettoyage des paquets et du cache APT
echo "Suppression des paquets orphelins et du cache..."
sudo apt autoremove -y
sudo apt clean
sudo apt autoclean

# 3. Suppression des fichiers de configuration orphelins
echo "Suppression des configurations orphelines..."
sudo dpkg -l | grep '^rc' | awk '{print $2}' | xargs sudo dpkg --purge -y

# 4. Libération de la RAM (Cache mémoire)
echo "Vidage du cache mémoire (RAM)..."
sync
echo 3 | sudo tee /proc/sys/vm/drop_caches

# 5. Nettoyage des fichiers temporaires
echo "Nettoyage des fichiers temporaires (/tmp et /var/tmp)..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "Nettoyage terminé !"