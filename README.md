# Instalação de Julia+Atom+Juno

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

Vá em `File` -> `Config`
Adicione uma linha, abaixo de "firstBoot: false":
juliaPath: "C:\\Users\\mndzv\\AppData\\Local\\Programs\\Julia\\Julia-1.4.2\\bin\\julia.exe"