FROM nanthakps/kpsmlx

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN pip3 install --no-cache-dir --upgrade setuptools pip uv
RUN uv pip install --system --no-cache pymediainfo pyaes

COPY requirements.txt .
RUN uv pip install --system --no-cache -r requirements.txt

COPY . .

ENTRYPOINT ["bash", "start.sh"]
