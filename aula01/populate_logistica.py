import sqlite3

# Conectar ao banco de dados
conn = sqlite3.connect('Logistica.db')
cursor = conn.cursor()

# Função para popular a tabela Clientes
def populate_clientes():
    clientes = [
        ('C001', 'Empresa Alpha', 'João Silva', 'Gerente', 'Rua A, 123', 'São Paulo', 'SP', '00000-000', 'Brasil', '011-1234-5678', '011-8765-4321'),
        ('C002', 'Empresa Beta', 'Maria Oliveira', 'Diretora', 'Avenida B, 456', 'Rio de Janeiro', 'RJ', '11111-111', 'Brasil', '021-2345-6789', '021-9876-5432'),
        ('C003', 'Empresa Gamma', 'Carlos Souza', 'Supervisor', 'Travessa C, 789', 'Curitiba', 'PR', '22222-222', 'Brasil', '041-3456-7890', '041-8765-4321')
    ]
    cursor.executemany('INSERT INTO Clientes VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', clientes)

# Função para popular a tabela Transportadora
def populate_transportadora():
    transportadoras = [
        (1, 'Transportadora Rápida', '011-4444-5555'),
        (2, 'Transportadora Segura', '021-5555-6666'),
        (3, 'Transportadora Expressa', '041-6666-7777')
    ]
    cursor.executemany('INSERT INTO Transportadora VALUES (?, ?, ?)', transportadoras)

# Função para popular a tabela Categorias
def populate_categorias():
    categorias = [
        (1, 'Eletrônicos', 'Produtos eletrônicos diversos'),
        (2, 'Roupas', 'Vestuário para todas as idades'),
        (3, 'Alimentos', 'Produtos alimentícios')
    ]
    cursor.executemany('INSERT INTO Categorias VALUES (?, ?, ?)', categorias)

# Função para popular a tabela DetalhesDoPedido
def populate_detalhes_do_pedido():
    detalhes = [
        (1, 1, 100.0, 5, 0.1),
        (2, 2, 200.0, 3, 0.2),
        (3, 3, 300.0, 7, 0.3)
    ]
    cursor.executemany('INSERT INTO DetalhesDoPedido VALUES (?, ?, ?, ?, ?)', detalhes)

# Função para popular a tabela Fornecedores
def populate_fornecedores():
    fornecedores = [
        (1, 'Fornecedor Alpha', 'José Santos', 'Vendas', 'Rua X, 123', 'Porto Alegre', 'RS', '00000-000', 'Brasil', '051-1111-2222', '051-3333-4444'),
        (2, 'Fornecedor Beta', 'Ana Costa', 'Marketing', 'Avenida Y, 456', 'Florianópolis', 'SC', '11111-111', 'Brasil', '048-2222-3333', '048-4444-5555'),
        (3, 'Fornecedor Gamma', 'Pedro Lima', 'Logística', 'Travessa Z, 789', 'Belo Horizonte', 'MG', '22222-222', 'Brasil', '031-3333-4444', '031-5555-6666')
    ]
    cursor.executemany('INSERT INTO Fornecedores VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', fornecedores)

# Função para popular a tabela Funcionarios
def populate_funcionarios():
    funcionarios = [
        (1, 'Silva', 'João', 'Analista', 'Sr.', '1985-01-01', '2020-01-01', 'Rua A, 123', 'São Paulo', 'SP', '00000-000', 'Brasil', '011-1234-5678', '101', 'Sem observações'),
        (2, 'Oliveira', 'Maria', 'Desenvolvedora', 'Sra.', '1990-02-02', '2021-02-02', 'Avenida B, 456', 'Rio de Janeiro', 'RJ', '11111-111', 'Brasil', '021-2345-6789', '102', 'Sem observações'),
        (3, 'Souza', 'Carlos', 'Gerente', 'Sr.', '1975-03-03', '2022-03-03', 'Travessa C, 789', 'Curitiba', 'PR', '22222-222', 'Brasil', '041-3456-7890', '103', 'Sem observações')
    ]
    cursor.executemany('INSERT INTO Funcionarios VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', funcionarios)

# Função para popular a tabela Pedidos
def populate_pedidos():
    pedidos = [
        (1, 'C001', 1, '2023-01-01', '2023-01-10', '2023-01-05', 1, 50.0, 'João Silva', 'Rua A, 123', '00000-000', 'Brasil', 'São Paulo', 'SP'),
        (2, 'C002', 2, '2023-02-01', '2023-02-15', '2023-02-10', 2, 100.0, 'Maria Oliveira', 'Avenida B, 456', '11111-111', 'Brasil', 'Rio de Janeiro', 'RJ'),
        (3, 'C003', 3, '2023-03-01', '2023-03-20', '2023-03-15', 3, 150.0, 'Carlos Souza', 'Travessa C, 789', '22222-222', 'Brasil', 'Curitiba', 'PR')
    ]
    cursor.executemany('INSERT INTO Pedidos VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', pedidos)

# Função para popular a tabela Produtos
def populate_produtos():
    produtos = [
        (1, 'Smartphone', 1, 1, 'Unidade', 1000.0, 10, 5, 2, 0),
        (2, 'Camiseta', 2, 2, 'Peça', 50.0, 50, 20, 5, 0),
        (3, 'Café', 3, 3, 'Pacote', 20.0, 100, 30, 10, 0)
    ]
    cursor.executemany('INSERT INTO Produtos VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', produtos)

# Executar funções para popular o banco de dados
populate_clientes()
populate_transportadora()
populate_categorias()
populate_detalhes_do_pedido()
populate_fornecedores()
populate_funcionarios()
populate_pedidos()
populate_produtos()

# Confirmar mudanças e fechar conexão
conn.commit()
conn.close()

# Comentários explicativos:
# Este script Python conecta-se ao banco de dados SQLite 'Logistica.db' e preenche todas as tabelas com dados fictícios.
# Cada função é responsável por inserir dados em uma tabela específica conforme a estrutura definida no script SQL.
# A função 'populate_pedidos()' agora insere corretamente todos os 14 campos da tabela 'Pedidos'.
# As datas são inseridas no formato 'YYYY-MM-DD', que é o padrão aceito pelo SQLite.
# Após inserir todos os dados, o script confirma as mudanças com conn.commit() e fecha a conexão com conn.close().

