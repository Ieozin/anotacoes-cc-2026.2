# Revisão de Prova: Protocolos de Redes de Computadores

**Data:** 26/06/2026 | **Status:** Resumo para estudo

## 1. DNS e `nslookup`

DNS é o serviço que traduz nomes de domínio em endereços IP.

Exemplo:

```txt
www.exemplo.com → 192.0.2.10
```

A ferramenta `nslookup` é usada para consultar registros DNS manualmente.

Com ela dá pra verificar, por exemplo:

- qual IP está associado a um domínio;
- qual servidor DNS respondeu;
- registros relacionados a nomes de domínio.

Resumo:

```txt
nslookup → consulta DNS
DNS → resolve nome para IP
```

`nslookup` não é ferramenta de FTP, DHCP, SNMP ou e-mail.

## 2. TELNET e SSH

TELNET permite acesso remoto a sistemas por linha de comando.

O problema é que ele não usa criptografia. Isso significa que usuário, senha e comandos podem trafegar em texto claro.

Em redes não confiáveis, alguém usando um sniffer pode capturar esse tráfego.

Por isso, na prática, TELNET foi substituído por SSH.

| Protocolo | Característica |
| :--- | :--- |
| TELNET | Acesso remoto sem criptografia |
| SSH | Acesso remoto com criptografia |

Ponto importante:

```txt
TELNET é inseguro pq não criptografa os dados.
```

## 3. SMTP, POP e correio eletrônico

No e-mail, cada protocolo tem uma função.

### SMTP

SMTP é usado para envio de mensagens.

Ele pode atuar:

- do cliente para o servidor de e-mail;
- entre servidores de e-mail.

Em SMTP, antes do comando `DATA`, aparecem comandos ligados ao envelope da mensagem.

Exemplos:

```txt
MAIL FROM
RCPT TO
DATA
```

O envelope define remetente e destinatário no processo de entrega.

### POP

POP/POP3 é usado para acessar a caixa de mensagens e obter as mensagens armazenadas no servidor.

Resumo:

| Protocolo | Função |
| :--- | :--- |
| SMTP | Enviar e-mail |
| POP/POP3 | Baixar/acessar mensagens |
| IMAP | Acessar e sincronizar mensagens |

Diferença básica:

```txt
SMTP envia.
POP recebe/baixa.
IMAP sincroniza melhor com o servidor.
```

## 4. FTP

FTP é usado para transferência de arquivos.

Ele utiliza TCP e trabalha com conexões separadas.

A conexão inicial com o servidor é a conexão de controle.

Por padrão:

```txt
FTP controle → porta 21
```

A porta 20 costuma aparecer associada à conexão de dados no modo ativo.

Resumo:

| Porta | Uso |
| :--- | :--- |
| 21 | Controle FTP |
| 20 | Dados FTP no modo ativo |

## 5. TCP

TCP é um protocolo de transporte confiável e orientado à conexão.

Características principais:

- estabelece conexão antes de transmitir;
- garante entrega dos dados;
- entrega os dados em ordem;
- usa confirmações;
- controla congestionamento;
- trabalha como fluxo de bytes.

Ponto importante:

```txt
TCP não preserva limites entre mensagens.
```

Ou seja, ele não entrega “mensagens separadas” como blocos fixos. Ele entrega um fluxo contínuo de bytes.

## 6. Número de sequência e ACK no TCP

TCP usa números de sequência para controlar os bytes enviados.

O ACK confirma o próximo byte esperado.

Exemplo:

```txt
Sequência inicial: 1001
Dados enviados: 2800 bytes

ACK esperado = 1001 + 2800 = 3801
```

Então, se o receptor recebeu corretamente os bytes de `1001` até `3800`, ele confirma com:

```txt
ACK 3801
```

Resumo:

```txt
ACK = próximo byte esperado
```

## 7. Janela de transmissão

A janela de transmissão permite enviar vários segmentos antes de esperar confirmação.

Sem janela:

```txt
envia 1 segmento → espera ACK → envia outro
```

Com janela:

```txt
envia vários segmentos → recebe ACKs depois
```

Isso aumenta o desempenho da conexão, pq aproveita melhor o tempo e a capacidade da rede.

## 8. Números iniciais de sequência

Em uma conexão TCP, cliente e servidor escolhem números iniciais de sequência.

Esses valores normalmente são aleatórios.

Eles não precisam começar em zero.

Resumo:

```txt
ISN = Initial Sequence Number
cliente e servidor escolhem valores próprios
valores aleatórios são normais
```

## 9. Controle de congestionamento TCP

O TCP ajusta a taxa de envio conforme percebe congestionamento na rede.

Quando está tudo bem, ele aumenta a taxa.

Quando detecta perda ou congestionamento, reduz a taxa.

O comportamento comum lembra uma “serra”:

```txt
sobe → cai → sobe → cai
```

Isso acontece pq o TCP tenta usar bem a rede sem sobrecarregá-la.

## 10. IPv4

IPv4 usa endereços de 32 bits.

Normalmente é escrito em 4 octetos:

```txt
192.168.0.1
```

Cada octeto tem 8 bits:

```txt
8 + 8 + 8 + 8 = 32 bits
```

Resumo:

| Conceito | Valor |
| :--- | :--- |
| IPv4 | 32 bits |
| Formato comum | 4 octetos decimais |
| Exemplo | `192.168.0.1` |

## 11. Máscaras IPv4 e quantidade de hosts

A máscara indica quantos bits são usados para identificar a rede.

O restante fica para hosts.

Exemplo:

```txt
/22
```

IPv4 tem 32 bits:

```txt
32 - 22 = 10 bits para hosts
```

Com 10 bits:

```txt
2^10 = 1024 endereços totais
```

Em IPv4 tradicional, normalmente subtraímos 2:

```txt
1024 - 2 = 1022 hosts úteis
```

Por isso, para uma rede com 728 dispositivos, `/22` atende com menor desperdício entre opções como `/21`, `/22`, `/25`, `/26` e `/27`.

Resumo:

```txt
/22 → 1024 endereços totais → 1022 úteis
```

## 12. Origem e destino em pacotes

Em uma captura de rede, é comum aparecer:

```txt
Source Address
Destination Address
```

Significado:

| Campo | O q significa |
| :--- | :--- |
| Source Address | IP de origem |
| Destination Address | IP de destino |

Cuidado: endereço MAC não é endereço IPv4.

Exemplo de MAC:

```txt
be:72:8b:4b:e3:53
```

Exemplo de IPv4:

```txt
192.168.42.129
```

## 13. NAT e PAT

NAT permite traduzir endereços IP entre redes.

PAT é uma variação que também usa portas.

Com PAT, vários dispositivos internos podem sair para a internet usando o mesmo IP público, diferenciando as conexões pelas portas.

Exemplo simplificado:

```txt
192.168.0.10:2534 → 200.100.50.1:2534
192.168.0.11:2534 → 200.100.50.1:3001
```

A porta traduzida ajuda a identificar qual conexão pertence a qual host interno.

Resumo:

```txt
NAT traduz IP.
PAT traduz IP + porta.
```

## 14. IPv6

IPv6 foi criado para ampliar o espaço de endereçamento.

Enquanto IPv4 usa 32 bits, IPv6 usa 128 bits.

Resumo:

| Protocolo | Tamanho |
| :--- | :--- |
| IPv4 | 32 bits |
| IPv6 | 128 bits |

Em IPv6, o prefixo funciona parecido com IPv4.

Exemplo:

```txt
2001:db8:acad:1::/120
```

IPv6 tem 128 bits:

```txt
128 - 120 = 8 bits para endereços
```

Com 8 bits:

```txt
2^8 = 256 endereços
```

## 15. Integração IPv4 e IPv6

Durante a transição entre IPv4 e IPv6, existem algumas técnicas de integração.

### Pilha dupla

O dispositivo usa IPv4 e IPv6 ao mesmo tempo.

```txt
IPv4 + IPv6 no mesmo host
```

### NAT64

Permite comunicação entre redes IPv6 e IPv4 usando tradução.

### Tunelamento

Encapsula um protocolo dentro de outro.

Um exemplo é o GRE.

## 16. GRE

GRE significa **Generic Routing Encapsulation**.

É um protocolo de tunelamento.

Ele pode encapsular diferentes protocolos, por exemplo:

```txt
IPv6 dentro de IPv4
```

A ideia é manter o pacote original encapsulado dentro de outro pacote para atravessar uma rede intermediária.

Resumo:

```txt
GRE → tunelamento/encapsulamento
```

## 17. ICMPv6

ICMPv6 é usado para mensagens de controle e diagnóstico em IPv6.

Campos importantes:

| Campo | Função |
| :--- | :--- |
| Tipo | Define o tipo da mensagem |
| Code | Detalha o motivo/subtipo da mensagem |
| Soma de verificação | Verifica integridade |
| Dados | Informações específicas da mensagem |

Resumo:

```txt
Tipo → qual mensagem é
Code → detalhe/motivo da mensagem
```

## 18. Mobilidade IPv6

Mobilidade IPv6 permite que um dispositivo mude de rede sem precisar alterar seu endereço IPv6 de origem.

Isso é útil em dispositivos móveis, como celulares, que transitam entre redes.

Resumo:

```txt
Mobilidade IPv6 → mudar de rede mantendo endereço
```

Não confundir com:

- DHCPv6;
- autonumeração;
- renumeração de rede;
- descoberta de MTU.

## 19. Traceroute e default gateway

`traceroute` ou `tracert` mostra o caminho até um destino.

Cada linha representa um salto, ou hop.

O primeiro salto geralmente é o roteador da rede local, ou seja, o default gateway.

Exemplo:

```txt
1   192.168.0.1
2   10.50.192.1
3   ...
```

Nesse caso:

```txt
default gateway = 192.168.0.1
```

Resumo:

```txt
primeiro hop do traceroute → normalmente é o gateway padrão
```

## 20. Resumo final pra revisar

Antes da prova, lembrar:

- `nslookup` consulta DNS;
- DNS resolve nomes para IP;
- TELNET não usa criptografia;
- SSH é a alternativa segura ao TELNET;
- SMTP envia e-mail;
- comandos antes do `DATA` fazem parte do envelope SMTP;
- POP acessa/baixa mensagens;
- FTP usa conexão de controle na porta 21;
- TCP é confiável, orientado à conexão e usa fluxo de bytes;
- TCP confirma o próximo byte esperado;
- janela de transmissão melhora desempenho;
- números iniciais de sequência TCP podem ser aleatórios;
- controle de congestionamento gera padrão de subida e queda na taxa;
- IPv4 tem 32 bits;
- IPv6 tem 128 bits;
- `/22` em IPv4 fornece 1024 endereços totais;
- Source Address é origem;
- Destination Address é destino;
- NAT traduz IP;
- PAT traduz IP + porta;
- GRE é tunelamento;
- ICMPv6 usa Tipo e Code;
- Mobilidade IPv6 permite trocar de rede mantendo endereço;
- no traceroute, o primeiro salto costuma ser o default gateway.
