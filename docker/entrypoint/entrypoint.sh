#!/bin/bash

# Attendre que MySQL soit prêt avec mysqladmin
until mysqladmin ping -h db -u root -proot --silent; do
  echo "Waiting for MySQL to be ready..."
  sleep 1
done

# Exécuter les commandes Symfony
php bin/console doctrine:database:create --if-not-exists
php bin/console doctrine:migration:migrate --no-interaction

# Continuer avec la commande par défaut
exec "$@"