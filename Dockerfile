# Utilise une image Nginx légère comme base
FROM nginx:alpine

# Supprime la configuration Nginx par défaut
RUN rm /etc/nginx/conf.d/default.conf

# Crée une configuration Nginx minimale pour servir les fichiers statiques
COPY --from=nginx:alpine /etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=nginx:alpine /etc/nginx/conf.d /etc/nginx/conf.d

# Copie tout le contenu de ton projet HTML/CSS dans le dossier par défaut de Nginx pour les fichiers web
COPY . /usr/share/nginx/html

# Expose le port 80, qui est le port par défaut pour HTTP sur Nginx
EXPOSE 80

# La commande par défaut pour lancer Nginx
CMD ["nginx", "-g", "daemon off;"]