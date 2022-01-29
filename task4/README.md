# kubernetes_homework
## Задание 4
![screen_01](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k01.png?raw=true)
![screen_02](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k02.png?raw=true)

## Домашнее задание
Манифесты находятся в директории homework_files.
Создаем пользователей и контексты:
![screen_03](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k03.png?raw=true)
![screen_04](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k04.png?raw=true)
Применяем манифесты с описанием ролей и биндингов для новых пользователей:
![screen_05](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k05.png?raw=true)
Видим что пользователь deploy_view имеет только права на чтение deployments, pods. В то время как пользователь deploy_edit имееи полные права (на скриншоте пример с изменением количества реплик в deployment web).

Создаем namespace prod, пользователей и их контексты:
![screen_06](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k06.png?raw=true)
Применяем манифесты с биндингами:
![screen_07](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k07.png?raw=true)
Видим что под пользователем prod_admin мы успешно может создать deploy с nginx, а также отредактировать его увеличив количество реплик до 2 (также успешно получаем список под), но при этом только в namespace prod. Пользователь prod_view позволяет осуществлять операции на чтение (на скрине чтение списка под), но не имеет прав на редактирование в namespace prod.
![screen_08](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k08.png?raw=true)
В namespace default prod_view прав на чтение не имеет.

Создаем Service Account и биндинг с помощью манифеста, создаем контекст, проверяем права доступа:
![screen_09](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k09.png?raw=true)
Успешно читаем список под и изменяем количество реплик в deploy web с помощью контекста сервисного аккаунта sa-namespace-admin.

Проверяем права сервисного аккаунта sa-namespace-admin на другой namespace:
![screen_10](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task4/images/k10.png?raw=true)
Так как мы явно указали права доступа в манифесте только на namespace default, данный сервисный аккаунт не имеет прав на чтение в namespace prod.
