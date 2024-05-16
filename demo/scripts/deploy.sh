# 가동중인 컨테이너 중지 및 삭제
sudo docker ps -a -q --filter "name=lunch" | grep -q . && sudo docker stop lunch && sudo docker rm lunch | true

# 이미지 삭제
sudo docker rmi wifros/my_docker:tagname | true

# 도커 이미지 pull
sudo docker pull wifros/my_docker:tagname

# 도커 run (포트 매핑 업데이트)
sudo docker run -d --name lunch -p 9090:9090 wifros/my_docker:tagname

# 사용하지 않는 불필요한 이미지 삭제
sudo docker image prune -f