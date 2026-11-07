# Documentação do Modelo Relacional e Star Schema — Entrega N1
**Disciplina:** Microinformática Aplicada (ILP590) • **Semestre:** 2º Semestre / 2026 • **FATEC São Paulo**  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Equipe:**
- **Nathan Campos Nagano** (RA: 0020482511012) — Líder, Eng. de Dados / Excel, Modelagem Power Query / DAX
- **Matheus Guides Rubim Fonseca** (RA: 0020482511028) — Líder, Automação VBA & APIs, SQL / Power BI, QA

---

## 1. Visão Geral da Arquitetura
Esta entrega de N1 consolida as três primeiras etapas evolutivas do pipeline analítico:
1. **Etapa 1 — Excel Avançado:** Limpeza, tratamento funcional com fórmulas (`PROCX`, `ARRUMAR`, `PRI.MAIUSCULA`, `LET`), validação e auditoria rigorosa de inconsistências com painel conciliado (Diferença = 0).
2. **Etapa 2 — Power Query:** Pipeline de ingestão automatizada em linguagem M, leitura em lote de planilhas brutas, tratamento de tipos com localidade `pt-BR`, remoção de nulos/duplicatas e separação da consulta `Rejeitados`.
3. **Etapa 3 — Power Pivot & DAX:** Modelagem dimensional em Star Schema (Esquema Estrela), criação da dimensão de tempo contínua `dCalendario`, relacionamentos 1:N com direção única e desenvolvimento das medidas analíticas e de integridade em DAX.

---

## 2. Modelagem do Projeto da Equipe: "Painel de Decisão para Recrutamento de Entrada (Falso Júnior)"

### 2.1 Hipótese e Pergunta de Negócio
- **Pergunta Central:** *Qual é a discrepância estrutural entre a quantidade e complexidade de tecnologias exigidas versus as faixas salariais efetivamente oferecidas para vagas de entrada (Júnior e Estágio) no mercado de TI, e como o RH pode readequar essas exigências para acelerar o preenchimento das vagas?*
- **Diagnóstico Empírico:** O fenômeno do "Falso Júnior" manifesta-se quando anúncios de vagas rotulados como "Júnior" exigem mais de 3 tecnologias/ferramentas complexas (perfil equivalente a Pleno/Sênior), mantendo faixas salariais baixas.

### 2.2 Diagrama Star Schema
```
                      ┌────────────────────────┐
                      │        dCargo          │
                      ├────────────────────────┤
                      │ PK  Cod_Cargo          │
                      │     Senioridade        │
                      │     Salario_Piso       │
                      │     Salario_Teto       │
                      │     Max_Techs_Rec      │
                      └───────────┬────────────┘
                                  │ 1
                                  │
                                  │ *
┌───────────────────────┐         ┌────────────────────────┐         ┌────────────────────────┐
│     dTecnologia       │ 1     * │         fVagas         │ *     1 │        dEmpresa        │
├───────────────────────┼─────────┤────────────────────────┼─────────┤────────────────────────┤
│ PK  Cod_Tech          │         │ PK  ID_Vaga            │         │ PK  Cod_Empresa        │
│     Nome_Tecnologia   │         │ FK  Cod_Cargo          │         │     Nome_Empresa       │
│     Categoria         │         │ FK  Cod_Tech           │         │     Porte              │
│     Nivel_Complexidade│         │ FK  Cod_Empresa        │         │     Setor              │
└───────────────────────┘         │ FK  Data_Publicacao    │         │     Estado             │
                                  │     Qtd_Tecnologias    │         └────────────────────────┘
                                  │     Salario_Oferecido  │
                                  │     Modalidade         │
                                  │     Canal_Divulgacao   │
                                  │     Flag_Falso_Junior  │
                                  └───────────┬────────────┘
                                              │ *
                                              │
                                              │ 1
                                  ┌───────────┴────────────┐
                                  │      dCalendario       │
                                  ├────────────────────────┤
                                  │ PK  Data               │
                                  │     Ano                │
                                  │     Mes                │
                                  │     NomeMes            │
                                  │     DiaSemana          │
                                  │     Trimestre          │
                                  │     AnoMes             │
                                  │     Feriado            │
                                  └────────────────────────┘
```

### 2.3 Medidas DAX Desenvolvidas
| Medida | Expressão DAX | Interpretação de Negócio |
|---|---|---|
| **Total de Vagas** | `COUNTROWS(fVagas)` | Volume total de anúncios coletados |
| **Ticket Salarial Médio** | `AVERAGE(fVagas[Salario_Oferecido])` | Média salarial das ofertas em BRL |
| **Média de Techs Exigidas** | `AVERAGE(fVagas[Qtd_Tecnologias])` | Densidade de requisitos técnicos por vaga |
| **Salário Médio Júnior** | `CALCULATE(AVERAGE(fVagas[Salario_Oferecido]), RELATED(dCargo[Senioridade]) = "Júnior")` | Remuneração média efetiva para nível Júnior |
| **Média Techs Júnior** | `CALCULATE(AVERAGE(fVagas[Qtd_Tecnologias]), RELATED(dCargo[Senioridade]) = "Júnior")` | Média de tecnologias exigidas para Júnior (apurado: **4,54**, confirmando sobrecarga) |
| **Vagas Falso Júnior** | `CALCULATE(COUNTROWS(fVagas), fVagas[Qtd_Tecnologias] > 3, RELATED(dCargo[Senioridade]) = "Júnior")` | Contagem de vagas com perfil desvirtuado |
| **Taxa de Requisitos Inflacionados (%)** | `DIVIDE([Vagas Falso Júnior], CALCULATE(COUNTROWS(fVagas), RELATED(dCargo[Senioridade]) = "Júnior"))` | Percentual de vagas com inflação de perfil (apurado: **54,5%**) |

---

## 3. Modelagem do Projeto Modelo: "Rede CaféData Brasil" (Gabarito Oficial)

### 3.1 Diagrama Star Schema
- **Fatos:** `fVendas` (transações de venda) e `fMetas` (metas semestrais por filial)
- **Dimensões:** `dProduto`, `dFilial`, `dCalendario` (181 dias)
- **Relacionamentos:**
  - `fVendas[Cod_Filial]` $\to$ `dFilial[Cod_Filial]` (N:1, ativo)
  - `fVendas[Cod_Produto]` $\to$ `dProduto[Cod]` (N:1, ativo)
  - `fVendas[Data]` $\to$ `dCalendario[Data]` (N:1, ativo)
  - `fMetas[Cod_Filial]` $\to$ `dFilial[Cod_Filial]` (N:1, ativo)
  - `fMetas[Mes_Inicio]` $\to$ `dCalendario[Data]` (N:1, inativo para USERELATIONSHIP)

### 3.2 Indicadores DAX Oficiais e Resultados Obtidos
- **Faturamento Bruto:** R$ 212,00 (Gabarito: 212,00 | Diferença: 0)
- **Faturamento Líquido:** R$ 210,00 (Gabarito: 210,00 | Diferença: 0)
- **Qtd Cupons:** 13 (Gabarito: 13 | Diferença: 0)
- **Ticket Médio:** R$ 16,15 (Gabarito: 16,15 | Diferença: 0)
- **Custo Total:** R$ 45,90 (Gabarito: 45,90 | Diferença: 0)
- **Margem Bruta %:** 78,1% (Gabarito: 78,1% | Diferença: 0)
- **Qtd Itens / Itens por Cupom:** 19 itens / 1,46 itens/cupom
- **Faturamento Bebidas Frias:** R$ 7,50 (P11)
- **% Bebidas Frias:** 5,1%
- **Reconciliação e Órfãs:** Todas as medidas `Conf ...` retornam estritamente 0.
