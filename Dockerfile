FROM python:3.11.9

WORKDIR /root/Mikobot

COPY . .

RUN apt-get install -y ffmpeg python3-pip curl
RUN pip3 install --upgrade pip setuptools
FROM python:3.11-slim
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /bot

COPY . .


RUN pip install --no-cache-dir -r requirements.txt


CMD ["python", "bot.py"]
RUN pip install -U -r requirements.txt

CMD python3 -m Mikobot
