# Recordinn

Gravador de áudio leve, gratuito e 100% offline.

## Funcionalidades

- Gravar áudio do microfone
- Reproduzir gravações
- Visualizar forma de onda (waveform)
- Controle de volume de entrada
- Seleção de dispositivo de áudio
- Sample rate ajustável (22050 / 44100 / 48000 Hz)
- Mono ou Stereo
- Exportar WAV (nativo) ou MP3 (se ffmpeg instalado)
- Atalhos: Ctrl+R gravar • Ctrl+P tocar • Ctrl+S salvar • Esc parar

## Dependências

```bash
pip3 install sounddevice numpy
```

Para MP3 (opcional):
```bash
sudo apt install ffmpeg
```

## Instalação

```bash
chmod +x recordinn
install -m 755 recordinn ~/.local/bin/
install -m 644 Recordinn.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

## Cores

- Fundo: preto (#0A0A0A)
- Destaque: verde (#22C55E)
