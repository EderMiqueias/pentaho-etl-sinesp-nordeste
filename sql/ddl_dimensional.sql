
Destaques da pasta
Definições de banco de dados e ETL KTR/KJB para carga de dimensões (dim_local, dim_agente, etc.) e fatos.

-- 1. Criação das Tabelas de Dimensão (Sem dependências)

CREATE DATABASE IF NOT EXISTS sinesp_nordeste_sad;

CREATE TABLE "dim_local"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "cidade" VARCHAR(50) NOT NULL,
    "estado" VARCHAR(25) NOT NULL
);

CREATE TABLE "dim_agente"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "tipo_agente" VARCHAR(255) NOT NULL
);

CREATE TABLE "dim_evento"(
    "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    "descricao_evento" VARCHAR(255) NOT NULL
);

    CREATE TABLE "dim_tempo"(
        "id" INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        "ano" INTEGER NOT NULL,
        "semestre" INTEGER NOT NULL,
        "trimestre" INTEGER NOT NULL,
        "mes" INTEGER NOT NULL
    );

---

-- 2. Criação das Tabelas de Fato (Incluindo Chaves Estrangeiras e UNIQUE/PRIMARY KEY)

CREATE TABLE "fato_ocorrencia"(
    "id_local" INTEGER NULL,
    "id_agente" INTEGER NULL,
    "id_tempo" INTEGER NULL,
    "id_evento" INTEGER NULL,
    "feminino" INTEGER NULL,
    "masculino" INTEGER NULL,
    "nao_informado" INTEGER NULL,
    "total_vitima" INTEGER NULL,
    -- Restrições
    PRIMARY KEY(id_local, id_evento, id_tempo),
    FOREIGN KEY("id_local") REFERENCES "dim_local"("id"),
    FOREIGN KEY("id_agente") REFERENCES "dim_agente"("id"),
    FOREIGN KEY("id_tempo") REFERENCES "dim_tempo"("id"),
    FOREIGN KEY("id_evento") REFERENCES "dim_evento"("id")
);

CREATE TABLE "fato_populacao"(
    "id_local" INTEGER NOT NULL,
    "id_tempo" INTEGER NOT NULL,
    "pop_masculina" INTEGER NOT NULL,
    "pop_feminina" INTEGER NOT NULL,
    "pop_total" INTEGER NOT NULL,
    -- Restrições
    PRIMARY KEY(id_local, id_tempo),
    FOREIGN KEY("id_local") REFERENCES "dim_local"("id"),
    FOREIGN KEY("id_tempo") REFERENCES "dim_tempo"("id")
);
