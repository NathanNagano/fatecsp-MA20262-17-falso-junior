# RELATÓRIO TÉCNICO DE CONCLUSÃO DA AVALIAÇÃO N1
**Centro Estadual de Educação Tecnológica Paula Souza — FATEC São Paulo**  
**Curso:** Tecnologia em Análise e Desenvolvimento de Sistemas • **Semestre:** 2º Semestre de 2026  
**Disciplina:** Microinformática Aplicada (ILP590) • **Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Composição da Equipe de Alunos:**
- **Nathan Campos Nagano** (RA: 0020482511012) — Líder do Projeto, Engenharia de Dados & DAX
- **Matheus Guides Rubim Fonseca** (RA: 0020482511028) — Líder Técnico, Automação & Garantia de Qualidade (QA)

---

## 1. Sumário Executivo da Entrega N1

Conforme especificado no plano de ensino e nas diretrizes formais do docente, a nota da **Avaliação N1** é composta pela integração de três etapas evolutivas fundamentadas no ecossistema analítico do Microsoft Excel:
1. **Etapa 1:** Preparação, Padronização e Auditoria de Dados com Excel Avançado
2. **Etapa 2:** Power Query Aplicado (Pipeline de Ingestão e Limpeza Automatizada em Linguagem M)
3. **Etapa 3:** Power Pivot & DAX (Modelagem Dimensional em Star Schema e Cálculo de KPIs Analíticos)

Para assegurar conformidade integral com a disciplina e garantir nota máxima, a entrega contempla **duas soluções completas**:
- **Solução Principal (Projeto Próprio da Equipe):** *"Painel de Decisão para Recrutamento de Entrada — Investigação do Fenômeno Falso Júnior no Mercado de TI"*, adaptado estritamente conforme a Proposta Técnica aprovada.
- **Solução Benchmark (Projeto-Modelo FATEC SP):** *"Painel de Performance da Rede CaféData Brasil"*, executado com estrita observância a todas as regras, fórmulas oficiais e gabaritos dos Guias Práticos.

---

## 2. Estrutura Oficial de Arquivos no Repositório

Todos os artefatos foram organizados na árvore de pastas padronizada exigida pela instituição:

```text
d:\Projeto Evolutivo de Dados\MA2026-projeto-pratico\MA2026-entrega-parcial\
├── 01-excel\
│   ├── CafeData_01_Excel.xlsx          # 4 abas, fórmulas PROCX/ARRUMAR, painel conciliado
│   └── Recrutamento_01_Excel.xlsx      # Base tratada de vagas de TI com auditoria de Falso Jr
├── 02-powerquery\
│   ├── CafeData_02_PowerQuery.xlsx     # fVendas, dProduto, dFilial, fMetas, Rejeitados
│   ├── Recrutamento_02_PowerQuery.xlsx # fVagas, dCargo, dTecnologia, dEmpresa, Rejeitados
│   └── scripts_m\
│       ├── fVendas.m                   # Código M documentado para fVendas
│       ├── fMetas.m                    # Código M para despivotar metas
│       └── fVagas.m                    # Pipeline M para ingestão de vagas
├── 03-powerpivot\
│   ├── CafeData_03_PowerPivot.xlsx     # Star Schema, dCalendario (181 dias), 13 medidas DAX
│   ├── Recrutamento_03_PowerPivot.xlsx # Star Schema, KPIs de inflação de requisitos em TI
│   └── dax\
│       ├── medidas_preliminares.dax    # Exportação UTF-8 das medidas do CaféData
│       └── medidas_recrutamento.dax    # Exportação UTF-8 das medidas de Recrutamento
├── docs\
│   └── modelo_relacional.md            # Especificação técnica do modelo relacional
└── README.md                           # Instruções de conferência e histórico
```

---

## 3. Detalhamento Técnico das 3 Etapas

```mermaid
flowchart TD
    subgraph ETAPA 1 ["Etapa 1: Excel Avançado"]
        A1["Aba Bruto: Cópia Fiel dos Dados"] --> A2["Aba Tratado: Tab_Vagas / Tab_Vendas"]
        A3["Aba Cadastros: Tabelas Mestres e De-Para"] --> A2
        A2 --> A4["Aba Auditoria: Registro e Painel Conciliado (Diferença = 0)"]
    end

    subgraph ETAPA 2 ["Etapa 2: Power Query (Linguagem M)"]
        B1["Ingestão de Arquivos em Lote (Folder.Files)"] --> B2["Tratamento de Tipos com Localidade pt-BR"]
        B2 --> B3["Desduplicação e Tratamento de Nulos"]
        B3 --> B4["fVagas / fVendas (Tabelas Fato)"]
        B3 --> B5["Consulta Rejeitados (Isolamento de Erros)"]
    end

    subgraph ETAPA 3 ["Etapa 3: Power Pivot & DAX"]
        C1["dCalendario (181 dias contínuos)"] --> C3["Modelo Star Schema (Relações 1:N)"]
        B4 --> C3
        C2["Dimensões (dCargo, dTecnologia, dEmpresa / dProduto, dFilial)"] --> C3
        C3 --> C4["Medidas DAX: Volume, Médias, Razões e Integridade"]
        C4 --> C5["Tabelas Dinâmicas de Validação e Diagnóstico de Negócio"]
    end

    ETAPA 1 --> ETAPA 2
    ETAPA 2 --> ETAPA 3
```

---

## 4. Resultados da Etapa 1: Excel Avançado

### 4.1 Regras de Implementação Respeitadas
- **Aba Bruto:** Cópia idêntica e intocada dos registros de origem, garantindo prova de origem e rastreabilidade jurídica dos dados.
- **Aba Tratado:** Criação da tabela estruturada contendo a coluna fixa `Linha_Origem` (valor numérico fixo, sem uso da volátil `=LIN()`), preservando a conexão física com a fonte.
- **Tratamento Funcional:**
  - `ARRUMAR` (`TRIM`): Eliminação de espaços excedentes e caracteres espúrios.
  - `PRI.MAIUSCULA` (`PROPER`): Padronização uniforme de capitalização para textos livres.
  - `PROCX` (`XLOOKUP`): Busca exata em cadastros oficiais (`Tab_Produtos`, `Tab_Cargos`, `Tab_Tecnologias`, `Tab_Empresas`).
  - Resolução de inconsistências sem sobreposição dos dados originais (criação de colunas tratadas e colunas de status).
- **Aba Auditoria e Painel de Conferência:** Mapeamento integral de todas as anomalias, garantindo que o total detectado seja idêntico ao total registrado (**Diferença = 0** e **Erros de Fórmula = 0**).

---

## 5. Resultados da Etapa 2: Power Query Aplicado

### 5.1 Pipeline ETL Automatizado em Linguagem M
- **Conexão Dinâmica:** Leitura paramétrica de arquivos sem caminhos absolutos rígidos.
- **Padronização de Esquema:** Tratamento das divergências de nomes e ordens de colunas entre fontes distintas antes da combinação (`Table.Combine`).
- **Limpeza e Higienização:**
  - Conversão de datas heterogêneas (`DD/MM/AAAA`, `AAAA-MM-DD`, `D-M-AAAA`) e tratamento com localidade `pt-BR`.
  - Tratamento de valores decimais formatados como texto contendo vírgula (defeito D6).
  - Isolamento estrito de registros impeditivos (datas inexistentes, produtos não cadastrados, campos vitais nulos) na tabela `Rejeitados`.
- **Aba Conferencia:** Reconciliação matemática comprovada ($Linhas_{Entrada} = Linhas_{Fato} + Linhas_{Rejeitadas}$).

---

## 6. Resultados da Etapa 3: Power Pivot & DAX

### 6.1 Modelo Dimensional Star Schema
- Criação da dimensão temporal contínua `dCalendario` (181 dias, de 01/01/2026 a 30/06/2026), com marcação oficial de Tabela de Datas.
- Relacionamentos unidirecionais de cardinalidade Muitos para Um ($N:1$) ligando as tabelas fato às suas respectivas dimensões.
- Inexistência de chaves órfãs ou chaves primárias duplicadas (`Conf PK Duplicada = 0`).

### 6.2 Comprovação Empírica da Pergunta Central (Projeto Recrutamento)
No projeto temático da equipe (*Recrutamento de Entrada em TI*), os indicadores calculados via DAX demonstraram matematicamente a hipótese levantada na Proposta Técnica:
- **Salário Médio Oferecido para Júnior:** R$ 5.736,36
- **Média de Tecnologias Exigidas para Júnior:** **4,54 tecnologias** (contra um teto saudável de 3 tecnologias)
- **Taxa de Requisitos Inflacionados ("Falso Júnior"):** **54,5%** das vagas destinadas a profissionais iniciantes exigem habilidades complexas equivalentes a profissionais Plenos e Sêniores, explicando o gargalo de contratação identificado pelo RH.

### 6.3 Gabarito Oficial do CaféData (Validação de Conformidade)
- **Faturamento Bruto:** R$ 212,00 (Gabarito: 212,00 | Status: OK)
- **Faturamento Líquido:** R$ 210,00 (Gabarito: 210,00 | Status: OK)
- **Qtd de Cupons:** 13 (Gabarito: 13 | Status: OK)
- **Ticket Médio:** R$ 16,15 (Gabarito: 16,15 | Status: OK)
- **Custo Total:** R$ 45,90 (Gabarito: 45,90 | Status: OK)
- **Margem Bruta:** 78,1% (Gabarito: 78,1% | Status: OK)
- **Bebidas Frias:** R$ 7,50 (5,1% do mix)

---

## 7. Checklist de Validação Final da N1

| Critério Avaliado | Exigência da FATEC SP | Situação |
|---|---|:---:|
| **Estrutura de Pastas** | `01-excel`, `02-powerquery`, `03-powerpivot`, `docs` | ✅ Conforme |
| **Preservação de Dados** | Aba `Bruto` intacta sem fórmulas voláteis | ✅ Conforme |
| **Auditoria e Rastreabilidade** | Painel de conferência com Diferença = 0 | ✅ Conforme |
| **Pipeline Power Query** | Código M automatizado e consulta Rejeitados | ✅ Conforme |
| **Modelagem Power Pivot** | Star Schema, `dCalendario` contínua e medidas DAX | ✅ Conforme |
| **Alinhamento com Proposta** | Tema de Recrutamento em TI com KPIs comprovados | ✅ Conforme |
| **Arquivos de Script** | Códigos `.m` e `.dax` exportados em pastas dedicadas | ✅ Conforme |
