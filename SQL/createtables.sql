CREATE TABLE jogadores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    posicao VARCHAR(30),
    idade INT
);

CREATE TABLE estatisticas (
    id SERIAL PRIMARY KEY,
    jogador_id INT REFERENCES jogadores(id),
    competicao VARCHAR(30),
    partidas_jogadas INT,
    minutos_jogados INT,
    gols INT,
    assistencias INT,
    ga INT
);