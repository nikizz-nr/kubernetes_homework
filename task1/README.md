# kubernetes_homework
## Задание 1.1

### Установка необходимого ПО
Произведена установка kubernetes из репозитория apt.kubernetes.io в форме deb-пакетов и настройка автодополнения.
![screen_01](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k01.png?raw=true)
Из репозитория debian установлен Virtualbox
Установлен minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```

### Запуск minikube и получение информации о кластере
![screen_02](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k02.png?raw=true)

### Получение информации о нодах
![screen_03](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k03.png?raw=true)

### Установка kubernetes-dashboard
![screen_04](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k04.png?raw=true)
![screen_05](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k05.png?raw=true)

### Установка metrics-server
![screen_06](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k06.png?raw=true)
Deployment обновлен с помощью команды kubectl edit -n kube-system deployment metrics-server
![screen_07](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k07.png?raw=true)
![screen_08](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k08.png?raw=true)
![screen_09](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k09.png?raw=true)

### Получение доступа к dashboard
Получен токен доступа c помощью
```bash
kubectl get secrets -n kube-system $(kubectl describe sa -n kube-system default|grep Tokens|awk '{print $2}') -o yaml|grep -E "^[[:space:]]*token:"|awk '{print $2}'|base64 -d
```
и запущен kubectl proxy
![screen_10](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k10.png?raw=true)

## Задание 1.2
![screen_11](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k11.png?raw=true)
![screen_12](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k12.png?raw=true)
![screen_13](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k13.png?raw=true)
![screen_14](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k14.png?raw=true)
![screen_15](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k15.png?raw=true)
![screen_16](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k16.png?raw=true)
![screen_17](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k17.png?raw=true)

## Домашнее задание
yaml-файл описывающий deployment: homework_files/nging_depolyment.yml
Процесс разворачивания deployment
![screen_18](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k18.png?raw=true)
Удаляем один подов и наблюдаем как на его месте поднимается новый pod в соответствии с deployment (в нем прописано наличие 2 реплик)
![screen_19](https://github.com/nikizz-nr/kubernetes_homework/blob/main/task1/images/k19.png?raw=true)
