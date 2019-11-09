docker build -t saikumarch7548/multi-client:latest -t saikumarch7548/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t saikumarch7548/multi-server:latest -t saikumarch7548/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t saikumarch7548/multi-worker:latest -t saikumarch7548/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push saikumarch7548/multi-client:latest
docker push saikumarch7548/multi-server:latest
docker push saikumarch7548/multi-worker:latest
docker push saikumarch7548/multi-client:$SHA
docker push saikumarch7548/multi-server:$SHA
docker push saikumarch7548/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=saikumarch7548/multi-server:$SHA
kubectl set image deployments/client-deployment client=saikumarch7548/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=saikumarch7548/multi-worker:$SHA
