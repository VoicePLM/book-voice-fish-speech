# Dockerfile para Fish Speech API en Render
FROM python:3.12-slim

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    portaudio19-dev \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

# Clonar el repositorio de Fish Speech API
RUN git clone --recurse-submodules https://github.com/EvilFreelancer/docker-fish-speech-server.git .

# Instalar HuggingFace CLI
RUN pip install --no-cache-dir huggingface_hub

# Instalar dependencias Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Crear directorio para modelos
RUN mkdir -p models/fish-speech-1.5

# Script de inicialización
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Exponer puerto
EXPOSE 8000

# Comando de inicio
CMD ["/app/start.sh"]
