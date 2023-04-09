# imagem base
FROM python:3.8-slim-buster

# seta as variáveis de ambiente
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# cria e seta o diretório de trabalho
RUN mkdir /app
WORKDIR /app

# adiciona e instala as dependências
RUN pip install --upgrade setuptools
RUN pip install --upgrade pip

COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r /app/requirements.txt

# copia o código para o container
COPY . /app/

# executa o Gunicorn
CMD ["gunicorn", "--workers", "2", "app.wsgi", "-b", "0.0.0.0:8001", "--log-level", "debug"]
