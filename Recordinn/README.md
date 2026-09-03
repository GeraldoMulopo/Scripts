# Recordinn

Gravador de audio leve, gratuito e 100% offline.

Cores: preto (#0A0A0A) + verde (#22C55E)

Funcionalidades:
- Gravar audio do microfone
- Reproduzir audios
- Waveform ao vivo (scroll)
- Historico de gravacoes em ~/Musica
- Aba Definicoes (dispositivo, sample rate, canais, formato)
- Exportar WAV / MP3 (se ffmpeg)

## Dependencias

```bash
sudo apt install -y libportaudio2
pip3 install sounddevice numpy
```

## Instalacao

```bash
chmod +x recordinn
install -m 755 recordinn ~/.local/bin/
install -m 644 Recordinn.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

## Atalhos

- Ctrl+R - Gravar/Parar
- Ctrl+P - Tocar/Pausar
- Ctrl+S - Salvar
- Esc - Parar tudo
