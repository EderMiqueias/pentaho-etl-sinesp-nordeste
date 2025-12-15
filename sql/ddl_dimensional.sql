
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
    id_local integer,
    id_agente integer,
    id_tempo integer,
    id_evento integer,
    feminino integer,
    masculino integer,
    nao_informado integer,
    total_vitima integer,
    CONSTRAINT fato_ocorrencia_id_local_id_evento_id_agente_id_tempo_key
        UNIQUE (id_local, id_evento, id_agente, id_tempo),
    CONSTRAINT fato_ocorrencia_id_agente_fkey FOREIGN KEY (id_agente)
        REFERENCES public.dim_agente (id),
    CONSTRAINT fato_ocorrencia_id_evento_fkey FOREIGN KEY (id_evento)
        REFERENCES public.dim_evento,
    CONSTRAINT fato_ocorrencia_id_local_fkey FOREIGN KEY (id_local)
        REFERENCES public.dim_local,
    CONSTRAINT fato_ocorrencia_id_tempo_fkey FOREIGN KEY (id_tempo)
        REFERENCES public.dim_tempo
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
