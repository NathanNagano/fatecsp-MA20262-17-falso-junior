# RELATÓRIO TÉCNICO DE CONCLUSÃO DA AVALIAÇÃO N1
**Centro Estadual de Educação Tecnológica Paula Souza — FATEC São Paulo**  
**Curso:** Tecnologia em Análise e Desenvolvimento de Sistemas • **Semestre:** 2º Semestre de 2026  
**Disciplina:** Microinformática Aplicada (ILP590) • **Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Composição da Equipe de Alunos (Equipe 17):**
- **Nathan Campos Nagano** (RA: 0020482511012) — Líder do Projeto, Engenharia de Dados & DAX
- **Matheus Guides Rubim Fonseca** (RA: 0020482511028) — Líder Técnico, Automação & Garantia de Qualidade (QA)

---

## 1. Sumário Executivo da Entrega N1

Conforme especificado no plano de ensino e nas diretrizes formais do docente, a nota da **Avaliação N1** é composta pela integração de três etapas evolutivas fundamentadas no ecossistema analítico do Microsoft Excel:
1. **Etapa 1:** Preparação, Padronização e Auditoria de Dados com Excel Avançado
2. **Etapa 2:** Power Query Aplicado (Pipeline de Ingestão e Limpeza Automatizada em Linguagem M)
3. **Etapa 3:** Power Pivot & DAX (Modelagem Dimensional em Star Schema e Cálculo de KPIs Analíticos)

Este relatório consolida a entrega integral do projeto próprio da equipe:  
👉 **"Painel de Decisão para Recrutamento de Entrada — Investigação do Fenômeno Falso Júnior no Mercado de TI"**, desenvolvido estritamente conforme a Proposta Técnica aprovada.

---

## 2. Estrutura Oficial de Arquivos no Repositório

Todos os artefatos foram organizados na árvore de pastas padronizada exigida pela instituição:

```text
MA2026-entrega-parcial/
├── 01-excel/
│   ├── Recrutamento_01_Excel.xlsx      # Base tratada de vagas de TI com auditoria de Falso Jr
│   └── README.md                       # Especificação das fórmulas e conciliação
├── 02-powerquery/
│   ├── Recrutamento_02_PowerQuery.xlsx # fVagas, dCargo, dTecnologia, dEmpresa, Rejeitados
│   ├── scripts_m/
│   │   ├── fVagas.m                    # Pipeline M para ingestão de vagas (.m)
│   │   └── fVagas.pq                   # Pipeline M para ingestão de vagas (.pq)
│   └── README.md                       # Documentação do pipeline ETL
├── 03-powerpivot/
│   ├── Recrutamento_03_PowerPivot.xlsx # Star Schema, KPIs de inflação de requisitos em TI
│   ├── dax/
│   │   └── medidas_recrutamento.dax    # Exportação UTF-8 das medidas de Recrutamento
│   ├── scripts_m/
│   │   ├── fVagas.m
│   │   └── fVagas.pq
│   └── README.md                       # Relações 1:N, Star Schema e validação
├── 04-documentacao/
│   ├── Proposta_Tecnica_Equipe17_Falso_Junior.pdf  # Proposta técnica aprovada
│   ├── RELATORIO_TECNICO_N1.md         # Relatório técnico executivo
│   ├── modelo_relacional.md            # Especificação técnica do modelo relacional
│   └── README.md                       # Sumário dos documentos
└── README.md                           # Instruções de conferência e histórico
```

---

## 3. Detalhamento Técnico das 3 Etapas

```mermaid
flowchart TD
    subgraph ETAPA 1 ["Etapa 1: Excel Avançado"]
        A1["Aba Bruto: Cópia Fiel dos Dados de Vagas"] --> A2["Aba Tratado: Tab_Vagas_Tratadas"]
        A3["Aba Cadastros: Tabelas Mestres e De-Para"] --> A2
        A2 --> A4["Aba Auditoria: Registro e Painel Conciliado (Diferença = 0)"]
    end

    subgraph ETAPA 2 ["Etapa 2: Power Query (Linguagem M)"]
        B1["Ingestão Automatizada em M"] --> B2["Tratamento e Desduplicação"]
        B2 --> B3["fVagas: Fato de Vagas Sanitizadas"]
        B2 --> B4["Rejeitados: Isolamento de Exceções"]
        B2 --> B5["Painel Conferencia: Reconciliação Matemática"]
    end

    subgraph ETAPA 3 ["Etapa 3: Power Pivot & DAX"]
        C1["dCalendario: 181 dias contínuos"] --> C3["Star Schema: Relações 1:N"]
        C2["Dimensões: dCargo, dTecnologia, dEmpresa"] --> C3
        B3 --> C3
        C3 --> C4["Medidas DAX: Comprovação do Falso Júnior (54,5%)"]
    end

    ETAPA 1 --> ETAPA 2
    ETAPA 2 --> ETAPA 3
```

---

## 4. Resultados da Etapa 1: Excel Avançado

### 4.1 Regras de Implementação Respeitadas
- **Aba Bruto:** Cópia idêntica e intocada dos registros de origem, contendo os 10 defeitos controlados injetados (D1 a D10) para fins de auditoria e conformidade institucional.
- **Aba Tratado:** Criação da tabela estruturada `Tab_Vagas_Tratadas` (32 colunas) contendo a coluna fixa `Linha_Origem` (valor numérico estático, sem uso da volátil `=LIN()`), preservando a conexão física com a fonte.
- **Tratamento Funcional:**
  - `ARRUMAR` (`TRIM`): Eliminação de espaços excedentes e caracteres espúrios.
  - `PRI.MAIUSCULA` (`PROPER`): Padronização uniforme de capitalização para títulos de vagas.
  - `ÍNDICE/CORRESP` (`INDEX/MATCH`): Busca exata em cadastros oficiais (`Tab_Cargos`, `Tab_Tecnologias`, `Tab_Empresas`), eliminando qualquer risco de `#NOME?`.
  - Tratamento de datas com `=DATA(ANO, MÊS, DIA)` e validação com `=SE(NÃO(É.NÚM(...)); "Data inválida")`.
  - Detecção da regra do "Falso Júnior":
    ```excel
    =SE(E(Senioridade_Trat="Júnior"; Qtd_Tecs>3); "ALERTA: Falso Júnior"; SE(Status_Qtd="OK"; "Vaga Saudável"; "Revisar Requisitos"))
    ```
- **Aba Auditoria e Painel de Conferência:** Mapeamento integral de 12 anomalias, garantindo que o total detectado seja idêntico ao total registrado (**Diferença = 0** e **Erros de Fórmula = 0**).

---

## 5. Resultados da Etapa 2: Power Query Aplicado

### 5.1 Pipeline ETL Automatizado em Linguagem M
- **Conexão Dinâmica:** Leitura paramétrica de arquivos sem caminhos rígidos.
- **Padronização de Esquema:** Tratamento e tipagem rigorosa de cada coluna com localidade `"pt-BR"`.
- **Limpeza e Higienização:**
  - Conversão de datas heterogêneas (`DD/MM/AAAA`, `AAAA-MM-DD`, `D-M-AAAA`).
  - Tratamento de salários formatados como texto contendo vírgula (defeito D6).
  - Isolamento estrito de registros impeditivos (datas inexistentes como 31/02/2026, empresas sem correspondência no cadastro, campos vitais nulos) na tabela `Rejeitados`.
- **Aba Conferencia:** Reconciliação matemática comprovada ($Linhas_{Entrada} (20) = fVagas (11) + Rejeitados (9)$) — **Diferença = 0**.

---

## 6. Resultados da Etapa 3: Power Pivot & DAX

### 6.1 Modelo Dimensional Star Schema
- Criação da dimensão temporal contínua `dCalendario` (181 dias, de 01/01/2026 a 30/06/2026), com marcação oficial de Tabela de Datas.
- Relacionamentos unidirecionais de cardinalidade Muitos para Um ($N:1$) ligando a tabela fato `fVagas` às suas respectivas dimensões (`dCargo`, `dTecnologia`, `dEmpresa`, `dCalendario`).
- Inexistência de chaves órfãs ou chaves primárias duplicadas.

### 6.2 Comprovação Empírica da Pergunta Central (Hipótese do Falso Júnior)
No projeto temático da equipe (*Recrutamento de Entrada em TI*), os indicadores calculados via DAX demonstraram matematicamente a hipótese levantada na Proposta Técnica:
- **Total de Vagas Válidas:** 11 vagas
- **Salário Médio Geral Oferecido:** R$ 5.736,36
- **Média de Tecnologias Exigidas para Júnior:** **4,54 tecnologias** (contra um teto saudável de 3 tecnologias)
- **Taxa de Requisitos Inflacionados ("Falso Júnior"):** **54,5%** das vagas destinadas a profissionais iniciantes exigem habilidades complexas equivalentes a profissionais Plenos e Sêniores, comprovando o gargalo estrutural de contratação no mercado de TI.

---

## 7. Checklist de Validação Final da N1

| Critério Avaliado | Exigência da FATEC SP | Situação |
|---|---|:---:|
| **Estrutura de Pastas** | `01-excel`, `02-powerquery`, `03-powerpivot`, `04-documentacao` | Conforme |
| **Preservação de Dados** | Aba `Bruto` intacta sem fórmulas voláteis | Conforme |
| **Auditoria e Rastreabilidade** | Painel de conferência com Diferença = 0 | Conforme |
| **Pipeline Power Query** | Código M automatizado e consulta Rejeitados | Conforme |
| **Modelagem Power Pivot** | Star Schema, `dCalendario` contínua e medidas DAX | Conforme |
| **Alinhamento com Proposta** | Tema de Recrutamento em TI com KPIs comprovados | Conforme |
| **Arquivos de Script** | Códigos `.m` e `.dax` exportados em pastas dedicadas | Conforme |
