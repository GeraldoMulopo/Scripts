# PortalMaster

Gerador de QR Code gratuito, sem contas, sem pagamentos e sem internet — tudo local.

## Porquê este script?

Os geradores de QR Code online pediam conta, tinham limites e alguns até eram pagos.
Então criei o **PortalMaster**: um gerador totalmente grátis que funciona 100% offline.

## Funcionalidades

- Conteúdo livre: texto ou URL
- Formatos de saída: PNG, JPG, BMP e ICO
- Tamanho em px (exato) ou escala de módulos
- Margem (quiet zone) ajustável com valor visível
- Nível de correção de erro: L, M, Q, H (dica: usa H com logo)
- Cores personalizáveis (QR e fundo) com seletor de cor
- Fundo transparente (PNG)
- Logo no centro (recorte circular com fundo branco)
- Preview ao vivo, redimensionável, com barra de estado (tamanho real)
- Histórico de gerações: janela própria dentro da app
  (ficheiro: `~/.local/share/portalmaster/historia.log`)
- Atalhos: **Ctrl+S** salvar • **Ctrl+N** novo • **Esc** sair
- Botão **Novo** para gerar outro QR rapidamente
- Proteções: pergunta antes de sobrescrever um ficheiro existente
  e mostra erro amigável se o conteúdo for demasiado longo
- Tooltips explicativos em cada opção
- Interface 100% em português, com tema visual e ícone próprios

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
3. Carrega em **Salvar** (ou **Ctrl+S**) — se o ficheiro já existir, pergunta antes de substituir
4. Depois de salvar, podes escolher **abrir a pasta** com o QR
5. Para outro QR, usa **Novo** (ou **Ctrl+N**)
6. O histórico abre com o botão **Histórico** (ou em `~/.local/share/portalmaster/historia.log`)

## Estrutura do ficheiro

- `portalmaster` — script bash que lança a GUI Tk (Python embutido)
- `PortalMaster.desktop` — atalho para o menu de aplicações
- `help.md` — este ficheiro

## Licença

Uso livre. Criado para nunca mais precisar de um gerador online.
