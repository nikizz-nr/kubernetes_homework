# kubernetes_homework
## Задание 3
![screen_01](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k01.png?raw=true)
![screen_02](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k02.png?raw=true)
![screen_03](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k03.png?raw=true)
![screen_04](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k04.png?raw=true)

## Домашнее задание
Манифесты домашнего задания находятся в директории homework_files
![screen_05](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k05.png?raw=true)
Применяем манифесты сервиса и ingress.
![screen_06](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k06.png?raw=true)
Видим результат доступный по IP адресу minikube на 80 порту.
![screen_07](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k07.png?raw=true)
Удаляем старый ingress, применяем deploy с nginx, возвращающий свой хостнейм (configmap, deploy, service из предыдущего задания). Применяем новый манифест ingress с двумя путями (/ и /web). Проверяем с помощью curl и видим что разные пути отдают minio и хостнейм контейнера с nginx.
![screen_08](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k08.png?raw=true)
Доступ по IP minikube в / также возвращает страницу входа minio. В директориии /web ответ возвращается от сервиса nginx. Хостнейм отличается от предыдущего скриншота, так как в deployment nginx поднимается 3 реплики.
![screen_09](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k09.png?raw=true)
Применяем манифест с emptyDir, из контейнера в поде и создаем файл в директории где смонтирован volume. Удаляем под, они пересоздается снова, подключаемся к контейнеру и видим что файл отсутствует, так как данные в emptyDir удаляются при удалении пода.

Так как у меня нет другого хоста в сети, nfs поднимался на той же хост-системе, где запущен minikube. Подключение осуществляется через nfs по ip хост-системы.
![screen_10](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k10.png?raw=true)
Применяем манифесты pv, pvc и тестового deployment. Из контейнера в поде создаем файл в директории где смонтирован volume. Удаляем deployment, pvc, pv.
![screen_11](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task3/images/k11.png?raw=true)
Проверяем директорию - файл был сохранен (даты модификации совпадают).