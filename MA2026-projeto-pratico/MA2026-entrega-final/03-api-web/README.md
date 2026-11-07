# 03 - Integração com APIs REST & Enriquecimento

## Objetivo
Enriquecer a base transacional principal integrando dados externos via requisições REST automatizadas.

## APIs Mapeadas no Planejamento
1. **AwesomeAPI (Cotações de Moedas)**:
   - **Dados**: Cotações diárias e históricas de moedas estrangeiras (USD, EUR).
   - **Formato**: JSON.
   - **Finalidade**: Converter e padronizar salários de vagas internacionais para BRL, viabilizando comparação direta com a concorrência global por talentos de nível júnior.
2. **API de Localidades do IBGE (Secundária)**:
   - **Dados**: Dados demográficos e geográficos por estado e município.
   - **Finalidade**: Relacionar localidade das contratantes com as faixas salariais e exigências de presencialidade vs trabalho remoto.

## Artefatos Esperados
- Scripts de conexão e extração das APIs
- Documentação dos endpoints, parâmetros e payloads JSON
