#!/bin/bash
minikube start
eval $(minikube docker-env)

docker build -t expected_date_svc:v1 ./expected_date_svc/
docker build -t invoices_svc:v2 ./invoices_svc/
docker build -t auth_svc:v1 ./auth_svc/

kubectl apply -f ./kube/ambassador.yaml
kubectl apply -f ./kube/expected_date_svc.yaml
kubectl apply -f ./kube/invoices_svc.yaml
kubectl apply -f ./kube/auth_svc.yaml
