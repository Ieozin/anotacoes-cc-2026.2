# Tema 01 e 02: Introdução e Protocolos de Aplicação
**Data:** 14/05/2026 | **Status:** Concluído

## 1. O Roadmap da Matéria
A internet só funciona porque existem regras universais para os dispositivos conversarem. Vamos focar na camada de **Aplicação** (os programas q a gente usa), **Transporte** (TCP/UDP) e **Rede** (IPv4/IPv6). O objetivo não é só entender a teoria, mas saber inspecionar a rede (troubleshooting) pra descobrir onde os pacotes estão quebrando quando um serviço cai.

## 2. A Base da Web: HTTP e HTTPS
A web é carregada nas costas pelo **HTTP (Hypertext Transfer Protocol)**, que trafega textos, imagens e arquivos em geral. Ele roda sobre o protocolo de transporte TCP. 

O HTTP funciona por requisição (cliente pede) e resposta (servidor entrega).
- **Não Persistente vs Persistente:** No começo, pra cada imagenzinha de um site, o HTTP abria e fechava uma conexão TCP separada (muito lento). Hoje ele usa conexões persistentes, mantendo a porta aberta pra puxar vários recursos de uma vez.
- **Códigos de Status:** Sempre q vc pede algo, o servidor responde com um código de 3 dígitos:
  - `1xx`: Info.
  - `2xx`: Sucesso (ex: 200 OK).
  - `3xx`: Redirecionamento.
  - `4xx`: Erro do Cliente (ex: 404 Not Found - vc pediu o q não existe).
  - `5xx`: Erro do Servidor (ex: 500 Internal Error - o servidor explodiu internamente).

> **Segurança:** O HTTP é em texto claro (dá pra ler suas senhas capturando o pacote). O **HTTPS** resolve isso colocando uma subcamada criptografada (SSL/TLS) embaixo do HTTP.

## 3. Transferência e Acesso Remoto: FTP e TELNET
- **FTP (File Transfer Protocol):** Diferente do HTTP, o FTP usa duas portas separadas. A porta 21 fica pro **Controle** (onde vc manda os comandos) e uma nova conexão é aberta só pros **Dados** (o arquivo sendo transferido). Isso se chama *controle fora da banda*. 
  - *Modo Ativo:* O servidor abre a conexão pro seu PC (costuma dar merda com firewall). 
  - *Modo Passivo:* O seu PC inicia a conexão de dados (fura o firewall melhor).
- **TELNET (Porta 23):** Protocolo pré-histórico pra acessar o terminal de servidores remotamente. Não tem criptografia nenhuma. **Na vida real, foi substituído pelo SSH.**

## 4. Correio Eletrônico (O carteiro e a caixa postal)
E-mail é um sistema de envio, armazenamento e resgate de mensagens.

| Protocolo | Porta | Função | Como funciona |
| :--- | :--- | :--- | :--- |
| **SMTP** | 25 ou 587 | **Envio** | É o carteiro. Joga a mensagem do seu PC pro seu servidor, e do seu servidor pro servidor de destino. |
| **POP3** | 110 | **Resgate** | Baixa o e-mail pro seu PC e **apaga** do servidor. Péssimo pra quem acessa do PC e do celular ao mesmo tempo. |
| **IMAP4** | 143 | **Resgate** | Sincroniza. Vê os e-mails direto no servidor e permite organizar em pastas. Se ler no celular, aparece lido no PC. |

## 5. Os Bastidores da Rede: DNS, DHCP e SNMP

### DNS (Domain Name System)
Ninguém decora IP. O DNS traduz `google.com` pro IP do servidor. Roda na porta 53 (geralmente UDP).
- **Consulta Recursiva:** Vc pede pro DNS do seu provedor se virar pra achar o IP.
- **Consulta Iterativa:** O DNS do provedor vai perguntando na hierarquia: Servidor Raiz -> TLD (`.com`) -> Autoritativo (quem realmente sabe o IP).
- **Principais Registros (RR):** - `A`: Aponta pra um IPv4.
  - `AAAA`: Aponta pra um IPv6.
  - `CNAME`: Apelido pra outro nome.
  - `MX`: Aponta pro servidor de E-mail daquele domínio.

### DHCP (Dynamic Host Configuration Protocol)
Dá IP automático pras máquinas. Ele segue um ciclo de 4 mensagens em broadcast (UDP portas 67/68) conhecido como **DORA**: **D**iscover, **O**ffer, **R**equest, **A**ck. O IP não é seu pra sempre, ele é um "aluguel" (*lease time*) q precisa ser renovado.

### SNMP (Monitoramento)
Vigia se os servidores e roteadores estão vivos. 
- **Polling:** O servidor de monitoramento fica perguntando de tempo em tempo: "E aí, a RAM tá ok?" (Gera muito tráfego).
- **Trap:** O roteador sofre um erro e manda um alerta automático e imediato pro servidor. "Deu merda na ventoinha!".

## Pontos de Atenção
> **⚠️ Pegadinha de Prova (Portas do SMTP):** Entre servidores a porta do SMTP é a **25**. Quando é o cliente de e-mail mandando pro servidor, o padrão recomendado hoje é a porta **587** com autenticação e criptografia.
> **⚠️ Conceito Chave (Renovação DHCP):** O dispositivo sempre tenta renovar o IP quando o *lease time* chega na metade. Se o lease for 20 minutos, ele tenta renovar no minuto 10.
> **⚠️ Ferramentas:** Pra ver esses protocolos a nível de bit na vida real, a gente usa **Sniffers de pacotes** (como o Wireshark). Pra web, o atalho `F12` (Aba Network/Rede) do Chrome faz o mesmo trabalho pro HTTP.
