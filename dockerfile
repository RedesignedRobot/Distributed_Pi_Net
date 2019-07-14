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
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y
RUN apt-get install python3 -y
RUN apt-get install python3-dev -y
RUN apt-get install python3-pip -y
RUN pip3 install Flask
RUN pip3 install getmac
RUN pip3 install pipdeptree
RUN apt-get update
RUN apt-get upgrade -y
EXPOSE 5000
COPY . /app
WORKDIR /app
ENTRYPOINT [ "python3" ]
CMD [ "./core.py" ]
RUN BUILD SUCESSFUL!
RUN echo Start the server by running:
RUN echo docker run -d -p 5000:5000 amirayub/pi-net
RUN echo api endpoint at: http://localhost:5000/pi
RUN echo You can pass the len param to specify number of decimal places.
RUN echo Example: http://localhost:5000/pi?len=1000