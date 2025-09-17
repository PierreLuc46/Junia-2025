



FROM php:8.2-apache

# Activer mod_rewrite (utile si routes/htaccess)
RUN a2enmod rewrite \
 && printf '<Directory "/var/www/html">\n\
    AllowOverride All\n\
    Require all granted\n\
</Directory>\n' > /etc/apache2/conf-available/project.conf \
 && a2enconf project

# Copier tout le code dans le docroot
COPY . /var/www/html/

# Droits simples
RUN chown -R www-data:www-data /var/www/html
