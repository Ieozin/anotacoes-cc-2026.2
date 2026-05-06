# Tema 04: Memória
**Data:** 06/05/2026 | **Status:** Concluído

## 1. Como a Memória Funciona e MMU
O processo não enxerga a memória física (RAM real), ele enxerga um espaço **Lógico (Virtual)**. Quem faz a tradução (mapeamento) do endereço lógico pro endereço físico é um hardware chamado **MMU (Memory Management Unit)**.

**O layout da memória de um processo:**
- **Text:** Código do programa (apenas leitura).
- **Data:** Variáveis globais.
- **Heap:** Alocação dinâmica (variáveis criadas em tempo de execução). Cresce pra cima.
- **Pilha (Stack):** Funções, variáveis locais, retorno de chamadas. Cresce pra baixo (em direção ao Heap).

**Proteção e Relocação:**
Pra um processo não invadir a memória do outro, a MMU checa dois registradores: o **Base** (onde começa) e o **Limite** (tamanho máximo). Se o endereço pedido passar do limite, o SO gera um erro de violação (exceção). A **Relocação Dinâmica** permite que um processo seja tirado da RAM, vá pro disco, e volte depois para um endereço físico completamente diferente.

## 2. Políticas de Alocação e Fragmentação
Como o SO guarda os processos na RAM:
- **Partições Fixas:** RAM dividida em pedaços do mesmo tamanho. Muito desperdício.
- **Partições Variáveis:** O processo ganha o tamanho exato que precisa.
- **Swap:** O processo tá bloqueado? O SO tira ele da RAM inteirinho, joga no HD (Swap Out) e põe outro no lugar (Swap In). É lento demais e quase não se usa inteiro hoje em dia (foi substituído pela paginação).

### Algoritmos de Alocação de Partição Variável
| Política | Como funciona? | Prós / Contras |
| :--- | :--- | :--- |
| **First-Fit** | Coloca no 1º buraco livre q couber. | Rápido, mas bagunça a memória. |
| **Best-Fit** | Procura o buraco com o tamanho *mais próximo* do processo. | Deixa os menores fragmentos soltos, mas é lento (busca a RAM toda). |
| **Worst-Fit** | Põe no *maior* buraco disponível. | Deixa um espaço grande q pode ser usado depois, mas é contra-intuitivo. |

## 3. Memória Virtual e Paginação
Pra rodar programas maiores q a RAM física, o SO finge q tem RAM infinita. 
- O processo é fatiado em **Páginas** (tamanho lógico fixo, ex: 4KB).
- A RAM é fatiada em **Quadros ou Molduras (Frames)** (mesmo tamanho da página).
Nem tudo do programa fica na RAM de uma vez (Paginação sob demanda).

### Page Fault (Falta de Página) e Substituição
Se a CPU pede uma página que tá no disco e não na RAM, rola o **Page Fault**. O SO pausa o processo, busca no disco, joga num Quadro da RAM e avisa a CPU. 
Se a RAM tiver cheia, alguém tem q sair. Quem sai?
- **LRU (Least Recently Used):** Tira a página q não é acessada há mais tempo. (Bom, mas muito pesado pro SO rastrear).
- **Segunda Chance (Algoritmo do Relógio):** Aproximação do LRU. O SO olha o "bit de referência". Se for 1, ele zera (dá uma segunda chance) e vai pra próxima. Se for 0, é ejetada.
- **Segmentação:** Diferente da paginação (q é divisão física fixa), a segmentação divide o programa pela lógica (segmento do código, segmento dos dados, etc) com tamanhos variados.

## 4. O Jeito Linux de Gerenciar Memória
O Linux divide a RAM em "Zonas" (ex: `ZONE_DMA`, `ZONE_NORMAL`). 
- **O truque do `fork()` (Copy-on-Write):** Quando cria um processo filho, o Linux não copia a RAM toda. Pai e filho apontam pras mesmas Páginas físicas. O SO só faz uma cópia real se um dos dois tentar *gravar/alterar* uma variável.
- **Bibliotecas Compartilhadas (Vinculação Dinâmica):** Em vez de copiar o código de bibliotecas nativas do Linux pra dentro de cada .exe (Vinculação Estática), vários programas apontam pra mesma biblioteca carregada uma vez só na RAM.

```bash
# Comandos pra checar a memória no terminal:
free -m      # Mostra a RAM e Swap livres/usadas em Megabytes
htop         # Mostra os processos e o uso de CPU/RAM bonitinho e colorido
vmstat       # Relatório de memória virtual, processos e I/O
```

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (Tipos de Fragmentação):** > - **Fragmentação Interna:** Sobra espaço *dentro* do bloco alocado pro processo (ex: Partição fixa).
> - **Fragmentação Externa:** Sobram buracos picados *entre* os processos na RAM que, somados, caberiam um processo novo, mas como não estão juntos (contíguos), o SO não consegue alocar.
> **⚠️ Erro Clássico:** Achar que *Page Fault* é um erro do seu código ou que o programa vai fechar. É um comportamento normal e esperado do SO pra puxar coisas do disco pra RAM.
> **⚠️ Como a Memória Livre é Gerenciada:** **Mapa de Bits** (fácil mas muito lento pra achar bloco grande vazio) vs **Lista Encadeada** (mais rápido, junta blocos vazios vizinhos).
