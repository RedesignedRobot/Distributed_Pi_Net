FROM python:3
ADD core.py /
RUN pip3 install Flask
RUN pip3 install getmac
RUN pip3 install pipdeptree
RUN pip3 install psutils
CMD [ "python", "./core.py" ]