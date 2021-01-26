alias www='cd /var/www'
alias wordpress='cd /var/www/wp-content'
alias wordpress_dev='cd /var/www/dev/wordpress'


alias lock_ftp="sudo sed -i 's~'\''direct'\''~'\''ftpext'\''~g' /var/www/wp-config.php"
alias unlock_ftp="sudo sed -i 's~'\''ftpext'\''~'\''direct'\''~g' /var/www/wp-config.php"

