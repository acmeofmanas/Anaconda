[kogentix_ops@cdhmn03 ~]$ cat /var/tmp/change_permission.sh
#!/bin/bash
find /data/datascience_python/   -user root  -print -exec chmod 775 {} +
find /data/datascience_python/  \! -perm 775 -type f -print

find /data/datascience_python/ \! -user root  -print -exec chown -h root:cdh_datascience {} +
find /data/datascience_python/ \! -group cdh_datascience  -print -exec chown -h root:cdh_datascience {} +
[kogentix_ops@cdhmn03 ~]$ crontab -l
no crontab for kogentix_ops
[kogentix_ops@cdhmn03 ~]$ crontab -e
no crontab for kogentix_ops - using an empty one
crontab: installing new crontab
[kogentix_ops@cdhmn03 ~]$ crontab -l
*/5 * * * * /var/tmp/change_permission.sh
[kogentix_ops@cdhmn03 ~]$
