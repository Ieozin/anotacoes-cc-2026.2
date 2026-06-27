# Revisão de Prova: Sistemas Operacionais

**Data:** 26/06/2026 | **Status:** Resumo para estudo

## 1. O que é um sistema operacional

O sistema operacional é a camada que fica entre o usuário/programas e o hardware.

Ele serve para facilitar o uso do computador e controlar os recursos disponíveis.

Principais funções:

- gerenciar CPU;
- gerenciar memória;
- controlar processos;
- controlar dispositivos;
- organizar arquivos;
- oferecer serviços para os programas;
- proteger o sistema contra acessos indevidos.

Sem o sistema operacional, cada programa teria que lidar diretamente com o hardware, o que deixaria tudo mais difícil e inseguro.

Exemplos de sistemas operacionais:

- Linux;
- Windows;
- UNIX;
- Android;
- macOS.

Cuidado: Apple e Microsoft são empresas, não sistemas operacionais. Steam também não é SO.

## 2. Kernel

O kernel é o núcleo do sistema operacional.

Ele é a parte mais fundamental, pq conversa diretamente com o hardware e controla recursos importantes do sistema.

O kernel cuida de coisas como:

- processos;
- memória;
- entrada e saída;
- dispositivos;
- chamadas de sistema;
- controle de acesso a recursos.

Diferença rápida:

| Conceito | O q é? |
| :--- | :--- |
| Kernel | Núcleo do sistema operacional |
| Shell | Interface para o usuário executar comandos |
| Bootstrap | Processo de inicialização do sistema |
| Middleware | Camada intermediária entre sistemas/aplicações |
| Socket | Recurso de comunicação entre processos/redes |

## 3. Kernel monolítico e microkernel

Existem formas diferentes de organizar o kernel.

### Kernel monolítico

No kernel monolítico, muitos serviços do sistema operacional rodam no espaço de kernel.

Isso pode trazer desempenho, mas também aumenta o impacto caso algo dê errado, pq muita coisa está dentro do núcleo do sistema.

### Microkernel

No microkernel, a ideia é manter o kernel menor e deixar vários serviços rodando fora dele, no espaço de usuário.

Isso favorece modularidade, isolamento e estabilidade, mas pode gerar mais comunicação entre partes do sistema.

| Modelo | Ideia principal |
| :--- | :--- |
| Kernel monolítico | Mais serviços dentro do kernel |
| Microkernel | Kernel menor e mais modular |
| Espaço de kernel | Área privilegiada do sistema |
| Espaço de usuário | Área onde rodam aplicações e alguns serviços |

Ponto importante: kernel monolítico não é automaticamente mais seguro. Como concentra mais código no kernel, uma falha pode afetar mais partes do sistema.

## 4. Processos

Um processo é um programa em execução.

Quando um programa está rodando, ele precisa de recursos como:

- CPU;
- memória;
- arquivos;
- identificador de processo;
- permissões;
- estado de execução.

Um processo pode criar outro processo. Esse novo processo é chamado de **processo filho**.

Quando um processo termina, os recursos usados por ele devem ser liberados para o sistema reutilizar.

## 5. `init` e `systemd`

No Linux, `init` ou `systemd` costuma ser o primeiro processo iniciado pelo sistema.

Ele geralmente tem PID 1.

Funções do `systemd`/`init`:

- iniciar serviços;
- organizar a inicialização do sistema;
- gerenciar serviços em execução;
- lidar com processos órfãos;
- ajudar na limpeza de processos zumbis.

Resumo:

```txt
kernel inicia → systemd/init começa → outros serviços/processos são iniciados
```

## 6. Threads e subprocessos

Threads e subprocessos permitem executar tarefas de forma concorrente.

### Threads

Threads são como “processos leves”.

Elas compartilham recursos do mesmo processo, como memória e espaço de endereçamento.

Vantagens:

- criação mais leve;
- troca de contexto mais rápida;
- comunicação mais simples entre threads.

Desvantagens:

- compartilham dados;
- podem interferir umas nas outras;
- exigem cuidado com sincronização.

### Subprocessos

Subprocessos têm mais isolamento.

Cada processo tem seu próprio espaço de endereçamento, o que aumenta segurança e separação, mas também aumenta custo.

Vantagens:

- maior isolamento;
- melhor separação entre execuções;
- bom uso em multiprocessamento.

Desvantagens:

- criação mais custosa;
- comunicação entre processos é mais trabalhosa;
- troca de contexto costuma ser mais pesada.

| Conceito | Resumo |
| :--- | :--- |
| Thread | Mais leve, compartilha memória |
| Subprocesso | Mais isolado, mais custoso |
| Concorrência | Várias tarefas avançando no mesmo período |
| Multiprocessamento | Uso de mais de um processador/núcleo |
| Comutação de contexto | Troca da CPU de uma tarefa para outra |

## 7. `clone()`, `CLONE_VM` e copy-on-write

No Linux, threads e processos podem ser tratados como tarefas.

A chamada `clone()` permite criar tarefas com diferentes níveis de compartilhamento, dependendo das flags usadas.

Uma flag importante é:

```txt
CLONE_VM
```

Ela indica compartilhamento do mesmo espaço de memória.

Também apareceu a ideia de **copy-on-write**.

Copy-on-write evita copiar a memória inteira imediatamente quando um processo é criado. A cópia real só acontece quando alguma parte precisa ser modificada.

Resumo:

- `clone()` cria tarefas/processos com flags;
- `CLONE_VM` compartilha espaço de endereçamento;
- copy-on-write reduz custo na criação de processos;
- threads tendem a ter troca de contexto mais leve que subprocessos.

## 8. Memória virtual

A memória virtual permite que os programas enxerguem a memória de forma lógica, sem lidar diretamente com a memória física real.

Ou seja, o programa trabalha com endereços virtuais/lógicos, e o sistema traduz isso para endereços físicos.

Essa tradução envolve hardware e sistema operacional.

Componentes importantes:

| Conceito | Função |
| :--- | :--- |
| Endereço virtual/lógico | Endereço visto pelo processo |
| Endereço físico | Endereço real na RAM |
| MMU | Unidade que ajuda a traduzir endereços |
| Tabela de páginas | Estrutura usada na tradução |
| TLB | Cache de traduções recentes |

A memória virtual também ajuda na proteção:

- impede que um processo acesse memória de outro indevidamente;
- protege a memória do kernel;
- melhora estabilidade do sistema.

## 9. Falta de página, FIFO e swapping

Uma falta de página acontece quando o processo tenta acessar uma página que não está carregada na memória principal.

Quando isso ocorre, o sistema precisa buscar a página no disco e talvez remover outra página da RAM.

### FIFO

FIFO significa **First In, First Out**.

A primeira página que entrou na memória é a primeira candidata a sair.

Problema: a página mais antiga pode ainda estar sendo muito usada.

Por isso, FIFO é simples, mas pode tomar decisões ruins.

### Swapping

Swapping é quando o sistema move dados/processos entre memória RAM e disco.

Isso ajuda quando a RAM é limitada.

Resumo:

- RAM é limitada;
- disco pode ser usado como apoio;
- páginas/processos podem ser carregados quando necessário;
- acessar disco é bem mais lento que acessar RAM.

## 10. Partições, formatação e montagem no Linux

Para usar uma partição no Linux, normalmente existem três etapas:

```txt
particionar → formatar → montar
```

Comandos importantes:

| Etapa | Comando |
| :--- | :--- |
| Particionar | `fdisk` |
| Formatar | `mkfs` |
| Montar | `mount` |

Exemplo de ideia geral:

```bash
sudo fdisk /dev/sdX
sudo mkfs.ext4 /dev/sdX1
sudo mount /dev/sdX1 /mnt
```

Não precisa decorar o dispositivo exato, mas precisa entender a ordem.

## 11. Comandos básicos de Linux

Alguns comandos e atalhos importantes:

| Comando/atalho | Função |
| :--- | :--- |
| `ls` | lista arquivos |
| `ls -al` | lista detalhes e mostra ocultos |
| `clear` | limpa o terminal |
| `crontab -e` | edita tarefas agendadas do usuário |
| `CTRL + O` no Nano | salva o arquivo |
| `CTRL + X` no Nano | sai do editor |
| `CTRL + W` no Nano | busca texto |
| `CTRL + G` no Nano | ajuda |

Detalhe:

- `-a` mostra arquivos ocultos;
- `-l` mostra em formato detalhado;
- `ls -al` combina os dois.

## 12. Controle de loops

Em programação, um loop serve para repetir uma instrução.

Comandos comuns:

| Comando | Função |
| :--- | :--- |
| `while` | cria um loop enquanto a condição for verdadeira |
| `break` | interrompe o loop imediatamente |
| `continue` | pula para a próxima repetição |

Exemplo:

```python
while True:
    comando = input("Digite sair: ")

    if comando == "sair":
        break
```

Nesse caso, `break` encerra o loop.

## 13. Resumo final pra revisar

Antes da prova, lembrar:

- sistema operacional gerencia hardware e oferece serviços para programas;
- kernel é o núcleo do sistema operacional;
- shell não é kernel, é interface de comando;
- kernel monolítico concentra mais serviços no kernel;
- microkernel busca modularidade;
- processo é um programa em execução;
- processo pode criar processo filho;
- `systemd`/`init` é o primeiro processo no Linux e inicia os demais;
- threads são mais leves e compartilham memória;
- subprocessos são mais isolados e mais custosos;
- `CLONE_VM` indica compartilhamento de espaço de memória;
- copy-on-write evita cópia imediata da memória;
- memória virtual separa endereço lógico de endereço físico;
- MMU ajuda na tradução de endereços;
- TLB guarda traduções recentes;
- FIFO remove a página mais antiga, mesmo que ela ainda seja usada;
- swapping usa disco como apoio para a RAM;
- no Linux: `fdisk`, `mkfs`, `mount`;
- `ls -al` mostra detalhes e arquivos ocultos;
- Nano salva com `CTRL + O`;
- `crontab -e` edita tarefas agendadas;
- `break` interrompe loop;
- `clear` limpa o terminal.
