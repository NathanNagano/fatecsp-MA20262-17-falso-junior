# 03 - Power Pivot & DAX: Modelagem Dimensional Star Schema

**Disciplina:** Microinformática Aplicada (ILP590) — FATEC São Paulo  
**Docente:** Prof. Carlos Henrique Veríssimo Pereira  
**Equipe 17:** Nathan Campos Nagano (RA 0020482511012) & Matheus Guides Rubim Fonseca (RA 0020482511028)  

---

## 📌 Objetivo da Etapa 3
Estruturar o modelo relacional analítico em Esquema Estrela (*Star Schema*) no Power Pivot, relacionando tabelas fato e dimensões via cardinalidades 1:N com direção unidirecional, integrando uma dimensão temporal contínua (`dCalendario`) e calculando KPIs de inteligência de negócios através de medidas DAX formais sobre o mercado de trabalho em tecnologia.

---

## 📂 Arquivos Entregues

1. **`Recrutamento_03_PowerPivot.xlsx`** *(Projeto Próprio — Equipe 17)*
   - Modelo dimensional: `fVagas` no centro, conectada a `dCargo`, `dTecnologia`, `dEmpresa` e `dCalendario`.
   - `dCalendario` contínua de 181 dias (01/01/2026 a 30/06/2026).
   - Aba `Validacao_Recrutamento` com Tabelas Dinâmicas cruzadas comprovando os indicadores analíticos.

2. **`dax/`** *(Scripts formais das Medidas DAX)*
   - `medidas_recrutamento.dax`: Medidas analíticas do projeto:
     - `Total de Vagas`: `COUNTROWS(fVagas)`
     - `Ticket Salarial Médio`: `AVERAGE(fVagas[Salario_Oferecido])`
     - `Média de Tecnologias Exigidas`: `AVERAGE(fVagas[Qtd_Tecnologias_Exigidas])`
     - `Vagas Falso Júnior`: `CALCULATE(COUNTROWS(fVagas), fVagas[Status_Falso_Junior] = "Falso Júnior")`
     - `% Vagas Falso Júnior`: `DIVIDE([Vagas Falso Júnior], [Total de Vagas], 0)` *(Resultando em 54,5%)*
     - `Salário Médio Falso Júnior`: `CALCULATE([Ticket Salarial Médio], fVagas[Status_Falso_Junior] = "Falso Júnior")`

3. **`scripts_m/`** *(Scripts M de apoio à carga do modelo)*
   - `fVagas.m`, `fVagas.pq`.

---

## 📐 Relacionamentos e Cardinalidades

| Tabela 1 (Dimensão - Lado 1) | Chave Primária | Tabela 2 (Fato - Lado N) | Chave Estrangeira | Cardinalidade | Direção do Filtro |
| :--- | :--- | :--- | :--- | :---: | :---: |
| `dCargo` | `Cod_Cargo` | `fVagas` | `Cod_Cargo` | 1:N | Única (dCargo → fVagas) |
| `dTecnologia` | `Cod_Tecnologia` | `fVagas` | `Cod_Tecnologia` | 1:N | Única (dTecnologia → fVagas) |
| `dEmpresa` | `Cod_Empresa` | `fVagas` | `Cod_Empresa` | 1:N | Única (dEmpresa → fVagas) |
| `dCalendario` | `Data` | `fVagas` | `Data_Anuncio` | 1:N | Única (dCalendario → fVagas) |
