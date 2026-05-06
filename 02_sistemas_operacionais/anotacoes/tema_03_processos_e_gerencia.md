# Tema 03: Processos e Gerência de Processador
**Data:** 05/05/2026 | **Status:** Concluído

## 1. O que é um Processo?
Um programa parado no HD é só um arquivo passivo. Quando vc manda rodar, ele vira um **Processo** (uma entidade ativa).
Em sistemas modernos, a CPU fica pulando de um processo pro outro super rápido pra dar a ilusão de q tá tudo rodando ao mesmo tempo (**Pseudoparalelismo**).

Pra gerenciar isso, o SO guarda o **Contexto** do processo (Context Switch / Mudança de Contexto):
- **Hardware:** O q tava nos registradores da CPU quando o processo pausou.
- **Software:** PID (ID do processo), permissões, prioridade.
- **Espaço de Endereçamento:** A fatia de RAM q o processo pode acessar.

## 2. Ciclo de Vida e Estados
O processo nasce, roda, pausa e morre. 

| Estado | O que tá rolando? |
| :--- | :--- |
| **Novo** | Sendo criado pelo SO. |
| **Pronto** | Só esperando a CPU ficar livre pra rodar. |
| **Executando** | Tá na CPU processando instruções. |
| **Bloqueado** | Pausou pq tá esperando algo (ex: usuário digitar, ler arquivo no HD). Não usa CPU aqui. |
| **Terminado** | Acabou ou deu erro fatal. O SO limpa a RAM dele. |

## 3. Processos vs Threads (A Concorrência)
Criar processo novo é pesado (gasta muita RAM e tempo). Pra resolver isso, inventaram as **Threads** (processos leves).

| Característica | Subprocesso (Pai/Filho) | Thread |
| :--- | :--- | :--- |
| **Memória (RAM)** | Espaços **independentes**. Um não enxerga a variável do outro. | Compartilham o **mesmo espaço**. Podem alterar a mesma variável. |
| **Criação no Linux** | Chamada `fork()` | Chamada `clone()` |
| **Segurança** | Alta (um não quebra o outro). | Baixa (se uma thread fizer merda na memória, quebra o processo todo). |
| **Desempenho** | Mudança de contexto é lenta (pesada). | Mudança de contexto é muito mais rápida. |

> No Linux, na real, tudo é tratado como **Tarefa (Task)**. Ele usa o truque do **Copy-on-Write (Cópia na Escrita)**: quando rola um `fork()`, pai e filho compartilham a mesma RAM até alguém tentar alterar uma variável. Só aí o Linux copia a memória de verdade.

```c
// Pegadinha clássica de C no Linux: Entendendo o fork()
#include <unistd.h>

int pid = fork(); // Cria o processo filho

if (pid < 0) {
    // Erro na criação
} else if (pid == 0) {
    // Aqui é o FILHO executando. Ele recebe 0.
    // Se quiser rodar outro programa do zero, chama o execve() aqui.
} else {
    // Aqui é o PAI executando. Ele recebe o PID do filho.
    waitpid(pid, NULL, 0); // Pai espera o filho terminar pra não criar processo zumbi
}
```

## 4. Sincronização (Evitando o Caos)
Quando processos ou threads dividem a mesma variável, rola a **Condição de Corrida**: o resultado final depende de quem chegou primeiro na CPU.

- **Região Crítica (RC):** É o pedaço do código q altera a variável compartilhada. Só um processo pode entrar aí por vez (**Exclusão Mútua**).
- **Semáforos:** O jeito de trancar a porta da RC. 
  - `down`: Tenta entrar. Se tiver trancado, dorme (bloqueia).
  - `up`: Sai da RC e acorda quem tava esperando na fila.
- **Pipes (`|`):** Jeito de passar a saída de um processo direto pra entrada de outro (ex: `cat log.txt | sort`).
- **Sinais:** Avisos assíncronos do SO (ex: `SIGKILL` pra matar na força bruta, `SIGINT` q é o famoso `Ctrl+C`).

## 5. Escalonamento (A Fila da CPU)
O **Escalonador** decide quem sai do estado "Pronto" e vai pro "Executando".
Tipos de Processo:
- **CPU-bound:** Frita o processador (cálculo matemático, render de vídeo).
- **I/O-bound:** Passa mais tempo bloqueado esperando disco/rede (sistemas web, banco de dados).

| Algoritmo | Preemptivo? | Como funciona |
| :--- | :--- | :--- |
| **FIFO (First In, First Out)** | Não | O primeiro q chega, roda até acabar. Péssimo pra sistemas interativos. |
| **SJF (Shortest Job First)** | Não | Roda o menor processo primeiro. Difícil adivinhar o tempo no mundo real. |
| **Round Robin (Circular)** | Sim | Cada um ganha uma fatia de tempo (*Quantum*). Acabou o tempo? Vai pro fim da fila. |
| **Prioridade** | Sim | Processos mais importantes rodam antes. *Prioridade Dinâmica* aumenta a prioridade de quem tá esperando muito pra não morrer de inanição (*starvation*). |
| **Cooperativo** | Não | O próprio programa tem q ser bonzinho e devolver a CPU pro SO. Se travar, trava o PC todo (Windows antigo era assim). |

## Pontos de Atenção
> **⚠️ Fórmula de Escalonamento em Tempo Real:** Pra saber se um sistema de tempo real aguenta a carga, usa-se: $\sum \frac{C_i}{P_i} \le 1$ (onde C é o tempo de execução e P é o período). Se passar de 1 (100%), o sistema não dá conta e vai perder prazo.
> **⚠️ O truque do I/O-bound:** Em algoritmos de prioridade dinâmica, o SO costuma *aumentar* a prioridade de processos I/O-bound. Como eles usam pouca CPU e bloqueiam rápido, dar a vez pra eles melhora a interatividade do PC sem ferrar os CPU-bound.
> **⚠️ Padrão Linux:** O Linux usa múltiplas filas. As de Tempo Real (Prioridade 0 a 99) têm preferência absoluta e não competem com as de Tempo Compartilhado (Prioridade 100 a 139 - usuários normais). O comando `nice` só deixa vc piorar sua própria prioridade, nunca melhorar.
