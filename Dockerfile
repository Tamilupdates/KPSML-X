FROM nanthakps/kpsmlx:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pip3 install --upgrade setuptools
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]