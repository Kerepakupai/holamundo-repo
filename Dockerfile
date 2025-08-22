# Usa una imagen ligera oficial de Python.
FROM python:3.13-slim

# Copia el código local a la imagen del contenedor.
WORKDIR /app
COPY main.py .
COPY requirements.txt .

# Instala las dependencias en este contenedor.
RUN pip install -r requirements.txt

# El servicio debe escuchar la variable de entorno $PORT
ENV PORT 8080

# Ejecuta el servicio web al iniciar el contenedor.
CMD exec gunicorn --bind 0.0.0.0:$PORT --workers 1 --threads 8 --timeout 0 main:app