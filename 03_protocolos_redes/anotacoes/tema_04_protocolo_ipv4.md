# Tema 04: Protocolo IPv4
**Data:** 19/05/2026 | **Status:** Concluído

## 1. O Datagrama IPv4 e Fragmentação
O IPv4 trabalha na Camada de Rede (L3). A função dele é pegar o pacote da camada de transporte, colocar um cabeçalho e mandar pra rota certa. O cabeçalho IPv4 tem no mínimo 20 bytes.

**Campos mais cobrados do cabeçalho:**
- **TTL (Time to Live):** É o tempo de vida do pacote. Cada vez que passa por um roteador (salto/hop), o TTL diminui em 1. Se chegar a 0, o roteador descarta o pacote (isso evita que pacotes fiquem em loop infinito na rede).
- **Protocolo:** Indica pra quem ele vai entregar o *payload* lá na camada de transporte (ex: 6 = TCP, 17 = UDP).
- **Checksum:** Verifica se o *cabeçalho* (só ele, não os dados) corrompeu no caminho.

**Fragmentação e MTU:**
Cada enlace de rede tem um limite de tamanho de pacote chamado **MTU (Maximum Transmission Unit)**, geralmente 1500 bytes. Se o datagrama for maior que o MTU do roteador, o IPv4 **fragmenta** o pacote em pedaços menores usando os campos *Identification*, *Flags* e *Fragment Offset*. O pacote só é remontado no destino final, nunca no meio do caminho.

## 2. Endereçamento, Classes e Sub-redes
O IP tem 32 bits (4 blocos de 8 bits). Ele é dividido em duas partes: **Rede** e **Host**. Quem define onde termina a rede e começa o host é a **Máscara de Sub-rede**.

**Classes Históricas (Ainda caem em prova):**
- **Classe A:** `1.0.0.0` a `127.255.255.255` (Máscara `/8`) -> Pra redes gigantes.
- **Classe B:** `128.0.0.0` a `191.255.255.255` (Máscara `/16`) -> Pra redes médias.
- **Classe C:** `192.0.0.0` a `223.255.255.255` (Máscara `/24`) -> Pra redes pequenas (o que a gente usa em casa).
- **Classe D:** Multicast.
- **Classe E:** Experimental.

**Regra de Ouro das Sub-redes:**
Toda rede sempre perde 2 IPs:
1. **Endereço de Rede:** Identifica a rede em si (Todos os bits de host são `0`).
2. **Endereço de Broadcast:** Manda pacote pra todo mundo da rede (Todos os bits de host são `1`).
*Fórmula de hosts válidos: 2^n - 2 (onde n = número de bits de host).*

## 3. O Fim dos IPs e a Salvação (NAT e RFC 1918)
O IPv4 esgotou. Pra internet não quebrar, criaram soluções paliativas:

**1. IPs Privados (RFC 1918):**
São IPs que **não rodam na internet pública**. Servem só pra rede interna.
- `10.0.0.0` a `10.255.255.255` (Classe A)
- `172.16.0.0` a `172.31.255.255` (Classe B)
- `192.168.0.0` a `192.168.255.255` (Classe C)

**2. NAT (Network Address Translation):**
Como o PC com IP privado vai acessar o Google? O roteador faz o NAT. Ele troca o seu IP privado (ex: `192.168.0.10`) pelo IP Público do roteador antes de jogar na internet. 
- *NAT Sobrecarga (PAT - Port Address Translation):* É o que a gente usa em casa. O roteador usa **portas lógicas** pra diferenciar se o pacote que voltou da internet é pro celular da sua mãe ou pro seu PC, usando apenas 1 único IP público pra casa toda.

## 4. Protocolos Auxiliares e Troubleshooting (Diagnóstico)

Para a internet funcionar na prática e para investigar falhas, o IP conta com ajudantes:

- **ARP (Address Resolution Protocol):** A rede IP é lógica, mas os switches só entendem MAC Address (Físico). O ARP pergunta em broadcast: *"Quem tem o IP X? Me manda seu MAC"*.
- **ICMP (Internet Control Message Protocol):** O mensageiro de erros e diagnósticos do IP (não usa porta TCP/UDP, roda direto sobre o IP).

```bash
# Ferramentas de terminal pra diagnóstico:
ping 8.8.8.8         # Usa ICMP (Echo Request/Reply) pra testar conectividade
tracert 8.8.8.8      # (Windows) ou traceroute (Linux). Mostra cada salto (roteador) até o destino mexendo no TTL
arp -a               # Mostra a tabela cache ARP do seu PC (relação IP -> MAC)
```

## Pontos de Atenção

> **⚠️ Pegadinha de Prova (Fragmentação):** O pacote IPv4 é fragmentado pelos roteadores no meio do caminho se for maior que o MTU, mas a **remontagem** acontece EXCLUSIVAMENTE no host de destino, nunca nos roteadores intermediários (pra poupar processamento).
> **⚠️ Pegadinha de Prova (IP vs MAC):** O IP muda conforme a rede que você tá conectado (Endereço Lógico). O MAC Address não muda, vem gravado na placa de rede de fábrica (Endereço Físico). O **ARP** é a ponte entre os dois.
> **⚠️ Loopback:** O IP `127.0.0.1` (localhost) serve pra testar a própria placa de rede do seu PC. O pacote nem chega a ir pro cabo de rede.


