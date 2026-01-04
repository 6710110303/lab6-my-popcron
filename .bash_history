gcloud auth list
gcloud config list project
gcloud compute instances create gcelab2 --machine-type e2-
medium --zone asia-southeast1-b
gcloud compute instances create gcelab2 --machine-type e2-medium --zone asia-southeast1-b
gcloud compute instances create --help
[200~gcloud compute ssh gcelab2 --zone [ชื่อโซน]
gcloud compute ssh gcelab2 --zone asia-southeast1-b
gcloud auth list
gcloud config list project
gcloud compute instances get-serial-port-output instance-1
gcloud compute instances get-serial-port-output instance-303 --zone=asia-southeast1-b	
gcloud compute reset-windows-password instance303 --zone asia-southeast1-b --user admin
gcloud compute reset-windows-password instance-303 --zone asia-southeast1-b --user admin
gcloud auth list
gcloud config list project
gcloud config set compute/region asia-southeast1-b
gcloud config get-value compute/region
gcloud config get-value compute/zone
gcloud config set compute/zone asia-southeast1-b
gcloud config get-value compute/zone
gcloud config get-value project
gcloud compute project-info describe --project $(gcloud config getvalue project)
gcloud config get-value project
gcloud compute project-info describe --project $my-popcron
gcloud config get-value project
gcloud compute project-info describe --project $(gcloud config get-value project)
export PROJECT_ID=$(gcloud config get-value project)
export ZONE=$(gcloud config get-value compute/zone)
echo -e "PROJECT ID: $PROJECT_ID\nZONE: $ZONE"
gcloud compute instances create gcelab2 --machine-type e2-medium --zone $ZONE
gcloud -h
gcloud components list
gcloud compute instances list
gcloud compute instances list --filter="name=('gcelab2')"
gcloud compute firewall-rules list
gcloud compute firewall-rules list --filter="network='default'"
gcloud compute firewall-rules list --filter="NETWORK:'default' ANDALLOW:'icmp'"
gcloud compute firewall-rules list --filter="NETWORK:'default' AND ALLOW:'icmp'"
gcloud compute ssh gcelab2 --zone $ZONE
$ gcloud compute ssh gcelab2 --zone $ZONE
gcloud compute ssh gcelab2 --zone $ZONE
gcloud compute firewall-rules list
gcloud compute instances add-tags gcelab2 --tags http-server,https-server
gcloud compute firewall-rules create default-allow-http   --direction=INGRESS   --priority=1000   --network=default   --action=ALLOW   --rules=tcp:80   --source-ranges=0.0.0.0/0   --target-tags=http-server
gcloud compute firewall-rules list --filter=ALLOW:'80'
curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(35.198.204.233)')
curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(35.198.204.233')
curl http://$(gcloud compute instances list --filter=name:gcelab2 --format='value(EXTERNAL_IP)')
gcloud logging logs list
gcloud logging logs list --filter="compute"
gcloud logging read "resource.type=gce_instance" --limit 5
gcloud logging read "resource.type=gce_instance AND labels.instance_name='gcelab2'" --limit 5
gcloud logging read "resource.type=gce_instance" --limit 5
gcloud logging logs list --filter="compute"
gcloud logging read "resource.type=gce_instance AND labels.instance_name='gcelab2'" --limit 5
gcloud auth list
gcloud config list project
docker run hello-world
docker images
docker run hello-world
docker ps
docker ps -a
mkdir test && cd test
cat > Dockerfile <<EOF
# Use an official Node runtime as the parent image
FROM node:lts
# Set the working directory in the container to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app
# Make the container's port 80 available to the outside world
EXPOSE 80
# Run app.js using node when the container launches
CMD ["node", "app.js"]
EOF

cat > app.js <<EOF
const http = require('http');
const hostname = '0.0.0.0';
const port = 80;
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    res.end('Hello World\n');
});
server.listen(port, hostname, () => {
    console.log('Server running at http://%s:%s/', hostname, port);
});
process.on('SIGINT', function() {
    console.log('Caught interrupt signal and will exit');
    process.exit();
});
EOF

docker build -t node-app:0.1 .
docker images
curl http://localhost:4000
docker run -p 4000:80 --name my-app node-app:0.1
docker stop my-app && docker rm my-app
docker run -p 4000:80 --name my-app -d node-app:0.1
docker ps
docker logs <container_id>
docker logs <container_id>
docker logs 935049b19b57
cd test
nano app.js
docker build -t node-app:0.2 .
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps
curl http://localhost:8080
docker ps
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps
docker ps -a
docker rm my-app-2
docker ps -a
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps -a
log874
docker logs874
docker logs 874
nano app.js
docker ps -a
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker rm my-app-2
docker ps -a
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps -a
nano app.js
docker build -t node-app:0.2 .
docker rm my-app-2
docker ps -a
docker run -p 8080:80 --name my-app-2 -d node-app:0.2
docker ps
curl http://localhost:8080
curl http://localhost:4000
docker logs -f 6be
docker exec -it 6be  bash
docker inspect 6be
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' [container_id]
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 6be
gcloud auth configure-docker us-central1-docker.pkg.dev
export PROJECT_ID=$(gcloud config get-value project)
cd ~/test
docker build -t us-central1-docker.pkg.dev/$PROJECT_ID/my-repository/node-app:0.2 .
docker images
docker push us-central1-docker.pkg.dev/$PROJECT_ID/my-repository/node-app:0.2
docker stop $(docker ps -q)
docker rm $(docker ps -aq)
docker stop $(docker ps -q)
docker ps 
docker rm $(docker ps -aq)
docker images
docker rmi us-central1-docker.pkg.dev/$PROJECT_ID/my-repository/node-app:0.2
docker rmi node:lts
docker rmi -f $(docker images -aq)
docker images
docker pull us-central1-docker.pkg.dev/$PROJECT_ID/my-repository/node-app:0.2
docker run -p 4000:80 -d us-central1-docker.pkg.dev/$PROJECT_ID/my-repository/node-app:0.2
curl http://localhost:4000
mkdir dimage
cd dimage
nano Dockerfile
nano requirements.txt
nano app.py
sudo pip3 install flask
python3 app.py
docker build -t quickstart-image .
gcloud config list project
docker tag quickstart-image gcr.io/my-popcron/quickstart-image
gcloud auth configure-docker
docker push gcr.io/my-popcron/quickstart-image
gcloud auth configure-docker
docker pull gcr.io/my-popcron/quickstart-image
gcloud container images list
docker run -p 8080:8080 gcr.io/my-popcron/quickstart-image
gcloud auth list
gcloud config list project
gcloud pubsub topics create myTopic
gcloud pubsub topics create Test1
gcloud pubsub topics create Test2
gcloud pubsub topics list
gcloud pubsub topics delete Test1
gcloud pubsub topics delete Test2
gcloud pubsub topics list
gcloud pubsub subscriptions create --topic myTopic mySubscription
gcloud pubsub subscriptions create --topic myTopic Test1
gcloud pubsub topics list-subscriptions myTopic
gcloud pubsub subscriptions delete Test1
gcloud pubsub subscriptions delete Test2
gcloud pubsub topics list-subscriptions myTopic
gcloud pubsub subscriptions create --topic myTopic mySubscription
gcloud pubsub subscriptions create --topic myTopic Test1
gcloud pubsub subscriptions create --topic myTopic Test2
gcloud pubsub topics list-subscriptions myTopic
gcloud pubsub subscriptions delete Test1
gcloud pubsub subscriptions delete Test2
gcloud pubsub topics list-subscriptions myTopic
gcloud pubsub topics publish myTopic --message "Hello"
gcloud pubsub topics publish myTopic --message "Publisher's name is <YOUR
NAME>"
gcloud pubsub topics publish myTopic --message "Publisher likes to eat
<FOOD>"
gcloud pubsub topics publish myTopic --message "Publisher thinks Pub/Sub
is awesome"
gcloud pubsub subscriptions pull mySubscription --auto-ack
gcloud pubsub topics publish myTopic --message "Publisher is starting to
get the hang of Pub/Sub"
gcloud pubsub topics publish myTopic --message "Publisher wonders if all
messages will be pulled"
gcloud pubsub topics publish myTopic --message "Publisher will have to
test to find out"
gcloud pubsub subscriptions pull mySubscription --auto-ack --limit=3
gcloud pubsub subscriptions pull --auto-ack MySub
gcloud config set compute/region REGION
mkdir gcf_hello_world
cd gcf_hello_world
nano index.js
gcloud config list project
gsutil mb -p my-popcron gs://AM
gsutil mb -p [PROJECT_ID] gs://[BUCKET_NAME]
gsutil mb -p my-popcron gs://bucket-2025
gcloud functions deploy helloWorld     --stage-bucket [BUCKET_NAME]     --trigger-topic hello_world     --runtime nodejs20
gcloud functions describe helloWorld
DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld -
-data '{"data":"'$DATA'"}'
gcloud functions logs read helloWorld
DATA=$(printf 'Hello World!' | base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'
DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'
cd..
cd ..
)$ DATA=$(printf 'Hello World!'|base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'
DATA=$(printf 'Hello World!' | base64) && gcloud functions call helloWorld --data '{"data":"'$DATA'"}'
cd gcf_hello_world
gcloud functions describe helloWorld
gcloud functions deploy helloWorld  --stage-bucket bucket-2025  --trigger-topic hello_world  --runtime nodejs20
gcloud functions describe helloWorld
gcloud config set compute/region Region
gcloud config set compute/zone Zone
gcloud compute firewall-rules create www-firewall-network-lb     --target-tags network-lb-tag --allow tcp:80
gcloud compute instances list
gcloud config set compute/zone "ZONE"
export ZONE=$(gcloud config get compute/zone)
gcloud config set compute/region "REGION"
export REGION=$(gcloud config get compute/region)
gcc --version
unzip Lab6Files4C.zip
ls
nano hellomake.c
nano hellofunc.c
cd Lab6Files
ls
nano hellomake.c 
nano makefile1
cp makefile1 makefile
make
ls
make hellomak
make hellomake
ls
nano hellomake
cp makefile2 makefile
make
ls
make clean
ls
cp makefile3 makefile
make hellofunc.o
make hellomake.o
make makeal
make makeall
ls
make clean
cp makefile4 makefile
make hellofunc.o
make hellomake.o
make hellomake
ls
make clean
make cleanall
ls
minikube start
kubectl cluster-info
kubectl get nodes
kubectl get pods
kubectl describe <resource-name> <obj-name>
kubectl run myhello2 --image=gcr.io/google-samples/node-hello:1.0 --port=8080
kubectl get pods
kubectl delete pod myhello2
kubectl run myhello2 --image=gcr.io/google-samples/node-hello:1.0 --port=8080
kubectl get pods
kubectl describe pod myhello2
kubectl delete pod myhello2
kubectl run myhello2 --image=nginx --port=80
kubectl get pods
kubectl expose pod myhello2 --type=LoadBalancer --name=my-service2 --port=80
kubectl get service
kubectl port-forward service/my-service2 8080:80
kubectl delete service my-service2
kubectl delete pod myhello2
kubectl get pods
kubectl get service
minikube delete
gcloud container clusters get-credentials mylab-cluster-1 --region asia-east1 --project my-popcron
kubectl apply -f hello.yml
kubectl get deployments hello-world kubectl get replicasets
kubectl get deployments hello-world
kubectl describe deployments hello-world
kubectl scale --replicas=3 -f hello.yml
kubectl get pods
kubectl delete pod hello-world-679ff4f65d-fwrcv
kubectl get pods
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.1/deploy/static/provider/cloud/deploy.yaml
kubectl get pods -n ingress-nginx
kubectl get pods --namespace=ingress-nginx
kubectl apply -f 00-namespace.yml
kubectl get ns
kubectl apply -f 01-deployment.yml
kubectl get pod -n basic-k8s
kubectl apply -f 02-service.yml
kubectl get service -n basic-k8s
kubectl apply -f 03-ingress.yml
kubectl port-forward service/nginx -n basic-k8s 8080:80
kubectl port-forward service/web -n basic-k8s 8080:80
kubectl port-forward service/web -n basic-k8s 8081:8080
kubectl port-forward service/web -n basic-k8s 8080:8080
kubectl get ingress -n basic-k8s
curl -H "Host: web.localdev.me" http://34.80.89.152
gcloud container clusters delete mylab-cluster-1
ls
สห
ls
cd Lab6Files4Python
ls
pip install black
pip install pylint
pip install pytest
make install
nano makefilep
nano makefilep.txt
ls
make install
cd ..
rm -rf Lab6Files4Python
ls
cd Lab6Files
ls
cd..
ls
cd..
cd ..
ls
unzip Lab6Files4Python
ls
rm makefilep
rm  makefilep.txt
rm requirements.txt
rm testblack.py
rm testpytest.py
rm testlint.py
ls
rm -rf Lab6Files
rm Lab6Files4C.zip
ls
unzip Lab6Files4Python.zip -d Lab6Files
ls
cd Lab6Files
ls
mv Makefile.txt Makefile
mv makefile.txt Makefile
make -f makefilep.txt install
nano makefilep.txt
ls
nano makefilep.txt
make -f makefilep.txt install
nano makefilep.txt
make -f makefilep.txt install
ls
nano requirements.txt
export PATH=$PATH:/home/g6710110303/.local/bin
make -f makefilep.txt install
make -f makefilep.txt format
make -f makefilep.txt lint
make -f makefilep.txt test
ls
terraform
gcloud services enable cloudaicompanion.googleapis.com
touch instance.tf
สห
ls
terraform init
terraform plan
terraform apply
terraform show
terraform import google_compute_instance.default terraform
ls
cat instance.tf
nano instance.tf
gcloud auth list
gcloud config list project
terraform init
terraform plan
terraform apply
terraform show
terraform.tfstate
ls
terraform show
terraform apply
gcloud config get-value project
terraform init
terraform apply
terraform show
nano garbage.c
ls
nano garbage.c
gcc -g garbage.c -o garbage
ls
./garbage 10 5
./garbage 10 0
gdb ./garbage
ls
git config --global user.name 303
git config --global user.email 6710110303@psu.ac.th
git init
git remote add origin https://github.com/6710110303/lab6-my-popcron.git
git add .
git commit -m "Submit Lab 6"
git branch -M main
git push -u origin main
git rm -r --cached .terraform/
git rm -r --cached .cache/
cat <<EOF > .gitignore
.terraform/
.cache/
*.tfstate*
*.o
EOF

git add .
git commit -m "ลบไฟล์ขนาดใหญ่และเพิ่ม gitignore"
git push -u origin main
rm -rf .git
ls
git init
cat <<EOF > .gitignore
.terraform/
.cache/
*.tfstate*
bin/
EOF

git add .
git commit -m "Initialize Lab 6 without large files"
git remote add origin https://github.com/6710110303/lab6-my-popcron.git
git branch -M main
git push -u origin main -f
rm -rf .git
git init
cat <<EOF > .gitignore
.terraform/
.cache/
*.tfstate*
bin/
EOF

git add .
git commit -m "Initial commit - clean and small"
git remote add origin https://github.com/6710110303/lab6-my-popcron.git
git branch -M main
git push -u origin main --force
rm -rf .git
git init
cat <<EOF > .gitignore
.terraform/
.cache/
.kube/
.config/
*.tfstate*
bin/
EOF

