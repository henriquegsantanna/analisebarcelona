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

## 🛠️ Ferramentas e tecnologias

- **Excel** — primeira limpeza e organização dos dados exportados do FBref.
- **PostgreSQL** — modelagem, armazenamento e consultas SQL.
- **Power BI** — modelagem do relacionamento entre tabelas, medidas em DAX e construção do dashboard.

## 🗂️ Etapas do projeto

### 1. Coleta e tratamento inicial (Excel)
Os dados foram exportados do FBref em formato CSV/Excel e organizados em 4 planilhas: resultados da temporada inteira, e estatísticas de jogadores (geral, La Liga, Copa del Rey e Champions League).

### 2. Modelagem do banco de dados (PostgreSQL)
Ao invés de manter os dados soltos em planilhas, o projeto foi migrado para um banco relacional, aplicando conceitos de normalização:

- **`jogadores`** — dados fixos de cada atleta (id, nome, posição, idade), com uma linha por jogador;
- **`estatisticas`** — uma linha por jogador **por competição** (partidas jogadas, minutos, gols, assistências, G+A), conectada a `jogadores` por uma chave estrangeira (`jogador_id`);
- **`resultados`** — um registro por partida da temporada (data, competição, rodada, local, resultado, gols feitos/sofridos, adversário).

### 3. Carga dos dados
Os arquivos CSV tratados no Excel foram importados para tabelas provisórias no PostgreSQL (`COPY`) e depois inseridos nas tabelas finais com `INSERT INTO ... SELECT` combinado a `JOIN`, garantindo que cada linha de estatística fosse associada ao `id` correto do jogador correspondente.

### 4. Conexão com o Power BI
O Power BI foi conectado diretamente ao banco PostgreSQL (modo de importação), carregando as 3 tabelas e reconhecendo automaticamente o relacionamento entre `jogadores` e `estatisticas`.

### 5. Construção do dashboard
O dashboard foi dividido em 4 páginas, com navegação lateral fixa:

- **Visão Geral** — resumo da temporada (jogos, vitórias, empates, derrotas, aproveitamento, títulos, artilheiros, saldo de gols, desempenho casa/fora, destaques como as indicações ao Bola de Ouro);
- **Resultados** — resultados e gols por mês, placares mais frequentes, melhores e piores resultados da temporada, sequência invicta e outros recordes;
- **Desempenho** — desempenho por competição, desempenho casa x fora, comparativo de gols;
- **Jogadores** — artilharia, assistências, participação direta em gols (G+A), minutagem e partidas jogadas.

## ❓ Algumas perguntas que o dashboard responde

- Qual foi o aproveitamento do time na temporada, geral e por competição?
- Quem foram os artilheiros e garçons da temporada?
- O desempenho como mandante foi muito diferente do desempenho como visitante?
- Quais foram os placares mais frequentes da temporada?
- Quais foram as maiores goleadas a favor e os piores resultados?
- Qual foi a maior sequência de jogos sem perder?
- Quais adversários mais sofreram gols do Barcelona nessa temporada?
- Quantos jogos não sofreram gols?

## 📁 Estrutura do repositório

```
├── arquivos csv/     # dados brutos exportados do FBref
├── SQL/              # scripts de criação das tabelas e cargas
├── imagens/          # imagens utilizadas nos dashboards
├── notas             # anotações antes e durante o processo
└── README.md         # projeto documentado
```

## 👤 Autor

**Henrique Gaiardoni**

[LinkedIn](linkedin.com/in/henriquegaiardoni) · [GitHub](github.com/henriquegsantanna)
