FROM ubuntu:20.04

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y squid && \
    mkdir -p /var/log/squid && \
    touch /var/log/squid/access.log

# Copier notre fichier de configuration personnalisé
COPY squid.conf /etc/squid/squid.conf

# Exposer le port du proxy
EXPOSE 3128

# Lancer squid en mode foreground
CMD ["squid", "-N", "-d", "1"]
