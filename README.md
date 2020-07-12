# ft_server  
(2020.07.12) 100% SUCCESS

docker 명령어
----------------------
**docker 이미지 빌드 명령어**  
     docker build -t ft_server .  
**docker 실행**  
    docker run -it -p 80:80 -p 443:443 --name server ft_server  
**docker 이미지 확인**  
    docker images  
**컨테이너 확인**  
    docker ps : 현재 실행중인 컨테이너 확인  
    docker ps -a : 모든 컨테이너 확인  
**삭제**  
    docker rm server : 컨테이너 삭제  
    docker rmi ft_server : 이미지 삭제  
**컨테이너 시작 및 실행**  
    docker start server  
    docker exec-it server /bin/bash  


서버 명령어
--------------------
**nginx / php7.3-fpm / mysql 시작**  
    service nginx start  
    service php7.3-fpm start  
    service mysql start  
**재시작**  
    service nginx restart  

ssl protocol
---------------------


autoindex
----------------------

redirection
----------------------

