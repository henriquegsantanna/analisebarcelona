-- criando a tabela para os jogdores
CREATE TABLE jogadores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    posicao VARCHAR(30),
    idade INT
);


-- criando a tabela para as estatisticas dos jogadores
CREATE TABLE estatisticas (
    id SERIAL PRIMARY KEY,
    competicao VARCHAR(30),
    partidas_jogadas INT,
    minutos_jogados INT,
    gols INT,
    assistencias INT,
    ga INT,
    jogador_id INT REFERENCES jogadores(id)
);


-- criando uma tabela temporária p importar os dados do arquivo csv
-- fazer o mesmo processo para cada arquivo csv (3), mudando o caminho
CREATE TEMP TABLE temp_estatisticas (
    nome_jogador VARCHAR(100),
    competicao VARCHAR(100),
    partidas_jogadas VARCHAR(50),
    minutos_jogados VARCHAR(50),
    gols VARCHAR(50),
    assistencias VARCHAR(50),
    ga VARCHAR(50)
);

COPY temp_estatisticas (nome_jogador, competicao, partidas_jogadas, minutos_jogados, gols, assistencias, ga)
FROM 'C:/Users/Public/jogadores_champions.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ';',
    ENCODING 'WIN1252'
);

-- inserindo na tabela
INSERT INTO estatisticas (competicao, partidas_jogadas, minutos_jogados, gols, assistencias, ga, jogador_id)
SELECT 
    t.competicao,
    REPLACE(t.partidas_jogadas, '.', '')::INT,
    REPLACE(t.minutos_jogados, '.', '')::INT,
    REPLACE(t.gols, '.', '')::INT,
    REPLACE(t.assistencias, '.', '')::INT,
    REPLACE(t.ga, '.', '')::INT,
    j.id AS jogador_id
FROM temp_estatisticas t
JOIN jogadores j ON j.nome = t.nome_jogador;

-- dropando tabela depois de usada
DROP TABLE IF EXISTS temp_estatisticas;


-- view com todos os jogadores em todas as competicoes
CREATE VIEW vw_estatisticas_completas AS
SELECT 
    j.nome AS jogador,
    j.posicao,
    e.competicao,
    e.partidas_jogadas,
    e.minutos_jogados,
    e.gols,
    e.assistencias,
    e.ga
FROM estatisticas e
JOIN jogadores j ON j.id = e.jogador_id;

SELECT * FROM vw_estatisticas_completas;
