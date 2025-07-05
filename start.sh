#!/bin/bash
# start.sh - Script de inicio para Fish Speech API

echo "🐟 Iniciando Fish Speech API Server..."

# Verificar si el modelo ya está descargado
if [ ! -f "/app/models/fish-speech-1.5/config.json" ]; then
    echo "📥 Descargando modelo Fish Speech 1.5..."
    huggingface-cli download fishaudio/fish-speech-1.5 --local-dir /app/models/fish-speech-1.5/
    echo "✅ Modelo descargado correctamente"
else
    echo "✅ Modelo ya existe, omitiendo descarga"
fi

echo "🚀 Iniciando servidor API en puerto 8000..."
python main.py --host 0.0.0.0 --port 8000
