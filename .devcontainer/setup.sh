#!/bin/sh

set -eux

if [ -z ${CODESPACE_NAME+x} ]; then
	SITE_HOST="http://localhost:8080"
else
	SITE_HOST="https://${CODESPACE_NAME}-8080.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
fi

# Install dependencies
cd /var/www/html/wp-content/plugins/simple-podcasting
npm install && npm run build

# Install WordPress and activate the plugin/theme.
cd /var/www/html
echo "Setting up WordPress at $SITE_HOST"
wp core install --url="$SITE_HOST" --title="Simple Podcasting Development" --admin_user="admin" --admin_email="admin@example.com" --admin_password="password" --skip-email

echo "Activate Plugin"
wp plugin activate simple-podcasting
