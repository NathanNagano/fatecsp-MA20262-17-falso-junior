# MA2026 — Entrega Parcial N1 (Etapas 1, 2 e 3)
**FATEC São Paulo — Curso de Tecnologia em Análise e Desenvolvimento de Sistemas**  
**Disciplina:** Microinformática Aplicada (ILP590) • **Semestre:** 2º Semestre / 2026  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  

**Equipe:**
- **Nathan Campos Nagano** (RA: 0020482511012) — Líder do Projeto
- **Matheus Guides Rubim Fonseca** (RA: 0020482511028) — Líder Técnico / QA

---

## 📁 Estrutura de Diretórios Oficial

```text
MA2026-entrega-parcial/
├── 01-excel/
│   ├── CafeData_01_Excel.xlsx          # Etapa 1: Gabarito Oficial CaféData Brasil
│   └── Recrutamento_01_Excel.xlsx      # Etapa 1: Projeto Próprio (Falso Júnior)
├── 02-powerquery/
│   ├── CafeData_02_PowerQuery.xlsx     # Etapa 2: Gabarito Oficial CaféData Brasil
│   ├── Recrutamento_02_PowerQuery.xlsx # Etapa 2: Projeto Próprio (Falso Júnior)
│   └── scripts_m/
│       ├── fVendas.m                   # Código M da consulta fVendas
│       ├── fMetas.m                    # Código M da consulta fMetas
│       └── fVagas.m                    # Código M da consulta fVagas
├── 03-powerpivot/
│   ├── CafeData_03_PowerPivot.xlsx     # Etapa 3: Gabarito Oficial CaféData Brasil
│   ├── Recrutamento_03_PowerPivot.xlsx # Etapa 3: Projeto Próprio (Falso Júnior)
│   └── dax/
│       ├── medidas_preliminares.dax    # Medidas DAX oficiais CaféData
│       └── medidas_recrutamento.dax    # Medidas DAX do Projeto de Recrutamento
├── docs/
│   └── modelo_relacional.md            # Documentação técnica de modelagem relacional
├── evidencias/                         # Evidências e validações
└── README.md                           # Guia de entrega e conferência
```

---

## 🎯 Síntese das Entregas por Etapa

### Etapa 1: Preparação, Padronização e Auditoria de Dados com Excel Avançado
- **Estrutura de 4 Abas:** `Bruto` (dados originais intactos para rastreabilidade), `Tratado` (tabela estruturada com fórmulas `PROCX`, `ARRUMAR`, `PRI.MAIUSCULA`, `LET`), `Cadastros` (tabelas mestres e listas de validação de dados) e `Auditoria` (registro de anomalias com severidade e plano de ação).
- **Painel de Conferência:** Totalmente balanceado com **Diferença = 0** e **Erros de Fórmula = 0**.

### Etapa 2: Power Query Aplicado (Pipeline ETL)
- Ingestão automatizada de arquivos em lote via linguagem M.
- Tratamento de tipos com localidade `pt-BR`, padronização de textos e desduplicação em duas passagens.
- Isolamento estrito de exceções na tabela `Rejeitados`.
- Painel de reconciliação com validação matemática exata ($Linhas_{Entrada} = fVendas + Rejeitados$).

### Etapa 3: Power Pivot & DAX (Modelagem Dimensional)
- Modelagem Star Schema com integridade relacional 1:N com direção única.
- Dimensão temporal `dCalendario` contínua (181 dias, de 01/01/2026 a 30/06/2026).
- Implementação de todas as medidas DAX exigidas e validação cruzada via Tabelas Dinâmicas.
- No projeto temático da equipe, comprovação matemática da hipótese de **54,5% de vagas com requisitos inflacionados ("Falso Júnior")**.
