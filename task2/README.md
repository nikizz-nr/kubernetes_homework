# kubernetes_homework
## Задание 2
![screen_01](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k01.png?raw=true)
![screen_02](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k02.png?raw=true)
![screen_03](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k03.png?raw=true)
![screen_04](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k04.png?raw=true)
![screen_05](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k05.png?raw=true)
Под не доступен извне кластера (маршрута нет), но доступен как из миникуба, так и из других под.
![screen_06](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k06.png?raw=true)
![screen_07](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k07.png?raw=true)
![screen_08](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k08.png?raw=true)
Сервис не доступен извне кластера, так как используется тип ClusterIP. Сервис доступен из миникуба (возвращаются ответы от разных под) и из ноды (возвращаются ответы от других под, подключенных к сервису).
![screen_09](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k09.png?raw=true)
Сервис доступен извне кластера по порту, отображающемуся в свойствах сервиса NodePort, ответы возвращаются от разных под.
![screen_10](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k10.png?raw=true)
![screen_11](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k11.png?raw=true)
Адрес DNS-сервера указаного как nameserver в поде не соответствует адресу кластера. Указанный адрес соответствует адресу сервиса kube-dns указывающего на под с CoreDNS.
![screen_12](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k12.png?raw=true)
Поднимаем ничего не делающий под c apline (sleep 3600, в образе alpine из коробки есть nslookup). Из данного пода резолвим clusterip сервис - получаем IP-адрес сервиса. Резолвим headless-сервис и получаем список из IP-адресов отдельных под, на которые указывает headless-сервис.
![screen_13](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k13.png?raw=true)
Описание поды с ingress-контроллером в файле output.yaml
![screen_14](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k14.png?raw=true)
После запуска ingress-контроллера и ingress поды доступны через ингресс извне кластера по 80 порту, ответы возвращаются от разных под.

## Домашнее задание
![screen_15](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k15.png?raw=true)
Часть под управляются (coredns, metrics-server) с помощью ReplicaSet, которые в свою очередь управляются соответствующими Deployment.
Kube-proxy управляется DaemonSet, так как kube-proxy должен запускаться на всех нодах.
etcd, kube-apiserver, kube-controller-manager, kube-scheduler являются статичными подами и частью control plane, и, как и все статичные поды, управляются напрямую демоном kubelet.
![screen_16](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task2/images/k16.png?raw=true)
Для быстрого разворачивания/удаления всех необходимых компонентов написан скрипт deploy.sh расположенный в папке homework_files.
Данный скрипт позволяет развернуть/удалить configmap, deployment, service и ingress для production deployment и canary deployment.
После разворачивания мы видим поднятые поды в соответствии с настройками прописанными в манифестах в папке homework_files (3 production-поды и 1 canary-пода).
Canary-релиз настроен таким образом, чтобы отправлять пользователя на production или canary deployment в зависимости от значения переданного заголовка canary, что видно на скриншоте, на выполнении 100 соответствующих запросов.
Если заголовок в запросе не передан deployment выбирается в соответствии с указанным весом canary deployment. 1000 циклических запросов показывает, что, в соответствии с настройками, около 5% запросов уходят в canary depoloyment.
