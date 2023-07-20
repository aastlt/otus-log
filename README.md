# otus-log

Задание:

Настроить аудит, следящий за изменением конфигов nginx.
Все критичные логи с вм web должны собираться и локально и удаленно на вм log.
Все логи nginx должны уходить на удаленный сервер (локально только критичные).
Логи аудита nginx должны также уходить на удаленный сервер.




  Запуск стенда: vagrant up

Vagrant создст стенд из двух ВМ средствами libvirt:
- web - объект логирования (192.168.50.10)
- log - сервер централизованного логирования (192.168.50.15)


1. Проверка критичных логов: несколько раз заходим на http://192.168.50.10/error-logs-test чтобы вызвать ошибку.

Проверим логи локально на web: > cat /var/log/nginx/error.log

Проверим логи на удаленном log: > cat /var/log/rsyslog/web/nginx_error.log

Итог: "Все критичные логи с web собираются и локально и удаленно"


2. Проверка остальных логов: несколько раз заходим на http://192.168.50.10 для успешного входа.

Проверим логи локально на web: > cat /var/log/nginx/access.log

Проверим логи на уделенном log: > cat /var/log/rsyslog/web/nginx_access.log

Итог: "Остальные логи собираются только удаленно"


4. Проверка аудита, контролирующего изменения конфигурации nginx: меняем атрибут конфига
- chmod +x /etc/nginx/nginx.conf.

Проверим на log-сервере, что пришла информация об изменении атрибута: > ausearch -f /etc/nginx/nginx.conf

Итог: "Логи аудита nginx уходят на удаленный сервер"
