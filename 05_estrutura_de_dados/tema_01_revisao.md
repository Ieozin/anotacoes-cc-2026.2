# Revisão de Prova: Estrutura de Dados

**Data:** 26/06/2026 | **Status:** Resumo para estudo

## 1. Biblioteca `stdio.h` em C

Em C, a biblioteca `stdio.h` reúne funções de entrada e saída padrão.

A função mais lembrada é:

```c
printf("texto");
```

Ela serve para imprimir informações na tela.

Outras funções comuns da `stdio.h`:

- `scanf`: entrada pelo teclado;
- `printf`: saída na tela;
- `fopen`: abrir arquivo;
- `fclose`: fechar arquivo.

Resumo:

```txt
stdio.h → entrada e saída padrão
printf → imprime na tela
scanf → lê dados
```

## 2. `struct` em C

`struct` é uma estrutura que agrupa vários dados relacionados.

Ela é útil quando precisamos representar uma entidade com mais de uma informação.

Exemplo de posição 3D:

```c
struct Posicao {
    float x;
    float y;
    float z;
};
```

Exemplo de livro:

```c
struct Livro {
    char titulo[100];
    char autor[100];
    int ano;
    int emprestado;
};
```

A `struct` é uma estrutura heterogênea, pq pode juntar tipos diferentes no mesmo bloco.

Exemplo:

```txt
Livro → título, autor, ano, status
Produto → código, descrição, quantidade, preço
Posição → x, y, z
```

## 3. Acesso a membros de `struct`

Para acessar membros de uma variável `struct`, usamos o operador ponto:

```c
produto.preco = 10.50;
```

Quando temos um ponteiro para `struct`, usamos o operador seta:

```c
produtoPtr->preco = 10.50;
```

Resumo:

| Caso | Operador |
| :--- | :--- |
| Variável `struct` | `.` |
| Ponteiro para `struct` | `->` |

Essa diferença costuma cair bastante.

## 4. Variáveis globais

Variáveis globais são declaradas fora das funções.

Elas podem ser acessadas por várias partes do programa e ficam disponíveis durante toda a execução.

Exemplo:

```c
int contador = 0;

void incrementar() {
    contador++;
}
```

Ponto importante:

- global → fora das funções;
- local → dentro de uma função/bloco;
- parâmetro → valor recebido por uma função.

Variáveis globais funcionam, mas devem ser usadas com cuidado, pq podem deixar o código mais difícil de controlar.

## 5. Listas

Lista é uma coleção ordenada de elementos.

A busca e o acesso podem ser feitos a partir do primeiro elemento, chamado de cabeça da lista.

Tipos comuns:

- lista simplesmente encadeada;
- lista duplamente encadeada.

### Lista simplesmente encadeada

Cada nó guarda o dado e um ponteiro para o próximo nó.

```txt
[10] -> [20] -> [30] -> NULL
```

### Lista duplamente encadeada

Cada nó guarda o dado, um ponteiro para o próximo e outro para o anterior.

```txt
NULL <- [10] <-> [20] <-> [30] -> NULL
```

Ela usa mais memória que a lista simples, pq cada nó tem dois ponteiros.

Vantagem: permite navegar para frente e para trás.

## 6. Pilha

Pilha segue o princípio **LIFO**:

```txt
Last In, First Out
```

Ou seja: o último elemento que entra é o primeiro que sai.

Operações principais:

| Operação | Função |
| :--- | :--- |
| `push` | insere no topo |
| `pop` | remove do topo |
| `peek` | consulta o topo sem remover |

Exemplo:

```txt
push(10)  → [10]
push(20)  → [10, 20]
pop()     → [10]
push(30)  → [10, 30]
peek()    → 30
```

Usos comuns de pilha:

- Ctrl+Z / desfazer;
- histórico;
- chamadas de função;
- análise de expressões.

## 7. Fila

Fila segue o princípio **FIFO**:

```txt
First In, First Out
```

Ou seja: o primeiro elemento que entra é o primeiro que sai.

Exemplo:

```txt
inserir(10) → [10]
inserir(20) → [10, 20]
remover()   → [20]
```

Resumo:

| Estrutura | Regra |
| :--- | :--- |
| Pilha | LIFO |
| Fila | FIFO |

## 8. Fila circular

Fila circular usa um vetor como se o final voltasse para o começo.

Isso permite reaproveitar posições livres.

A fórmula principal é:

```c
fim = (fim + 1) % MAX;
```

O operador `%` faz o índice voltar para `0` quando chega ao tamanho máximo.

Exemplo com `MAX = 5`:

```txt
(fim + 1) % 5
```

Se `fim` for `4`:

```txt
(4 + 1) % 5 = 0
```

Isso evita passar do limite do array.

## 9. Tabela Hash

Tabela Hash é uma estrutura usada para acessar dados rapidamente a partir de uma chave.

Ela usa uma função hash para transformar a chave em um índice.

Exemplo:

```txt
chave → função hash → índice
```

Se a tabela tem tamanho 10, os índices vão de 0 a 9.

Um exemplo de função hash é somar valores ASCII e aplicar módulo:

```txt
"Ana"
A = 65
n = 110
a = 97

65 + 110 + 97 = 272
272 % 10 = 2
```

Então a chave `"Ana"` iria para o índice `2`.

## 10. Colisões em Hash

Colisão acontece quando duas chaves diferentes geram o mesmo índice.

Exemplo:

```txt
Carlos → índice 3
Amanda → índice 3
```

Existem duas estratégias comuns:

### Encadeamento

Também chamado de **chaining**.

Quando duas chaves caem no mesmo índice, elas ficam em uma lista naquele índice.

```txt
índice 3 → Carlos -> Amanda
```

### Endereçamento aberto

Procura outra posição livre dentro da própria tabela.

Um exemplo é a sondagem linear, que tenta o próximo índice livre.

Resumo:

| Estratégia | Ideia |
| :--- | :--- |
| Encadeamento | Usa lista no índice |
| Endereçamento aberto | Procura outra posição livre na tabela |

## 11. Árvores binárias

Árvore binária é uma estrutura hierárquica em que cada nó pode ter até dois filhos:

- filho esquerdo;
- filho direito.

Exemplo:

```txt
    1
   / \
  2   3
 /
4
```

Termos importantes:

| Termo | Significado |
| :--- | :--- |
| Raiz | Nó principal da árvore |
| Filho | Nó abaixo de outro |
| Folha | Nó sem filhos |
| Altura | Distância da raiz até o nível mais profundo |
| Subárvore | Parte da árvore a partir de um nó |

## 12. Árvore Binária de Busca

BST significa **Binary Search Tree**, ou Árvore Binária de Busca.

A regra principal é:

```txt
menores à esquerda
maiores à direita
```

Exemplo:

```txt
        55
      /    \
    35      75
   /  \    /  \
 25   45 65   85
```

Essa árvore é uma BST pq:

- 35 é menor que 55, então fica à esquerda;
- 75 é maior que 55, então fica à direita;
- 25 é menor que 35;
- 45 é maior que 35;
- 65 é menor que 75;
- 85 é maior que 75.

Com palavras, a comparação segue ordem alfabética.

Exemplo:

```txt
Goiaba vem antes de Limão
```

Então `"Goiaba"` fica à esquerda de `"Limão"`.

## 13. Percursos em árvore

Percorrer uma árvore significa visitar seus nós em alguma ordem.

Os principais percursos são:

| Percurso | Ordem |
| :--- | :--- |
| Pré-ordem | raiz → esquerda → direita |
| Em-ordem | esquerda → raiz → direita |
| Pós-ordem | esquerda → direita → raiz |

Exemplo:

```txt
    1
   / \
  2   3
 /
4
```

Pós-ordem:

```txt
4, 2, 3, 1
```

Pq visita primeiro a esquerda, depois a direita, e por último a raiz.

## 14. Algoritmos de ordenação

### Selection Sort

Selection Sort procura o menor elemento e coloca na posição correta.

Ideia:

```txt
procura o menor → troca com a posição atual → repete
```

A parte ordenada vai crescendo da esquerda para a direita.

### Bubble Sort

Bubble Sort compara elementos vizinhos e troca se estiverem fora de ordem.

Ideia:

```txt
compara par a par → troca se necessário → maior vai "subindo"
```

Complexidade comum:

- pior caso: `O(n²)`;
- caso médio: `O(n²)`;
- melhor caso: pode ser `O(n)` se o vetor já estiver ordenado e o algoritmo tiver verificação de troca.

### Insertion Sort

Insertion Sort monta a parte ordenada inserindo cada elemento na posição correta.

É bom para entradas pequenas ou quase ordenadas.

### Merge Sort

Merge Sort divide o vetor, ordena as partes e depois junta.

Costuma usar espaço adicional `O(n)`.

## 15. Complexidade de espaço

Complexidade de espaço mede quanta memória extra o algoritmo usa.

Alguns algoritmos são **in-place**, ou seja, usam pouca memória adicional.

Exemplos que podem ser in-place:

- Bubble Sort;
- Insertion Sort;
- Selection Sort.

Esses podem usar `O(1)` de espaço extra.

Merge Sort normalmente usa `O(n)` de espaço adicional.

Resumo:

| Algoritmo | Espaço extra comum |
| :--- | :--- |
| Bubble Sort | `O(1)` |
| Insertion Sort | `O(1)` |
| Selection Sort | `O(1)` |
| Merge Sort | `O(n)` |

## 16. Resumo final pra revisar

Antes da prova, lembrar:

- `stdio.h` tem funções de entrada e saída, como `printf`;
- `struct` agrupa dados relacionados e de tipos diferentes;
- usa `.` para acessar membro de `struct`;
- usa `->` quando é ponteiro para `struct`;
- variável global fica fora das funções;
- lista é coleção ordenada de elementos;
- lista duplamente encadeada tem ponteiro para anterior e próximo;
- pilha segue LIFO;
- fila segue FIFO;
- `push` insere no topo;
- `pop` remove do topo;
- `peek` consulta o topo;
- fila circular usa `(fim + 1) % MAX`;
- hash transforma chave em índice;
- colisão é quando duas chaves caem no mesmo índice;
- chaining usa lista no índice;
- BST coloca menores à esquerda e maiores à direita;
- pós-ordem é esquerda, direita e raiz;
- Selection Sort seleciona o menor;
- Bubble Sort compara vizinhos;
- Bubble Sort pode ser `O(n)` no melhor caso otimizado;
- Merge Sort pode usar `O(n)` de espaço;
- algoritmos in-place usam `O(1)` de espaço extra.
