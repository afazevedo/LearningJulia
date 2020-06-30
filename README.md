# Instalação de Julia+Atom+Juno

### Para windows:

>  Baixar Julia no seguinte repositório:

https://julialang.org/downloads/

Instalar o arquivo baixado .exe 

>  Baixar o Atom no site:

https://atom.io/

Instalar o arquivo baixado .exe

> Instalar Juno

Ao abrir o Atom, vá em `Packages` -> `Settings View` -> `Install Packages`

Irá abrir uma aba de `Settings`.

Agora, no espaço escrito `Search packages` procure por `uber-juno` .

Clique nesse pacote e coloque para instalar.

Reinicie o Atom.

Aparecerá uma opção "juno" no Atom. 

Vá para `Juno ->   ` `Settings `

Verifique se no campo Julia Path está configurado o caminho até o binário requerido.

Exemplo: C:\Users\nome_do_user\AppData\Local\Programs\Julia\Julia-1.4.2\bin\julia.exe



### Para Linux

>  Baixar Julia no seguinte repositório:

https://julialang.org/downloads/

Escolha por: Generic Linux Binaries for x86

Mova o arquivo para o diretório home.

Abra o terminal nessa pasta e utilize o comando:  `tar -xzf julia-1.4.2-linux-x86_64.tar.gz` para descompactar.

>  Baixar o Atom no site:

https://atom.io/

Instalar o arquivo baixado .deb

Para instalar, basta usar o comando `sudo dpkg -i nome_do_arquivo.deb`

> Instalar Juno

Ao abrir o Atom, vá em `Packages` -> `Settings View` -> `Install Packages`

Irá abrir uma aba de `Settings`.

Agora, no espaço escrito `Search packages` procure por `uber-juno` .

Clique nesse pacote e coloque para instalar.

Reinicie o Atom.

Vá em `File` -> `Config`
Adicione uma linha, abaixo de "firstBoot: false":
juliaPath: "C:\\Users\\mndzv\\AppData\\Local\\Programs\\Julia\\Julia-1.4.2\\bin\\julia.exe"