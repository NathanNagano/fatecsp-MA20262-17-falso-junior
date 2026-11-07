# MA2026 — Entrega Parcial N1 (Etapas 1, 2 e 3)
**FATEC São Paulo — Curso de Tecnologia em Análise e Desenvolvimento de Sistemas**  
**Disciplina:** Microinformática Aplicada (ILP590) • **Semestre:** 2º Semestre / 2026  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  

**Equipe 17:**
- **Nathan Campos Nagano** (RA: 0020482511012) — Líder do Projeto
- **Matheus Guides Rubim Fonseca** (RA: 0020482511028) — Líder Técnico / QA

---

## 📌 Estrutura de Diretórios da Entrega Parcial

```text
MA2026-entrega-parcial/
├── 01-excel/
│   ├── Recrutamento_01_Excel.xlsx          # Etapa 1: Planilha tratada e auditada com fórmulas avançadas
│   └── README.md                           # Documentação das 4 abas, fórmulas e conciliação
├── 02-powerquery/
│   ├── Recrutamento_02_PowerQuery.xlsx     # Etapa 2: Consultas ETL fVagas, dimensões, Rejeitados
│   ├── scripts_m/
│   │   ├── fVagas.m                        # Código M da consulta fVagas (.m)
│   │   └── fVagas.pq                       # Código M da consulta fVagas (.pq)
│   └── README.md                           # Documentação do pipeline ETL e conciliação
├── 03-powerpivot/
│   ├── Recrutamento_03_PowerPivot.xlsx     # Etapa 3: Star Schema, dCalendario e KPIs analíticos
│   ├── dax/
│   │   └── medidas_recrutamento.dax        # Código DAX das medidas analíticas
│   ├── scripts_m/
│   │   ├── fVagas.m
│   │   └── fVagas.pq
│   └── README.md                           # Relações 1:N, Star Schema e validação
├── 04-documentacao/
│   ├── Proposta_Tecnica_Equipe17_Falso_Junior.pdf  # Proposta técnica aprovada
│   ├── RELATORIO_TECNICO_N1.md             # Relatório técnico executivo de conclusão da N1
│   ├── modelo_relacional.md                # Especificação formal do Star Schema
│   └── README.md                           # Sumário dos documentos
└── README.md                               # Guia de entrega e conferência
```

---

## 🚀 Síntese das Entregas por Etapa

### Etapa 1: Preparação, Padronização e Auditoria de Dados com Excel Avançado
- **Estrutura de 4 Abas:** `Bruto` (dados originais intactos com os 10 defeitos controlados D1 a D10 para rastreabilidade), `Tratado` (tabela estruturada `Tab_Vagas_Tratadas` com 32 colunas utilizando fórmulas avançadas `ARRUMAR`, `PRI.MAIUSCULA`, `ÍNDICE/CORRESP`, `SE`, `DATA`, `HORA`, `TEXTO`, `E`), `Cadastros` (tabelas mestres e listas de validação) e `Auditoria` (registro de anomalias com severidade e plano de ação).
- **Painel de Conferência:** Totalmente balanceado com **Diferença = 0** e **Erros de Fórmula = 0**.

### Etapa 2: Power Query Aplicado (Pipeline ETL em Linguagem M)
- Ingestão automatizada e reprodutível via linguagem M.
- Tratamento de tipos com localidade `pt-BR`, padronização textual e desduplicação em duas passagens.
- Isolamento estrito de exceções na tabela `Rejeitados`.
- Painel de reconciliação com validação matemática exata ($Linhas_{Entrada} (20) = fVagas (11) + Rejeitados (9)$) — **Diferença = 0**.

### Etapa 3: Power Pivot & DAX (Modelagem Dimensional Star Schema)
- Modelagem Star Schema com integridade relacional 1:N com direção única ligando as dimensões à tabela fato `fVagas`.
- Dimensão temporal `dCalendario` contínua (181 dias, de 01/01/2026 a 30/06/2026).
- Implementação de todas as medidas DAX exigidas e validação cruzada via Tabelas Dinâmicas.
- Comprovação matemática da hipótese de **54,5% de vagas com requisitos inflacionados ("Falso Júnior")**.
