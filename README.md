ft_server  
======================
(2020.07.12) 100% SUCCESS

과제 체크 리스트  
=====================  
ssl 프로토콜
---------------------
![image](https://user-images.githubusercontent.com/50227394/87241479-968cc800-c45e-11ea-9f67-76dc8f74f7ce.png)
https로 접속 시, 고급(advanced)에서 localhost로 이동하여 원하는 페이지 볼 수 있음

autoindex on
---------------------
![image](https://user-images.githubusercontent.com/50227394/87241395-b4a5f880-c45d-11ea-9df3-e2d01b770f47.png)  
autoindex 설정시, 인덱싱된 화면으로 보여짐. etc/nginx/site-available/default에서 설정 가능.  

redirection  
---------------------
http로 접속시 https로 이동  

wordpress mysql 테스트  
----------------------
![image](https://user-images.githubusercontent.com/50227394/87241572-7f9aa580-c45f-11ea-8b45-e32cb1d01a1e.png)  
wordpress에서 글 작성 시, 데이터베이스에 작성된 글 확인 가능.  


docker 명령어
======================
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
===================
**nginx / php7.3-fpm / mysql 시작**  

    service nginx start  
    service php7.3-fpm start  
    service mysql start  
    
**재시작**  

    service nginx restart  


srcs 코드 설명
====================
default.conf
-------------------

     etc/nginx/site-available/default로 복사해서 사용.  
     **redirection 설정**  
     ![image](https://user-images.githubusercontent.com/50227394/87241651-34cd5d80-c460-11ea-901f-545fa183f360.png)  
     
     **ssl 설정**  
     ![image](https://user-images.githubusercontent.com/50227394/87241673-6e05cd80-c460-11ea-8467-fadf751e2000.png)  
     
     **autoindex 설정**  
     ![image](https://user-images.githubusercontent.com/50227394/87241684-8d9cf600-c460-11ea-9fcf-8e4cdf653ec7.png)  
     autoindex on : index.nginx-debian.html 삭제
     autoindex off : index.nginx-debian.html 있어야함.
     
init.sh  
-----------------------

     도커 컨테이너 실행시 shell 사용 가능하도록 bash 사용  

phpmyadmin.inc.php  
----------------------

     var/www/html/phpMyAdmin/config.inc.php에 복사해서 사용.  
     phpmyadmin 설정 코드  
     phpMyAdmin은 웹페이지에서 곧바로 자신의 리눅스 서버에있는 DB(데이터베이스) 내용을 보고, 편집, DB생성등 DB에 관한 모든걸 할 수 있는 웹애플리케이션입니다.  
 
wordpress_set.sql  
---------------------

     컨테이너에 복사 후, mysql -u root mysql < /var/wordpress_set.sql 로 실행  
     mysql 데이터베이스 생성 코드. 아이디 : wpuser / 비밀번호 : jinkim  
 
 wp-config.php  
 -----------------
     
     var/www/html/WordPress/wp-config.php에 복사
     wordpress와 데이터 베이스 연동 코드  

