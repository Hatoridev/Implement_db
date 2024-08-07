-- Script SQL revisado para criar o banco de dados Logistica

-- Criação das tabelas
CREATE TABLE Clientes (
    CodigoDoCliente CHAR(10) PRIMARY KEY,
    NomeDaEmpresa VARCHAR(70) NOT NULL,
    NomeDoContato VARCHAR(70) NOT NULL,
    CargoDoContato VARCHAR(40) NOT NULL,
    Endereco VARCHAR(50) NOT NULL,
    Cidade VARCHAR(25) NOT NULL,
    Regiao VARCHAR(25),
    CEP CHAR(15) NOT NULL,
    Pais VARCHAR(25) NOT NULL,
    Telefone CHAR(20) NOT NULL,
    Fax CHAR(20)
);

CREATE TABLE Transportadora (
    CodigoDaTransportadora INTEGER PRIMARY KEY,
    NomeDaEmpresa VARCHAR(30) NOT NULL,
    Telefone CHAR(20)
);

CREATE TABLE Categorias (
    CodigoDaCategoria INTEGER PRIMARY KEY,
    NomeDaCategoria VARCHAR(30) NOT NULL,
    Descricao VARCHAR(100)
);

CREATE TABLE DetalhesDoPedido (
    NumeroDoPedido INTEGER,
    CodigoDoProduto INTEGER,
    PrecoUnitario REAL,
    Quantidade REAL,
    Desconto REAL,
    PRIMARY KEY (NumeroDoPedido, CodigoDoProduto)
);

CREATE TABLE Fornecedores (
    CodigoDoFornecedor INTEGER PRIMARY KEY,
    NomeDaEmpresa VARCHAR(70) NOT NULL,
    NomeDoContato VARCHAR(70),
    CargoDoContato VARCHAR(40),
    Endereco VARCHAR(50),
    Cidade VARCHAR(25),
    Regiao VARCHAR(25),
    CEP CHAR(15),
    Pais VARCHAR(25),
    Telefone CHAR(20),
    Fax CHAR(20)
);

CREATE TABLE Funcionarios (
    CodigoDoFuncionario INTEGER PRIMARY KEY,
    Sobrenome VARCHAR(30),
    Nome VARCHAR(30),
    Cargo VARCHAR(40),
    Tratamento CHAR(10),
    DataDeNascimento DATE,
    DataDeContratacao DATE,
    Endereco VARCHAR(50),
    Cidade VARCHAR(25),
    Regiao VARCHAR(25),
    CEP CHAR(15),
    Pais VARCHAR(25),
    TelefoneResidencial CHAR(20),
    Ramal CHAR(5),
    Observacoes VARCHAR(200)
);

CREATE TABLE Pedidos (
    NumeroDoPedido INTEGER PRIMARY KEY,
    CodigoDoCliente CHAR(10),
    CodigoDoFuncionario INTEGER,
    DataDoPedido DATE,
    DataDeEntrega DATE,
    DataDeEnvio DATE,
    CodigoDaTransportadora INTEGER,
    Frete REAL,
    NomeDoDestinatario VARCHAR(50),
    EnderecoDoDestinatario VARCHAR(50),
    CEPdeDestino CHAR(15),
    PaisDeDestino VARCHAR(25),
    CidadeDeDestino VARCHAR(25),
    RegiaoDeDestino VARCHAR(25),
    FOREIGN KEY (CodigoDoCliente) REFERENCES Clientes (CodigoDoCliente),
    FOREIGN KEY (CodigoDoFuncionario) REFERENCES Funcionarios (CodigoDoFuncionario),
    FOREIGN KEY (CodigoDaTransportadora) REFERENCES Transportadora (CodigoDaTransportadora)
);

CREATE TABLE Produtos (
    CodigoDoProduto INTEGER PRIMARY KEY,
    NomeDoProduto VARCHAR(50) NOT NULL,
    CodigoDoFornecedor INTEGER,
    CodigoDaCategoria INTEGER,
    QuantidadePorUnidade CHAR(30),
    PrecoUnitario REAL,
    UnidadesEmEstoque INTEGER,
    UnidadesPedidas INTEGER,
    NivelDeReposicao INTEGER,
    Descontinuado INTEGER,
    FOREIGN KEY (CodigoDoFornecedor) REFERENCES Fornecedores (CodigoDoFornecedor),
    FOREIGN KEY (CodigoDaCategoria) REFERENCES Categorias (CodigoDaCategoria)
);

-- Comentários explicativos:

-- Este script SQL cria o banco de dados Logistica e suas tabelas.

-- Cada tabela possui uma chave primária bem definida para garantir a integridade dos dados.

-- As tabelas estão configuradas para armazenar informações sobre clientes, transportadoras, categorias, detalhes do pedido, fornecedores, funcionários, pedidos e produtos.

-- O formato DATE é utilizado para os campos de data nas tabelas Funcionarios e Pedidos para garantir a correta interpretação das datas.

