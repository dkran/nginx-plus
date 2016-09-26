# nginx-plus

Minimally modified nginx container suiting my needs

* Ports:
  * ``80``
  * ``437``

* Volumes:
  * ``/etc/nginx/`` - nginx Configuration Files
  * ``/srv/http`` - Main directory to serve files from
  * ``/var/log/nginx`` - Logs from the server.

You can probably guess what most of these do.  I prefer to create a ``/etc/nginx/sites-available`` folder and symlink
servers in ``/etc/nginx/sites-enabled`` to those, so it's easy to turn a specific server on or off.

 * TODO:
   * create a ``docker-compose.yml`` file for easy launching
   * Auto-populate empty directories that are linked volumes so that way launching works off the bat.
  