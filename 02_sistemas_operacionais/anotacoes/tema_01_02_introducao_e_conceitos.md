# Tema 01 e 02: Introdução e Conceitos Básicos de SO
**Data:** 29/04/2026 | **Status:** Concluído

## 1. O Roadmap da Matéria
O Sistema Operacional (SO) é o "gerente de bastidores" do PC. Sem ele, a gente teria q codar em linguagem de máquina direto pro processador. O q vamos ver nesse semestre:
1. **Conceitos Básicos:** O q é, histórico e arquitetura.
2. **Processos e Processador:** Como o PC faz várias coisas "ao mesmo tempo" (Threads, Concorrência).
3. **Memória:** Como ele divide a RAM e usa a Memória Virtual.
4. **Sistema de Arquivos:** Como o Linux guarda os dados.
5. **Automação:** Shell Script e CRON (pra não fazer trabalho braçal).

## 2. Conceitos e Modos de Acesso
O SO é a ponte entre o Hardware e os Aplicativos. Ele abstrai a complexidade física.
Pra não deixar qualquer app quebrar o PC, o hardware divide o acesso em dois modos:
- **Modo Usuário:** Acesso limitado. É onde rodam os programas normais.
- **Modo Kernel (Núcleo ou Supervisor):** Acesso TOTAL ao hardware. Só o SO roda aqui. Se um app precisa de algo físico (ler disco, usar rede), ele tem q pedir permissão pro SO.

## 3. A Evolução (Gerações)
| Geração | Época | Destaques |
| :--- | :--- | :--- |
| **1ª (1945-55)** | Válvulas | Sem SO. Programação em painéis físicos. |
| **2ª (1955-65)** | Transistores | **Lote (Batch):** Gravava tudo em fita e processava de uma vez. |
| **3ª (1965-80)** | Circuitos (CIs) | **Time-sharing (Tempo compartilhado)**, Multiprocessamento, origem do UNIX. |
| **4ª (1980-Hoje)**| Microchips | PCs, Interfaces Gráficas (GUI), Redes, Linux (1991 por Linus Torvalds). |

## 4. Tipos de Sistemas e Licenças
- **Monotarefa (Monoprogramável):** O processador fica ocioso esperando o disco ler (I/O). Desperdício de tempo.
- **Multitarefa (Multiprogramável):** Vários processos rodam concorrentemente. Se um vai pro disco, a CPU já puxa outro processo.
- **Tempo Real:** 
  - *Crítico:* Se perder o prazo, dá merda grave (ex: controle de avião).
  - *Não Crítico:* Se atrasar, só dá uma travadinha (ex: streaming de vídeo).

### Múltiplos Processadores
- **Fortemente Acoplados:** Dividem a mesma memória. Pode ser **SMP** (acesso igual à memória) ou **NUMA** (acesso varia pela distância física).
- **Fracamente Acoplados:** Cada PC tem sua memória e SO, ligados por rede (Sistemas Distribuídos).

### Licenças de Software
- **Proprietário:** Código fechado (ex: Windows).
- **Livre (Free):** Tem 4 liberdades (rodar, estudar/ver código, redistribuir, modificar e lançar pra comunidade). Ex: Licença GNU.
- **Open Source:** Código aberto, mas não segue todas as regras xiitas do Software Livre à risca.

## 5. O Kernel e System Calls
O **Kernel** é o coração do SO. Faz gerência de memória, processos, arquivos, etc.
Pra um app (modo usuário) acessar o Kernel, ele usa uma **System Call (Chamada de Sistema)**.

**Como funciona o System Call?**
1. O app joga os parâmetros na pilha e chama a rotina.
2. Rola a instrução **TRAP**: O processador muda do modo usuário pro modo Kernel.
3. O SO executa a parada, volta pro modo usuário e devolve o resultado pro app.

*Padrão POSIX:* Tentativa de padronizar as system calls de todos os sistemas baseados em Unix pra facilitar a vida do dev. O Win32 (Windows) tem suas próprias chamadas, totalmente diferentes.

## 6. Arquiteturas de Kernel
Como o núcleo é montado por dentro:
| Arquitetura | O q é? | Vantagem / Desvantagem |
| :--- | :--- | :--- |
| **Monolítica** | Um programão gigante de compilado único (tudo junto misturado). | **Vantagem:** Muito rápido. **Desvantagem:** Um bug num driver derruba o PC todo. |
| **Camadas** | SO dividido em níveis (hierarquia). | **Vantagem:** Seguro e fácil de arrumar. **Desvantagem:** Lento (muita comunicação entre camadas). |
| **Microkernel** | O Kernel só faz o básico do básico. O resto (drivers, etc) roda no Modo Usuário. | **Vantagem:** Alta confiabilidade. Se um serviço falhar, o SO não trava. |
| **Máquinas Virtuais** | Cria um Hypervisor q simula hardwares inteiros. | Pode rodar vários SOs no mesmo hardware físico ao mesmo tempo. |

## 7. Linux: Estrutura e Comandos Básicos
O Linux é *Case-Sensitive* (maiúscula e minúscula são coisas diferentes).
- **Usuário Root:** O Super Usuário (Deus no sistema). No terminal, o prompt fica com `#`. Usuário normal fica com `$`.

| Diretório | Pra que serve? |
| :--- | :--- |
| `/` | A Raiz de tudo. |
| `/bin` e `/sbin` | Executáveis básicos e do sistema. |
| `/etc` | Arquivos de configuração. |
| `/home` | Pasta pessoal dos usuários. |
| `/dev` | Dispositivos de hardware. |


```bash
# Comandos básicos no Terminal
pwd        # Mostra a pasta atual (Print Working Directory)
cd /home   # Entra na pasta /home
mv a.txt b # Move ou renomeia arquivos
mkdir      # Cria uma pasta nova

# Passos clássicos pra compilar um código-fonte baixado no Linux:
./configure
make
make install
```

## Pontos de Atenção
> **⚠️ Fórmula de uso da CPU (Multitarefa):** A fórmula é $U_{cpu} = 1 - p^n$, onde `p` é a % de tempo esperando E/S e `n` é a quantidade de processos.
> **⚠️ Pegadinha de Prova (Microkernel vs Monolítico):** Se a banca falar de "alta confiabilidade pq o driver roda fora do núcleo", é **Microkernel**. Se falar que "um erro derruba o sistema todo", é **Monolítico**.
> **⚠️ Pegadinha de Prova (TRAP):** TRAP não é um erro! É a instrução de interrupção via software q o processador usa pra chavear do modo usuário pro modo Kernel.


