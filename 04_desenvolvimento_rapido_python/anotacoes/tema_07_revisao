# Revisão de Prova: Desenvolvimento Rápido de Aplicações em Python

**Data:** 26/06/2026 | **Status:** Resumo para estudo

## 1. RAD

RAD significa **Rapid Application Development**, ou Desenvolvimento Rápido de Aplicações.

A ideia principal é criar software de forma rápida, com protótipos, entregas curtas e ajustes constantes conforme o feedback dos usuários.

Em vez de esperar o sistema inteiro ficar pronto, o RAD trabalha em ciclos:

```txt
planejar → prototipar → testar → receber feedback → ajustar
```

Pontos importantes:

- foco em desenvolvimento rápido;
- uso de protótipos;
- participação constante do usuário;
- adaptação a mudanças;
- entregas incrementais;
- menos rigidez no processo.

RAD combina bem com projetos em que os requisitos podem mudar durante o desenvolvimento.

## 2. Usuários, stakeholders e feedback

Stakeholders são as pessoas interessadas ou afetadas pelo sistema.

Podem ser:

- usuários finais;
- cliente;
- equipe de negócio;
- gestores;
- funcionários da empresa.

No RAD, eles são importantes pq ajudam a validar se o sistema está indo na direção certa.

O feedback frequente evita que a equipe passe muito tempo criando algo que não atende bem ao usuário.

## 3. Python e desenvolvimento rápido

Python combina com RAD pq tem sintaxe simples e muitos pacotes prontos.

Isso ajuda a criar aplicações de forma mais rápida, sem precisar construir tudo do zero.

Python pode ser usado para:

- lógica do sistema;
- automação;
- banco de dados;
- análise de dados;
- interfaces gráficas;
- scripts e protótipos.

A ideia não é que Python elimina o trabalho do dev, mas que facilita o desenvolvimento e reduz código repetitivo.

## 4. Frameworks e bibliotecas

Em projetos RAD, a escolha de framework deve considerar se ele ajuda a desenvolver mais rápido.

Um bom framework deve:

- facilitar a criação do app;
- reduzir retrabalho;
- permitir mudanças;
- ter recursos prontos;
- combinar com o objetivo do sistema.

A escolha não deve ser feita só por aparência, licença ou popularidade.

## 5. Arquivos em Python

Para abrir arquivos em Python, usamos `open()`.

Modos principais:

| Modo | Uso |
| :--- | :--- |
| `"r"` | leitura |
| `"w"` | escrita, sobrescreve o arquivo |
| `"a"` | adiciona conteúdo no final |
| `"rb"` | leitura em modo binário |
| `"x"` | cria um arquivo novo |

Para ler um arquivo:

```python
data = open("informacoes.txt", "r").read()
```

Para abrir um CSV para leitura:

```python
arquivo = open("dados.csv", "r")
```

Cuidado com `"w"`, pq ele pode apagar o conteúdo anterior do arquivo.

## 6. Listas, strings e `join`

O método `join` junta vários elementos de uma lista em uma única string.

Exemplo com vírgula:

```python
nomes = ["Ana", "Leo", "João"]
texto = ",".join(nomes)
```

Resultado:

```txt
Ana,Leo,João
```

Para colocar cada item em uma linha, usamos `\n`:

```python
texto = "\n".join(nomes)
```

Resultado:

```txt
Ana
Leo
João
```

Resumo:

- `join` junta;
- `\n` quebra linha;
- o resultado pode ser armazenado em variável;
- depois pode ser gravado em arquivo.

## 7. Exceções em Python

Exceções servem para tratar erros sem deixar o programa parar de forma inesperada.

A estrutura básica é:

```python
try:
    # código que pode dar erro
except:
    # tratamento do erro
```

O cuidado principal é a ordem dos `except`.

Exceções específicas devem vir antes de `Exception`, pq `Exception` é genérica.

Forma melhor:

```python
try:
    ...
except FileNotFoundError:
    print("Arquivo ou diretório não encontrado")
except OSError:
    print("Erro de sistema")
except Exception:
    print("Erro geral")
```

Se `Exception` vier primeiro, ela pode capturar o erro antes dos tratamentos específicos.

## 8. SQLite e SQL básico

SQLite é um banco de dados leve, bastante usado com Python para aplicações simples, protótipos e estudos.

Comandos principais:

| Comando | Função |
| :--- | :--- |
| `INSERT INTO` | inserir dados |
| `SELECT` | consultar dados |
| `WHERE` | filtrar resultados |
| `UPDATE` | atualizar dados |
| `DELETE FROM` | apagar dados |
| `ALTER TABLE` | alterar estrutura da tabela |

Exemplo:

```sql
SELECT nome, idade
FROM pessoas
WHERE idade >= 18;
```

Pontos importantes:

- `SELECT` consulta dados;
- `INSERT INTO` insere dados;
- `WHERE` filtra os dados consultados.

## 9. Objetos Python e banco de dados

Uma classe Python pode representar uma entidade do banco.

Exemplo:

```python
class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade
```

Nesse caso, `nome` e `idade` podem corresponder às colunas de uma tabela.

A função `vars()` transforma os atributos de um objeto em um dicionário:

```python
pessoa = Pessoa("Leo", 24)
print(vars(pessoa))
```

Resultado:

```python
{"nome": "Leo", "idade": 24}
```

Isso pode ajudar na hora de preparar dados para inserir no banco.

## 10. Chave estrangeira no SQLite

Chave estrangeira serve para manter a integridade referencial entre tabelas.

Exemplo simples:

- uma venda pertence a um cliente;
- uma compra pertence a um usuário;
- um item pertence a um pedido.

No SQLite, a verificação de chave estrangeira pode precisar ser ativada:

```sql
PRAGMA foreign_keys = ON;
```

Sem isso, dependendo da configuração, o SQLite pode não validar as relações como esperado.

## 11. Tkinter

Tkinter é usado para criar interfaces gráficas em Python.

Com ele é possível criar:

- janelas;
- botões;
- campos de entrada;
- textos;
- menus.

Exemplo básico:

```python
import tkinter as tk

janela = tk.Tk()

texto = tk.Text(janela, height=2, width=30)
texto.pack()

texto.insert(tk.END, "Primeira linha\nSegunda linha\n")

tk.mainloop()
```

Pontos importantes:

- `tk.Tk()` cria a janela;
- `Text` cria uma área de texto;
- `insert` insere texto;
- `tk.END` indica o final;
- `mainloop()` mantém a interface aberta.

## 12. Modelagem de dados

Modelagem de dados é a etapa em que pensamos como os dados serão organizados.

Ela envolve:

- identificar entidades;
- definir atributos;
- criar relacionamentos;
- entender como os dados serão armazenados.

Um recurso comum é o **DER**, Diagrama Entidade-Relacionamento.

Exemplo:

```txt
Cliente ─── faz ─── Pedido
Pedido ─── possui ─── Item
```

No RAD, a modelagem pode evoluir conforme o projeto muda.

## 13. Levantamento de requisitos

Levantamento de requisitos é a etapa em que buscamos entender o que o sistema precisa fazer.

Algumas técnicas:

| Técnica | Uso |
| :--- | :--- |
| Entrevista | Conversar com usuários e stakeholders |
| Observação | Ver como o usuário trabalha na prática |
| Brainstorming | Levantar ideias |
| Casos de uso | Descrever interações entre usuário e sistema |

A observação é importante pq nem sempre o usuário explica tudo o que faz. Muitas vezes, vendo o processo real, o dev entende melhor o problema.

## 14. Resumo final pra revisar

Antes da prova, lembrar:

- RAD é desenvolvimento rápido, iterativo e com feedback.
- Stakeholders participam para validar o sistema.
- Python ajuda no RAD por ser simples e ter muitos pacotes.
- Framework bom para RAD é o que acelera o desenvolvimento.
- `open(..., "r")` abre arquivo para leitura.
- `join` junta lista em string.
- `\n` quebra linha.
- Exceções específicas devem vir antes de `Exception`.
- `INSERT INTO` insere dados.
- `SELECT` consulta dados.
- `WHERE` filtra dados.
- `vars()` transforma objeto em dicionário.
- `PRAGMA foreign_keys = ON` ativa chave estrangeira no SQLite.
- Tkinter cria interface gráfica.
- DER ajuda na modelagem de dados.
- Requisitos podem ser levantados por entrevista, observação e brainstorming.
