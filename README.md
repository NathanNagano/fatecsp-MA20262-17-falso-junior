# Painel de Decisão para Recrutamento de Entrada (O Fenômeno do "Falso Júnior")

![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-blue)
![Instituição](https://img.shields.io/badge/Instituição-FATEC%20SP-red)
![Disciplina](https://img.shields.io/badge/Disciplina-Microinformática%20Aplicada-orange)
![Semestre](https://img.shields.io/badge/Semestre-2%2F2026-green)
![Equipe](https://img.shields.io/badge/Equipe-17-purple)

Repositório oficial do **Projeto Evolutivo de Microinformática Aplicada (ILP590)** da Faculdade de Tecnologia de São Paulo (FATEC SP), sob orientação do **Prof. Veríssimo**.

---

## 🏛️ Contexto Institucional e Equipe

- **Instituição:** Centro Paula Souza — Faculdade de Tecnologia de São Paulo (FATEC SP)
- **Curso:** Tecnologia em Análise e Desenvolvimento de Sistemas (ADS)
- **Disciplina:** Microinformática Aplicada (ILP590)
- **Docente:** Prof. Veríssimo
- **Semestre Letivo:** 2º Semestre de 2026
- **Equipe:** Equipe 17

### 👥 Composição da Equipe

| RA | Aluno | Papel / Função Principal |
| :--- | :--- | :--- |
| **0020482511012** | **Nathan Campos Nagano** (Líder) | Gerente do Projeto, Eng. de Dados / Excel, e Modelagem Power Query / DAX |
| **0020482511028** | **Matheus Guides Rubim Fonseca** (Líder) | Automação VBA & APIs, Banco de Dados SQL / Power BI, e QA (Garantia de Qualidade) |

---

## 🎯 Tema e Problema de Negócio

- **Tema Selecionado:** Mercado de Trabalho em Tecnologia
- **Nome do Projeto:** Painel de Decisão para Recrutamento de Entrada
- **Público-Alvo / Entidade Analisada:** Departamentos de Recursos Humanos (RH) e consultorias de recrutamento em TI

### Contextualização e Problema Central
O mercado de tecnologia enfrenta um gargalo crítico na contratação de talentos de nível inicial. Criou-se uma barreira de entrada desproporcional, na qual empresas publicam vagas rotuladas como "Júnior" ou "Estágio", exigindo proficiência em múltiplas tecnologias complexas e bagagem prática comparável à de profissionais de nível Pleno ou Sênior. Esse fenômeno — popularmente chamado de **"Falso Júnior"** — provoca vagas ociosas por longos períodos, desestimula novos talentos viáveis, distorce expectativas salariais e eleva substancialmente os custos operacionais de recrutamento.

### ❓ Pergunta Central do Projeto
> *Qual é a discrepância estrutural entre a quantidade e a complexidade de tecnologias exigidas versus as faixas salariais efetivamente oferecidas para vagas de entrada (Júnior e Estágio) no mercado de TI, e como o RH pode readequar essas exigências para acelerar o preenchimento das vagas?*

---

## 🔄 Arquitetura e Pipeline Contínuo de Dados

A solução percorre rigorosamente o pipeline de dados da disciplina, garantindo a integridade e rastreabilidade da informação em cada transição tecnológica:

```
[ Dado Bruto ]
       │
       ▼
[ Excel Avançado ] (Padronização, PROCX, Auditoria e Regras de Negócio)
       │
       ▼
[ Power Query ] (ETL, Limpeza de Strings e Consultas em Linguagem M)
       │
       ▼
[ Power Pivot / DAX ] (Modelagem Star Schema e KPIs Analíticos)
       │
       ▼
[ Automação VBA ] (Macros personalizadas para relatórios operacionais)
       │
       ▼
[ Banco de Dados SQL ] (Persistência, DDL e Consultas Analíticas DML)
       │
       ▼
[ Consumo de APIs REST ] (Enriquecimento: Cotação de Moedas AwesomeAPI + Localidades IBGE)
       │
       ▼
[ Dashboard Power BI ] (Painel Gerencial Interativo de Apoio à Decisão)
```

---

## 🗄️ Fontes de Dados e Modelagem Dimensional

### Fontes de Dados
1. **Dataset Principal:** Planilha bruta simulada (`.xlsx`) com registros históricos de listagens de vagas de TI (cargos, modalidades, habilidades requeridas e salários propostos).
2. **AwesomeAPI (Cotações de Moedas):** API REST pública para conversão cambial (USD/EUR para BRL), equalizando a comparação de vagas remotas internacionais com as oportunidades nacionais.
3. **API de Localidades do IBGE (Secundária):** API para mapeamento geográfico por município/estado, cruzando impacto regional e modalidades (remoto, híbrido, presencial).

### Modelagem *Star Schema* (Esquema Estrela)
- **Tabela Fato:**
  - `Fato_Vagas`: Registros granulares de anúncios de vagas, salários ofertados, data de abertura e formato de contratação.
- **Tabelas Dimensão:**
  - `Dim_Cargo`: Níveis de senioridade (Estágio, Júnior, Pleno, Sênior) e nomenclaturas padronizadas.
  - `Dim_Tecnologia`: Catálogo de hard skills exigidas.
  - `Dim_Empresa`: Porte, setor e segmento da empresa contratante.
  - `Dim_Calendario`: Tabela de datas contínua para filtros e tendências cronológicas.

---

## 📂 Estrutura Padrão de Diretórios (FATEC SP)

O repositório segue rigorosamente a estrutura padronizada no item **4.1 da Proposta Técnica**:

```text
MA2026-projeto-pratico/
├── MA2026-entrega-parcial/
│   ├── 01-excel/                 # Planilha limpa, tratada e auditada com fórmulas avançadas
│   ├── 02-powerquery/            # Consultas e transformações ETL em Linguagem M
│   ├── 03-powerpivot/            # Modelo Star Schema e criação de medidas analíticas DAX
│   └── 04-documentacao/          # Proposta Técnica oficial e Relatório Parcial (Fase 1)
└── MA2026-entrega-final/
    ├── 01-vba/                   # Rotinas e automação operacional com macros (.bas / .xlsm)
    ├── 02-bancodedados-sql/      # Scripts relacionais (DDL estrutural e DML analítico)
    ├── 03-api-web/               # Conexões, scripts e payloads de consumo das APIs REST
    └── 04-powerbi-dashboard/     # Dashboard executivo interativo (.pbix) e relatório final
```

---

## 📅 Cronograma de Entregas e Marcos de Validação

| Etapa | Foco Técnico & Ferramentas | Entregável Principal | Pasta de Destino | Prazo |
| :---: | :--- | :--- | :--- | :---: |
| **Etapa 1** | Excel Avançado, PROCX, Auditoria & Power Query | Planilha tratada e auditada sem erros de fórmulas | [`01-excel`](MA2026-projeto-pratico/MA2026-entrega-parcial/01-excel/) e [`02-powerquery`](MA2026-projeto-pratico/MA2026-entrega-parcial/02-powerquery/) | Aula 5 |
| **Etapa 2** | Power Pivot (*Star Schema*) & DAX Inicial | Modelo dimensional e primeiras medidas analíticas | [`03-powerpivot`](MA2026-projeto-pratico/MA2026-entrega-parcial/03-powerpivot/) | Aula 7 |
| **Parcial 1** | **Defesa Parcial 1 e Relatório Parcial** | **Apresentação Oral (10-15 min) + Repositório Congelado** | [`04-documentacao`](MA2026-projeto-pratico/MA2026-entrega-parcial/04-documentacao/) | **Aula 8** |
| **Etapa 3** | Automação VBA com Macros (`.bas`) | Código VBA estruturado para relatórios operacionais | [`01-vba`](MA2026-projeto-pratico/MA2026-entrega-final/01-vba/) | Aula 11 |
| **Etapa 4** | Modelagem BD (DDL) & Consultas SQL (DML) | `Script.sql` com estrutura de tabelas e queries analíticas | [`02-bancodedados-sql`](MA2026-projeto-pratico/MA2026-entrega-final/02-bancodedados-sql/) | Aula 13 |
| **Etapa 5** | Consumo de API REST & Enriquecimento | Scripts e conexões documentadas (Câmbio / IBGE) | [`03-api-web`](MA2026-projeto-pratico/MA2026-entrega-final/03-api-web/) | Aula 15 |
| **Checkpoint** | Marco de Validação Técnica | Feedback do docente sobre scripts e integrações | — | Aula 16 |
| **Etapa 6** | Dashboard Power BI (`.pbix`) & Relatório | Painel interativo com filtros e storytelling visual | [`04-powerbi-dashboard`](MA2026-projeto-pratico/MA2026-entrega-final/04-powerbi-dashboard/) | Aula 18 |
| **Final** | **Entrega Final e Demonstração ao Vivo** | **Defesa Completa das 4 ferramentas ao vivo** | Repositório Completo | **Aula 20** |
