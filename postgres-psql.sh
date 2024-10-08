#!/bin/bash

POSTGRES_POD=$(kubectl get pod -l app=postgres -o jsonpath="{.items[0].metadata.name}")
kubectl exec -it ${POSTGRES_POD} -- psql -h localhost -U app_user --password -p 5432 my_db
#kubectl exec -it ${POSTGRES_POD} -- psql -h localhost -U app_user --password -p 5432 -l