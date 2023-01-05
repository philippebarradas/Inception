# Inception

### Introduction
Le projet a pour but de mettre en place une mini-infrastructure de différents services en suivant des règles spécifiques en utilisant **Docker** et **docker-compose**. Nous allons virtualiser plusieurs images Docker en les créant dans une nouvelle machine virtuelle personnelle.

### Le Projet

Nous devons mettre en place :

- Un container Docker contenant NGINX.
- Un container Docker contenant WordPress + php-fpm (installé et configuré) uniquement sans nginx.
- Un container Docker contenant MariaDB uniquement sans nginx.
- Un volume contenant votre base de données WordPress.
- Un second volume contenant les fichiers de votre site WordPress.
- Un docker-network qui fera le lien entre les containers.

![container](https://user-images.githubusercontent.com/52048966/210536272-d778a749-e35b-45f6-9a23-573a59db8a21.jpeg)

- Chaque service tourne dans un container dédié sous Debian Buster.
- Chaque service possède son propre Dockerfile.
- Les Dockerfiles sont appelés dans un fichier docker-compose.yml par un Makefile.
- Les images Docker sont build de 0, sans utiliser des services tels que DockerHub.

### Note Finale
![10042](https://user-images.githubusercontent.com/52048966/113505196-96c57a00-953d-11eb-9be8-a3a58cadf38f.png)


