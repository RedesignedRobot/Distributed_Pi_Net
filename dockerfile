FROM python:3
LABEL maintainer="Amir Ayub, dev.amirayub@gmail.com"
RUN apt-get update
RUN apt-get install python-dev -y
ADD core.py /
RUN pip3 install Flask
RUN pip3 install getmac
RUN pip3 install pipdeptree
RUN pip3 install psutils
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "core.py" ]