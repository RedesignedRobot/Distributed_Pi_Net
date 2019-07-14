#FROM python:3
#LABEL maintainer="Amir Ayub, dev.amirayub@gmail.com"
#RUN apt-get update
#RUN apt-get install python-dev -y
#RUN apt-get install apt-utils -y
#RUN pip3 install Flask
#RUN pip3 install getmac
#RUN pip3 install pipdeptree
#ADD core.py /d
#EXPOSE 5000
#ENTRYPOINT [ "python3" ]
#CMD [ "core.py" ]

FROM ubuntu:latest
LABEL maintainer="Amir Ayub, dev.amirayub@gmail.com"
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN apt-get install python3 -y
RUN apt-get install python3-dev -y
RUN apt-get install pip3 -y
RUN pip3 install Flask
RUN pip3 install getmac
RUN pip3 install pipdeptree
EXPOSE 5000
COPY . /app
WORKDIR /app
ENTRYPOINT [ "python3" ]
CMD [ "./core.py" ]