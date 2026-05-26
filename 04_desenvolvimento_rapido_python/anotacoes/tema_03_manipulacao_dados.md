# Tema 03: Manipulação de Dados em Arquivos
**Data:** 26/05/2026 | **Status:** Concluído

## 1. Lidando com Arquivos (O Básico)
No Python, a porta de entrada para ler ou gravar arquivos é a função nativa `open(caminho, modo)`. O caminho pode ser **absoluto** (a rota completa, ex: `C:\dados\texto.txt`) ou **relativo** (a partir da pasta onde o script está rodando).

**Modos de Abertura:**
- **`r` (Read):** Leitura. É o padrão. Dá erro (`FileNotFoundError`) se o arquivo não existir.
- **`w` (Write):** Escrita. Cuidado: ele zera o arquivo e escreve tudo de novo por cima.
- **`a` (Append):** Acrescentar. Mantém o que já existe e escreve na última linha.
- **`b` (Binary):** Modo binário (ex: `rb`, `wb`), usado para ler imagens ou executáveis.

**Como ler os dados:**
- `read()`: Traz o texto inteiro de uma vez só como uma String gigante.
- `readline()`: Lê só a linha atual. Perfeito para não estourar a memória RAM em arquivos pesados.
- `readlines()`: Retorna uma lista, onde cada item é uma linha do arquivo.

> **🔥 A Boa Prática (`with`):** O jeito amador é usar o `open()` e depois ter que lembrar de chamar o `close()`. O jeito profissional é usar o bloco de contexto: `with open('dados.txt', 'r') as arquivo:`. Ele fecha o arquivo sozinho no final, mesmo se o seu código der pau no meio da execução.

## 2. Manipulação de Strings (Limpando a bagunça)
Quando a gente puxa dados de um TXT, quase sempre vem lixo junto (como espaços extras e o caractere de pular linha `\n`). O Python tem métodos excelentes para limpar isso:

- **`.strip()`:** Arranca os espaços em branco e o `\n` das pontas da string.
- **`.split('separador')`:** Fatiador de strings. Corta o texto usando o separador que você escolher e devolve uma lista. Sem parâmetro, ele corta nos espaços em branco.
- **`.join(lista)`:** O contrário do split. Pega uma lista e costura tudo numa String só. Ex: `", ".join(minha_lista)`.
- **`.count('palavra')`:** Conta quantas vezes uma palavra aparece na string.

**F-Strings (A melhor coisa do Python moderno):**
Juntar variáveis com texto costumava ser chato. Hoje, basta colocar a letra `f` antes das aspas e jogar as variáveis entre chaves `{}`.
*Truque de formatação:* `f"O preço é R$ {valor:.2f}"` (Trava o número float em apenas 2 casas decimais).

## 3. Tratamento de Exceções (`try / except`)
Mexer com arquivos é pedir pra dar erro (o arquivo sumiu, o usuário não tem permissão, a pasta mudou de nome). Para o código não quebrar feio e fechar na cara do usuário, usamos o tratamento de exceção.

```python
try:
    with open("config.txt", "r") as arquivo:
        dados = arquivo.read()
except FileNotFoundError:
    print("O arquivo não existe! Verifique o caminho.")
except PermissionError:
    print("Você não tem permissão para abrir isso.")
except Exception as e:
    print(f"Deu um erro genérico: {e}")
```

## 4. O Sistema Operacional (`os` e `shutil`)

Para interagir fisicamente com as pastas do seu computador, o Python traz esses dois módulos embutidos:

* `os.remove('arquivo.txt')`: Deleta um arquivo direto.
* `os.rename('velho.txt', 'novo.txt')`: Renomeia.
* `os.mkdir('nova_pasta')`: Cria uma pasta.
* `os.rmdir('pasta')`: Exclui a pasta (mas ATENÇÃO, ela precisa estar 100% vazia).
* `os.scandir('caminho')`: Vasculha a pasta e te diz o que tem lá dentro (se é arquivo ou subpasta).
* **`shutil.move('origem', 'destino')`:** O cara da logística. Move arquivos de uma pasta para outra fisicamente.


