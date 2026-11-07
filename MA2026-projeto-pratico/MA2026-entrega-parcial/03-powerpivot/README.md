# 03 - Power Pivot & DAX

## Objetivo
Modelar o banco de dados dimensional (*Star Schema* / Esquema Estrela) no Power Pivot e desenvolver os KPIs analíticos via linguagem DAX.

## Estrutura Dimensional Planejada
- **Tabela Fato**:
  - `Fato_Vagas`: Registros granulares de cada anúncio de vaga (salário ofertado, data de publicação, modalidade presencial/híbrida/remota).
- **Tabelas Dimensão**:
  - `Dim_Cargo`: Níveis de senioridade (Estágio, Júnior, Pleno, Sênior) e nomenclaturas de cargos.
  - `Dim_Tecnologia`: Catálogo padronizado de hard skills e tecnologias exigidas.
  - `Dim_Empresa`: Informações da empresa anunciante e segmento.
  - `Dim_Calendario`: Tabela contínua de datas para análises temporais.

## Indicadores Chave Iniciais (DAX)
- **Média de Tecnologias Exigidas**: Contagem distinta de habilidades requeridas por nível hierárquico (evidenciando a anomalia do "Falso Júnior").
- **Ticket Salarial Médio**: Média salarial consolidada em BRL por cargo e localização.
- **Taxa de Requisitos Inflacionados**: Percentual de vagas de entrada que exigem mais de 4 hard skills complexas.
