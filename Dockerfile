FROM ubuntu:20.04

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer squid
RUN apt-get update && \
    apt-get install -y squid && \
    mkdir -p /var/log/squid && \
    chown -R proxy:proxy /var/log/squid

# Copier le fichier de configuration
COPY squid.conf /etc/squid/squid.conf

# Exposer le port 3128
EXPOSE 3128

# Lancer Squid en foreground (nécessaire pour Docker)
CMD ["squid", "-N", "-d", "1"]
