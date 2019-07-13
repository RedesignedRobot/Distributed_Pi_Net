FROM python:3
LABEL maintainer="Amir Ayub, dev.amirayub@gmail.com"
ADD core.py /
RUN pip3 install Flask
RUN pip3 install getmac
RUN pip3 install pipdeptree
RUN pip3 install psutils
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "core.py" ]