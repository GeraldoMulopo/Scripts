# Script's

Coleção de scripts independentes que criei para uso pessoal.
Cada script está numa pasta própria, com os ficheiros necessários
e um `help.md` (descrição + instruções).

## Scripts

### PortalMaster

Gerador de QR Code **totalmente gratuito, offline e sem contas**.

Criei-o porque os geradores de QR Code online pediam conta,
tinham limites diários e alguns até eram pagos. Então fiz o meu:
funciona 100% local, com GUI (Tk), sem depender de nenhum serviço.

Características:

- Conteúdo livre: texto ou URL
- Saída em PNG, JPG, BMP e ICO
- Tamanho exato em px, escala e margem ajustáveis
- Correção de erro L/M/Q/H
- Cores personalizadas (QR e fundo)
- Fundo transparente (PNG)
- Logo no centro (recorte circular)
- Preview ao vivo + histórico de gerações
- Interface em português

```bash
cd PortalMaster
bash portalmaster
```

Mais detalhes em [`PortalMaster/help.md`](PortalMaster/help.md).

## Estrutura

```
Script's/
├── README.md
└── PortalMaster/
    ├── portalmaster          # script principal
    ├── PortalMaster.desktop  # atalho de aplicação (Linux)
    └── help.md               # descrição e manual
```

Novos scripts serão adicionados na mesma estrutura:

```
NomeDoScript/
├── ficheiro_do_script
├── extras (se existirem)
└── help.md
```

## Licença

Uso livre, feito para mim — usa e adapta à vontade.
