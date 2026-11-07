# 02 - Power Query Aplicado: Pipeline de Ingestão e ETL em Linguagem M

**Disciplina:** Microinformática Aplicada (ILP590) — FATEC São Paulo  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Equipe 17:** Nathan Campos Nagano (RA 0020482511012) & Matheus Guides Rubim Fonseca (RA 0020482511028)  

---

## 📌 Objetivo da Etapa 2
Automatizar a ingestão, limpeza, transformação e separação dimensional de dados de vagas de tecnologia por meio do Power Query (Linguagem M). As regras manuais da Etapa 1 são transformadas em um fluxo contínuo e repetível, com isolamento estrito de exceções na tabela `Rejeitados`.

---

## 📂 Arquivos Entregues

1. **`Recrutamento_02_PowerQuery.xlsx`** *(Projeto Próprio — Equipe 17)*
   - Consultas implementadas:
     - `fVagas`: Tabela fato contendo 11 vagas válidas saneadas.
     - `dCargo`, `dTecnologia`, `dEmpresa`: Tabelas dimensão normalizadas.
     - `Rejeitados`: Tabela com as 9 linhas descartadas (datas inválidas, nulos, empresas não mapeadas) com respectivo motivo de rejeição.
     - `Conferencia`: Painel de conferência com conciliação exata: $Linhas_{Entrada} (20) = fVagas (11) + Rejeitados (9)$ — **Diferença = 0**.

2. **`scripts_m/`** *(Scripts em Linguagem M exportados)*
   - `fVagas.m` e `fVagas.pq`: Pipeline de ingestão e transformação das vagas de tecnologia.

---

## ⚙️ Regras do Pipeline M Implementadas
- Tipagem explícita com cultura regional: `Currency.Type`, `Int64.Type`, `Date.Type` (`"pt-BR"`).
- Limpeza de caracteres não imprimíveis e espaços duplos (`Text.Trim`, `Text.Clean`).
- Desduplicação em duas passagens para garantir integridade da chave primária.
- Auditoria de nulos e exclusão condicional para roteamento para `Rejeitados`.
