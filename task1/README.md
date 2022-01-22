# kubernetes_homework
## Задание 1.1

### Установка необходимого ПО
Произведена установка kubernetes из репозитория apt.kubernetes.io в форме deb-пакетов и настройка автодополнения.
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k01.png?raw=true)
Из репозитория debian установлен Virtualbox
Установлен minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
```

### Запуск minikube и получение информации о кластере
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k02.png?raw=true)

### Получение информации о нодах
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k03.png?raw=true)

### Установка kubernetes-dashboard
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k04.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k05.png?raw=true)

### Установка metrics-server
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k06.png?raw=true)
Deployment обновлен с помощью команды kubectl edit -n kube-system deployment metrics-server
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k07.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k08.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k09.png?raw=true)

### Получение доступа к dashboard
Получен токен доступа c помощью
```bash
kubectl get secrets -n kube-system $(kubectl describe sa -n kube-system default|grep Tokens|awk '{print $2}') -o yaml|grep -E "^[[:space:]]*token:"|awk '{print $2}'|base64 -d
```
и запущен kubectl proxy
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k10.png?raw=true)

## Задание 1.2
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k11.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k12.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k13.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k14.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k15.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k16.png?raw=true)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k17.png?raw=true)

## Домашнее задание
yaml-файл описывающий deployment: homework_files/nging_depolyment.yml
Процесс разворачивания deployment
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k18.png?raw=true)
Удаляем один подов и наблюдаем как на его месте поднимается новый pod в соответствии с deployment (в нем прописано наличие 2 реплик)
![alt text](https://github.com/nikizz-nr/kubernetes_homework/blob/master/images/k19.png?raw=true)
