#!/bin/sh

set -eux

# Install WP-CLI
# echo "Installing wp-cli..."
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# sudo chmod +x wp-cli.phar
# sudo mv wp-cli.phar /usr/local/bin/wp

# # Install Xdebug
# sudo pecl install "xdebug" && docker-php-ext-enable xdebug
# sudo echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# sudo echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# sudo apachectl restart


# Install Composer
# curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


# Copy the welcome message
sudo cp .devcontainer/welcome-message.txt /usr/local/etc/vscode-dev-containers/first-run-notice.txt
