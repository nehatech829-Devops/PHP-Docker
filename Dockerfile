FROM php:8.2-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy application files
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Enable Apache rewrite module (optional but recommended)
RUN a2enmod rewrite

# Expose Apache port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
