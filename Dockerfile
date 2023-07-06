FROM ubuntu:22.04

RUN apt-get update && apt-get install apache2 -y 

COPY script.sh .

RUN bash script.sh

COPY start.sh .

CMD ["bash", "start.sh"]