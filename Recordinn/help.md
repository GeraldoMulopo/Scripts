# Recordinn

Gravador de audio leve, gratuito e 100% offline.

## Funcionalidades

- Gravar audio do microfone
- Reproduzir audios
- Waveform ao vivo (scroll em tempo real)
- Historico de gravacoes em ~/Musica
- Aba Definicoes: dispositivo, sample rate, canais, formato, guardar em
- Exportar WAV (nativo) ou MP3 (se ffmpeg instalado)
- Atalhos: Ctrl+R gravar, Ctrl+P tocar, Ctrl+S salvar, Esc parar

## Dependencias

```bash
sudo apt install -y libportaudio2
pip3 install sounddevice numpy
```

Para MP3 (opcional):
```bash
sudo apt install ffmpeg
```

## Instalacao

```bash
chmod +x recordinn
install -m 755 recordinn ~/.local/bin/
install -m 644 Recordinn.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

## Cores

- Fundo: preto (#0A0A0A)
- Destaque: verde (#22C55E)
