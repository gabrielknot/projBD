CREATE TABLE estudio (
    dataFundacao date,
    faturamentoAnual bigint,
    nome varchar(50) PRIMARY KEY,
    presidente varchar(50)
    );

CREATE TABLE oscar (
    edicao varchar(50) PRIMARY KEY
    );

CREATE TABLE filme (
    nome varchar(50) PRIMARY KEY,
    numeroMesesProducao integer,
    anoLancamento integer,
    copyright integer,
    custoTotalFilme integer,
    nomeEstudio varchar(50),
    FOREIGN KEY( nomeEstudio) REFERENCES estudio(nome),
    genero varchar(50),
    edicaoOscar varchar(50),
    FOREIGN KEY(edicaoOscar) REFERENCES oscar(edicao),
    categoriaOscar varchar(50),
    anoOscar varchar(50)
    );

CREATE TABLE atorAtriz (
    numeroSeguroSocial varchar(50) UNIQUE,
    nomeArtistico varchar(50) PRIMARY KEY,
    idade integer,
    sexo varchar(50),
    nacionalidade varchar(50),
    dataNascimento date,
    edicaoOscar varchar(50),
    FOREIGN KEY(edicaoOscar) REFERENCES oscar(edicao),
    anoOscar integer,
    categoriaOscar varchar(50)
    );

CREATE TABLE tipoPapel (
    tipoPapel varchar(50) PRIMARY KEY
    );



CREATE TABLE filme_ator_atriz (
    nomeFilme varchar(50),
    FOREIGN KEY(nomeFilme) REFERENCES filme(nome),
    nomeArtistico varchar(50),
    FOREIGN KEY(nomeArtistico ) REFERENCES atoratriz(nomeArtistico ),
    cachee integer,
    nomePersornagem varchar(50),
    PRIMARY KEY(nomeFilme, nomeArtistico )
);

CREATE TABLE tipoPapel_Ator (
    tipoPapel varchar(50),
    FOREIGN KEY(tipoPapel) REFERENCES tipopapel(tipoPapel),
    nomeArtistico varchar(50),
    FOREIGN KEY(nomeArtistico) REFERENCES atoratriz(nomeArtistico),  
    PRIMARY KEY(tipoPapel, nomeArtistico)
);
