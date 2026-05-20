# Tema 05: Protocolo IPv6
**Data:** 20/05/2026 | **Status:** Concluído

## 1. O Fim da Escassez e o Formato IPv6
O IPv4 esgotou (são só 4 bilhões de IPs). O IPv6 veio pra resolver isso com **128 bits**, o que dá um número absurdamente gigante de endereços. Ele não é mais escrito em base decimal, e sim em **Hexadecimal**. 

**A anatomia do endereço:**
São 8 blocos de 16 bits separados por dois pontos (`:`). Ex: `2001:0DB8:0000:0000:0000:0000:1428:57AB`

**Regras de Abreviação (Pra não ficar digitando zero à toa):**
1. **Omissão de Zeros à Esquerda:** Dentro de um bloco, os zeros à esquerda podem sumir. `0DB8` vira `DB8`. O bloco `0000` vira `0`.
2. **Compressão de Zeros (`::`):** Uma sequência de blocos cheios de zeros pode ser substituída por `::`. O IP gigante ali de cima vira: `2001:DB8::1428:57AB`.
*Aviso fatal:* O `::` só pode ser usado **UMA única vez** no IP. Se usar duas, o SO perde a referência de onde estão os zeros e o IP fica inválido.

## 2. O Cabeçalho Mais Leve
Apesar do IP ser gigante, o cabeçalho do IPv6 é muito mais simples e eficiente que o do IPv4. 
- **Tamanho Fixo:** O cabeçalho agora tem sempre **40 bytes**. Isso acelera o processamento no roteador.
- **Sem Checksum:** O IPv6 não perde tempo verificando erros no cabeçalho. Ele joga essa bucha pra camada de Transporte (TCP/UDP) ou de Enlace.
- **Sem Fragmentação na Rota:** Os roteadores no meio do caminho não fragmentam mais os pacotes. A máquina de origem tem que usar o *Path MTU Discovery* pra descobrir o menor tamanho de pacote suportado no trajeto e já mandar no tamanho certo.

## 3. Tipos de Endereço (A Morte do Broadcast)
No IPv6 o **Broadcast não existe mais** (nada de inundar a rede gritando pra todo mundo). Tudo é feito via Multicast.

| Tipo | Prefixo Padrão | Função | Equivalente no IPv4 |
| :--- | :--- | :--- | :--- |
| **Global Unicast** | `2000::/3` | O IP público, roteável na internet. | IP Público (Classe A, B, C) |
| **Link-Local** | `fe80::/10` | IP automático de rede local. Só funciona no seu segmento de rede, o roteador não repassa. | APIPA (`169.254.x.x`) |
| **Unique Local** | `fc00::/7` ou `fd` | IP de rede privada, usado pra comunicação interna da empresa. | IPs Privados (`10.x.x.x`, `192.168.x.x`) |
| **Multicast** | `ff00::/8` | Manda de um pra muitos (só pra quem tá inscrito no grupo). Substitui o broadcast. | Multicast (`224.0.0.0`) |
| **Anycast** | Varia | Manda de um pro *mais próximo*. Muito usado em balanceamento de carga e servidores DNS raiz. | N/A |

*Nota sobre a máscara:* No IPv6, a sub-rede padrão (o que a gente usa na LAN) é sempre **/64**. Ou seja, 64 bits pra identificar a rede, e 64 bits pra identificar a máquina (Host/Interface ID).

## 4. O Novo "ARP": ICMPv6 e NDP
Como não tem mais Broadcast, o clássico ARP que a gente usava no IPv4 parou de funcionar. Quem assume a bronca é o protocolo **ICMPv6** junto com o **NDP (Neighbor Discovery Protocol)**. 

Mensagens chave do ICMPv6:
- **RS (Router Solicitation):** O PC liga e pergunta: "Tem algum roteador aqui?".
- **RA (Router Advertisement):** O roteador responde: "Tô aqui, o prefixo da rede é esse, gera teu IP aí" (Autoconfiguração SLAAC).
- **NS (Neighbor Solicitation):** Substitui o ARP. "Quem tem o IP `fe80::1`? Me manda teu MAC address".
- **NA (Neighbor Advertisement):** A resposta com o MAC address.

## 5. Técnicas de Transição (Coexistência)
A internet não ia virar a chave pro IPv6 de um dia pro outro. Temos 3 gambiarras oficiais pra fazer o v4 e o v6 viverem juntos: 
1. **Pilha Dupla (Dual Stack):** A placa de rede roda os dois protocolos ao mesmo tempo. Tem um IPv4 e um IPv6 configurados. Se o destino fala v6, ele usa v6.
2. **Tunelamento:** Encapsula o pacote IPv6 dentro de um pacote IPv4 pra ele conseguir atravessar uma rede velha que não suporta v6 (Ex: Teredo, ISATAP, 6to4).
3. **Tradução (NAT64):** Um roteador de borda pega um pacote IPv6, traduz o cabeçalho pra IPv4 e joga na internet velha (muito usado em operadoras de celular).

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (Regra do `::`):** Eles amam colocar IPs com múltiplos `::` na prova (ex: `2001::DB8::1`). Isso é **INVÁLIDO**. O `::` só pode aparecer uma vez.
> **⚠️ Pegadinha de Prova (Loopback):** O equivalente ao `127.0.0.1` do IPv4 no IPv6 é o `::1` (todos os 127 bits em zero e o último em 1).
> **⚠️ NAT:** Teoricamente, a ideia do IPv6 é acabar com o NAT, devolvendo a conectividade fim a fim (todo mundo com IP público). Mas em transições usa-se NAT64.
