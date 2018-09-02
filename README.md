# Microservices & Kubernetes Sample

This is my sample for microservices and kubernetes.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Node.js
* Docker
* Kubectl
* Minikube

### Setup
Execute the `setup.sh` script.
```
./setup.sh
```
### Validate
Validate your pods.
```
kubectl get pods
NAME                                 READY     STATUS    RESTARTS   AGE
ambassador-6786f864fc-8frm4          2/2       Running   0          14m
ambassador-6786f864fc-ckzpn          2/2       Running   0          14m
ambassador-6786f864fc-kg5ch          2/2       Running   0          14m
auth-svc-5876666667-6xjbh            1/1       Running   0          14m
auth-svc-5876666667-8pgwl            1/1       Running   0          14m
auth-svc-5876666667-jqtz5            1/1       Running   0          14m
expected-date-svc-5c68fb79f7-7dqnx   1/1       Running   0          14m
expected-date-svc-5c68fb79f7-hcplg   1/1       Running   0          14m
expected-date-svc-5c68fb79f7-kjvf2   1/1       Running   0          14m
invoices-svc-8d6df59f7-klfvl         1/1       Running   0          14m
invoices-svc-8d6df59f7-n9s2c         1/1       Running   0          14m
invoices-svc-8d6df59f7-wb7ct         1/1       Running   0          14m
```
### Get your URI
Get your URI thru `ambassador`.  This will be unique every time (at least the port will).
```
minikube service ambassador --url
http://192.168.99.100:31495
```
### Test the API's
Test both the expected-date and invoice API's.
```
curl http://192.168.99.100:31495/expected-date/1 -H 'authorization: letmeinpleasekthxbye'
{"invoiceId":1,"expectedDate":"2018-09-02T04:58:52.445Z"}

curl http://192.168.99.100:31495/invoices/42 -H 'authorization: letmeinpleasekthxbye'
{"id":42,"ref":"INV-42","amount":4200,"balance":4190,"ccy":"GBP","expectedDate":"2018-09-05T04:58:32.557Z"}

```

### Teardown
Execute the `teardown.sh` script.
```
./teardown.sh
```
## Built With

* [Hackernoon](https://hackernoon.com/getting-started-with-microservices-and-kubernetes-76354312b556) - Getting started with microservices and Kubernetes

## Authors

* **mofo110** - *Initial work* - [mofo110](https://github.com/mofo110)