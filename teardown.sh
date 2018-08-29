#!/bin/bash
kubectl delete service auth-svc
kubectl delete deployment auth-svc

kubectl delete service invoices-svc
kubectl delete deployment invoices-svc

kubectl delete service expected-date-svc
kubectl delete deployment expected-date-svc

kubectl delete service ambassador
kubectl delete service ambassador-admin
kubectl delete deployment ambassador

docker kill $(docker ps -q)
docker rmi $(docker images -a -q)

minikube stop
eval $(minikube docker-env -u)
minikube delete