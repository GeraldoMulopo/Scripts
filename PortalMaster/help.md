# PortalMaster

Gerador de QR Code gratuito, sem contas, sem pagamentos e sem internet — tudo local.

## Porquê este script?

Os geradores de QR Code online pediam conta, tinham limites e alguns até eram pagos.
Então criei o **PortalMaster**: um gerador totalmente grátis que funciona 100% offline.

## Funcionalidades

- Conteúdo livre: texto ou URL
- Formatos de saída: PNG, JPG, BMP e ICO
- Tamanho em px (exato) ou escala de módulos
- Margem (quiet zone) ajustável
- Nível de correção de erro: L, M, Q, H
- Cores personalizáveis (QR e fundo) com seletor de cor
- Fundo transparente (PNG)
- Logo no centro (recorte circular com fundo branco)
- Preview ao vivo em janela Tk
- Histórico de gerações (`~/.local/share/portalmaster/historia.log`)
- Interface 100% em português

## Dependências

- `bash`
- `python3` com:
  - `qrcode`
  - `Pillow` (PIL)
  - `tkinter`

Em Ubuntu/Debian:

```bash
sudo apt install python3-qrcode python3-pil python3-tk
```

## Instalação

```bash
install -m 755 portalmaster ~/.local/bin/portalmaster
install -m 644 PortalMaster.desktop ~/.local/share/applications/
update-desktop-database ~/.local/share/applications
```

> **Nota:** edita o caminho `Exec=` no `PortalMaster.desktop`
> (e `Icon=portalmaster`, se não usares o ícone) para refletir o teu sistema.

Para o ícone aparecer no menu, copia um PNG 512x512 para
`~/.local/share/icons/hicolor/512x512/apps/portalmaster.png`
(e opcionalmente `gtk-update-icon-cache ~/.local/share/icons/hicolor -f`).

## Uso

Depois de instalado, executa `portalmaster` no terminal
ou procura **PortalMaster** no menu de aplicações.

1. Escreve o conteúdo (texto ou URL)
2. Ajusta formato, tamanho, cores e opções (o preview atualiza ao vivo)
3. Carrega em **Salvar**
4. O histórico fica em `~/.local/share/portalmaster/historia.log`

## Estrutura do ficheiro

- `portalmaster` — script bash que lança a GUI Tk (Python embutido)
- `PortalMaster.desktop` — atalho para o menu de aplicações
- `help.md` — este ficheiro

## Licença

Uso livre. Criado para nunca mais precisar de um gerador online.
