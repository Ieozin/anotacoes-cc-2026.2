# Tema 03: Protocolos de Transporte da Internet
**Data:** 18/05/2026 | **Status:** Concluído

## 1. O Papel da Camada de Transporte
Enquanto a camada de Rede (onde opera o IP) trata da comunicação lógica entre as máquinas (computador para computador), a camada de Transporte é responsável pela comunicação lógica entre os **processos** (aplicação para aplicação).

**Multiplexação e Demultiplexação:**
Como é que o PC sabe que um pacote que acabou de chegar é para o navegador web e não para o jogo online? Através das **portas**.
- **Multiplexação (Na origem):** Agrupa os dados de vários processos, adiciona o cabeçalho de transporte (com as portas de origem e destino) e envia para a camada de rede.
- **Demultiplexação (No destino):** Lê a porta de destino no cabeçalho e entrega os dados ao socket do processo correspondente.

**Divisão das Portas (16 bits):**
- **0 a 1023:** Bem conhecidas (reservadas para os serviços padrão, ex: o HTTP usa a porta 80).
- **1024 a 49151:** Registadas.
- **49152 a 65535:** Dinâmicas ou Efémeras (atribuídas pelo sistema operativo do cliente de forma temporária).

## 2. Transferência Confiável de Dados (RDT)
A rede IP, que funciona por baixo do Transporte, faz apenas o seu "melhor esforço" e não é de confiança: perde pacotes, altera bits no caminho e desordena as entregas. Para corrigir isso, aplicam-se mecanismos RDT (Reliable Data Transfer):
- **Checksum (Soma de verificação):** Deteta se algum bit foi corrompido durante a viagem.
- **ACK e NAK:** Confirmações positivas (chegou bem) ou negativas (chegou com problemas) que o destinatário envia de volta.
- **Número de Sequência:** Identifica a ordem dos pacotes para evitar duplicações ou desordenação.
- **Temporizador (Timer):** Se quem envia não receber o ACK dentro do tempo limite (Timeout), assume que o pacote se perdeu e volta a transmiti-lo.

**Otimização por Pipelining:**
Enviar um pacote e ficar à espera do ACK para poder enviar o próximo (Pare-e-Espere) é excessivamente lento. O Pipelining resolve isso permitindo o envio de vários pacotes ao mesmo tempo:
- *Go-Back-N:* Se o pacote 2 falhar, o emissor retransmite o pacote 2 e todos os que vieram a seguir.
- *Repetição Seletiva:* Se o pacote 2 falhar, retransmite APENAS o pacote 2. O recetor guarda num buffer os restantes que chegaram bem.

## 3. Os Dois Titãs: UDP vs TCP

### UDP (User Datagram Protocol)
É o protocolo mais básico, leve e rápido. Envia o pacote para a rede sem garantias ("seja o que Deus quiser").
- **Características:** Não é orientado à conexão, não garante a entrega, nem faz controlo de fluxo ou de congestionamento.
- **Vantagem:** Sem o atraso de criar a conexão inicial e tem um cabeçalho muito pequeno (apenas 8 bytes).
- **Casos de Uso:** Streaming de vídeo/áudio, chamadas de voz (VoIP), consultas DNS e SNMP.

### TCP (Transmission Control Protocol)
É o protocolo focado na fiabilidade e na ordem dos dados. Cria um "tubo" seguro e estável entre as aplicações.
- **Características:** Orientado à conexão, confiável, Full-duplex (transmite e recebe em simultâneo) e ponto-a-ponto (um emissor para um único recetor).
- **3-Way Handshake (Aperto de mão de 3 vias):** Prepara a conexão em 3 passos antes de enviar dados: o cliente envia um `SYN` -> o servidor responde com `SYN-ACK` -> o cliente confirma com `ACK`.
- **Controlo de Fluxo:** O recetor informa quanto espaço livre tem na sua memória (Janela de receção) para que o emissor não o sobrecarregue com dados demasiado depressa.
- **Controlo de Congestionamento:** Se a rede estiver entupida e a perder pacotes, o TCP abranda a velocidade de envio de forma automática (usando mecanismos como o *Slow Start*).
- **Encerramento:** Utiliza 4 passos com pacotes `FIN` para fechar a conexão de forma segura, garantindo que o último byte de dados é devidamente entregue.

## Pontos de Atenção
> **⚠️ Rasteira de Exame (Limitações do Transporte):** Apesar de o TCP garantir a entrega de todos os dados, **NENHUM** destes protocolos de transporte consegue garantir uma **largura de banda mínima** nem um **atraso máximo (delay)** para a aplicação.
> **⚠️ Sockets TCP vs UDP:** A demultiplexação de um socket UDP exige apenas duas coisas (IP e Porta de destino). Em contrapartida, um socket TCP é muito restrito e precisa obrigatoriamente de **4 parâmetros** para ser identificado: IP de origem, Porta de origem, IP de destino e Porta de destino. É isto que permite a um servidor web gerir milhares de conexões distintas todas na mesma porta 80.