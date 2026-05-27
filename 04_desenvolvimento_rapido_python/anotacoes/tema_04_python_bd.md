# Tema 04: Python com Banco de Dados
**Data:** 27/05/2026 | **Status:** Concluído

## 1. SQLite na Metodologia RAD
Sistemas de Gerenciamento de Banco de Dados (SGBD) relacionais organizam dados em tabelas, enquanto os não relacionais (NoSQL) utilizam formatos baseados em documentos. 
Para o desenvolvimento rápido de aplicações (RAD) em Python, o padrão é o **SQLite** (biblioteca nativa `sqlite3`). Ele dispensa a instalação e configuração de servidores dedicados, armazenando todo o banco de dados em um único arquivo local `.db`.

## 2. Operações CRUD e Conexão
A interação com o banco de dados via `sqlite3` segue um fluxo estruturado:
1. **Conexão:** `conn = sqlite3.connect('banco.db')` acessa ou cria o arquivo.
2. **Cursor:** `cursor = conn.cursor()` cria a estrutura responsável por processar os comandos SQL.
3. **Execução:** `cursor.execute("COMANDO SQL")` envia as instruções de Create, Read, Update e Delete (CRUD).
4. **Commit:** `conn.commit()` é obrigatório para consolidar permanentemente as alterações de escrita no arquivo.
5. **Leitura:** Para extrair resultados de um comando SELECT, utilizam-se os métodos `fetchall()` (traz todas as linhas) ou `fetchone()` (traz a primeira linha).
6. **Fechamento:** `conn.close()` encerra a conexão e libera o arquivo.

## 3. Prevenção contra SQL Injection
A concatenação direta de variáveis do Python em comandos SQL (ex: `f"SELECT * FROM usuarios WHERE nome = '{usuario}'"`) cria vulnerabilidades críticas de **SQL Injection**.
A prática segura exige o uso de consultas parametrizadas, empregando o caractere `?` como marcador de posição e passando as variáveis separadamente através de uma tupla:
`cursor.execute("SELECT * FROM usuarios WHERE nome = ?", (usuario,))`.

## 4. ORM (Object-Relational Mapping) com SQLAlchemy
Escrever instruções SQL puras diretamente no código dificulta a manutenção do software. A solução de mercado é a implementação de um ORM.
- **Conceito:** O ORM mapeia tabelas relacionais do banco de dados para classes no Python. Os registros das tabelas são instanciados como objetos.
- **SQLAlchemy:** O framework ORM mais robusto e utilizado em Python. Ele opera através da *Engine* (gerencia a conexão física), da *Declarative Base* (associa as classes às tabelas) e da *Session* (gerencia o fluxo de transações).
- **Vantagens:** Oferece sanitização automática contra SQL Injection, permite manipulação de dados via orientação a objetos e garante portabilidade (a migração de SQLite para PostgreSQL exige apenas a alteração da string de conexão).