# Hide Apache server version

I was hiding my apache version in a .htaccess
but that's not nearly enough. On debian, I did

```bash
sudo nano /etc/apache2/conf-enabled/security.conf
sudo service apache2 restart
```

Resource

* <https://stackoverflow.com/questions/9000853/apache-how-to-hide-server-version-and-operation-system-from-users>
* <https://www.tecmint.com/apache-security-tips/>