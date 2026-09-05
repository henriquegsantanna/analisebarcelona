# ⚽ FC Barcelona 2014/15 — Análise de Dados da Temporada Histórica

Projeto pessoal de análise de dados sobre a temporada 2014/15 do FC Barcelona, quando o clube conquistou os três principais títulos disputados (La Liga, Copa del Rey e Champions League) com o trio histórico Messi, Suárez e Neymar (MSN).

O projeto percorre todo o fluxo de um trabalho real de análise de dados: coleta e tratamento dos dados brutos utilizando Excel, modelagem e carga usando PostgreSQL, e construção de um dashboard interativo no Power BI.

## 📊 Dashboard

| Visão Geral |

imagem

| Resultados |

imagem

| Desempenho |

imagem

| Jogadores |

imagem

## 🎯 Objetivo

Praticar e demonstrar, em um caso real e de tema pessoal, o ciclo completo de um projeto de análise de dados:

- Coletar dados brutos de uma fonte pública (FBref);
- Tratar e organizar esses dados;
- Modelar um banco de dados relacional para armazená-los de forma consistente;
- Escrever queries SQL para carregar, cruzar e validar informações;
- Construir, em Power BI, um dashboard visual que responda perguntas relacionadas a temporada.

## 🔍 Fonte dos dados

Os dados foram coletados manualmente do [FBref](https://fbref.com), a partir da página da temporada 2014/15 do FC Barcelona com as 3 competições disputadas: **La Liga**, **Copa del Rey** e **UEFA Champions League**.

Os dados foram extraídos e divididos em 3 tabelas com diversas colunas:
- **resultados** — data, competicao, rodada, local, resultado, gols_feitos, gols_sofridos, adversario.
- **estatisticas** — id, competicao, partidas_jogadas, minutos_jogados, gols, assistencias, ga, jogador_id.
- **jogadores** — id, nome, posicao, idade.




## 👤 Autor

**Henrique Gaiardoni**
[LinkedIn](linkedin.com/in/henriquegaiardoni) · [GitHub](github.com/henriquegsantanna)
