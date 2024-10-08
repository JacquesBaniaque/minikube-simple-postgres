Simple way to start and get basic interaction with Postgres instance on Minikube.
It assumes Minikube is installed.

Scripts
- provision.sh - starts minikube and provisions Postgres instance with all required K8s resources
- teardown.sh - starts minikube and deletes all K8s resources provisioned by provision.sh
- dashboard.sh - starts K8s dashboard
- postgres-expose.sh - exposes Postgres connection outside of K8s cluster, allows connecting e.g. from IDE
- postgres-psql.sh - executes psql command on Postgres


yaml files based on https://www.digitalocean.com/community/tutorials/how-to-deploy-postgres-to-kubernetes-cluster