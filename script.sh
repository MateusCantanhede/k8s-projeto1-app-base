#!/bin/bash
echo "criando as imagens.........."
docker build -t "mateuscantanhede/projeto-backend:1.0" ./backend
docker build -t "mateuscantanhede/projeto-database:1.0" ./database

echo "Realizando push das imagens.........."

docker push mateuscantanhede/projeto-backend:1.0
docker push mateuscantanhede/projeto-database:1.0

echo "Criando os serviços do kuster kubernetes......."

kubectl apply -f ./services.yml

echo "Criando os deployments do kuster kubernetes......"

kubectl apply -f ./deployment.yml

