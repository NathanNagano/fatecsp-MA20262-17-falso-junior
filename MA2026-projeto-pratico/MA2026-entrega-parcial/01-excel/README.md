# 01 - Excel Avançado: Padronização, Auditoria e Integridade

**Disciplina:** Microinformática Aplicada (ILP590) — FATEC São Paulo  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Equipe 17:** Nathan Campos Nagano (RA 0020482511012) & Matheus Guides Rubim Fonseca (RA 0020482511028)  

---

## 📌 Objetivo da Etapa 1
Estruturar, higienizar e auditar a base de dados utilizando fórmulas e ferramentas de Excel Avançado, garantindo rastreabilidade absoluta dos dados brutos, padronização corporativa e isolamento de anomalias com severidade e plano de ação.

---

## 📂 Arquivos Entregues

1. **`Recrutamento_01_Excel.xlsx`** *(Projeto Próprio — Equipe 17)*
   - **Tema:** Painel de Decisão para Recrutamento de Entrada (Fenômeno do "Falso Júnior").
   - **Estrutura de 4 Abas Padronizadas:**
     - `Bruto`: 20 registros simulados com 10 defeitos controlados injetados (D1 a D10) preservados intactos para fins de auditoria e conformidade.
     - `Tratado`: Tabela `Tab_Vagas_Tratadas` com 32 colunas utilizando fórmulas avançadas (`ARRUMAR`, `PRI.MAIUSCULA`, `ÍNDICE/CORRESP`, `SE`, `DATA`, `HORA`, `TEXTO`, `E`).
     - `Cadastros`: 6 tabelas de domínio com intervalos nomeados dinâmicos e validação de dados (`Tab_Cargos`, `Tab_Empresas`, `Tab_Tecnologias`, `Tab_DePara_Senioridade`, `Tab_Modalidades`, `Tab_Canais`).
     - `Auditoria`: Tabela `Tab_Auditoria_Vagas` (12 anomalias catalogadas com severidade, impacto, ação corretiva e status) + **Painel de Reconciliação com Diferença = 0**.

2. **`CafeData_01_Excel.xlsx`** *(Gabarito Oficial Benchmark — CaféData Brasil)*
   - Base de vendas simulada da F01 (Centro) com 4 abas completas seguindo rigorosamente o Guia Prático da FATEC SP.

---

## 🔍 Regras de Negócio e Fórmulas Principais

- **Padronização de Texto:** `=PRI.MAIUSCULA(ARRUMAR(F2))` para títulos e cargos.
- **De-Para e Cruzamento de Códigos:** `=IFERROR(INDEX(Cadastros!$..., MATCH(TRIM(...), Cadastros!$..., 0)), "Sem correspondência")` garantindo compatibilidade universal sem erros `#NOME?` em qualquer versão do Excel.
- **Detecção do "Falso Júnior":**
  ```excel
  =IF(AND(Senioridade_Trat="Júnior", Qtd_Tecs>3), "ALERTA: Falso Júnior", IF(Status_Qtd="OK", "Vaga Saudável", "Revisar Requisitos"))
  ```
- **Painel de Auditoria e Reconciliação:**
  - Total de Linhas Brutas: 20
  - Registros Válidos: 8
  - Registros com Inconsistências / Alertas: 12
  - **Diferença de Conciliação: 0 (100% Auditado)**
