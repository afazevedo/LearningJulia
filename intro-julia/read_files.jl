#=
Aula 6: Manipulação de arquivos
Linguagem: Julia
=#

#=
Um arquivo de texto é uma sequência de caracteres armazenados em um meio permanente
como um pendrive ou editor de texto. Para abrir um arquivo em Julia, existe a função open().
Ela recebe dois parâmetros: o primeiro é o nome do arquivo a ser aberto, e o segundo parâmetro
é o modo que queremos trabalhar com esse arquivo - se queremos ler ou escrever.
O modo é passado através de uma string: "w" para escrita e "r" para leitura.
=#

arq = open("aula6_txt\\aula6.txt", "w")


#=O arquivo criado se chama 'aula6.txt' e está no modo de escrita.
É importante saber que o modo de escrita sobrescreve o arquivo, se o mesmo existir.
Se a intenção é apenas adicionar conteúdo ao arquivo, utilizamos o modo "a" (abreviação para append). =#

#=
Agora que temos o arquivo vamos aprender a escrever algum conteúdo nele.
Basta chamar a partir do arquivo a função write(), passando para ela
o que se quer escrever no arquivo:
=#

write(arq, "Olá mundo!\n")

#Repare que o valor retornado da função é o número de caracteres do que foi escrito.
#Se você chamar novamente a função write, o conteúdo será adicionado em seguida ao texto:

write(arq, " Aprendendo a escrever em arquivos.")

#Abra o arquivo e veja que continua em branco. Por que? Pois precisamos fechar o arquivo que abrimos.

close(arq)

#Vamos então abrir o arquivo no modo de leitura, basta passar o nome do arquivo e a letra "r"

arq = open("aula6_txt\\aula6.txt", "r")

#Para ler o arquivo inteiro, utilizamos a função read():
read(arq, String)

#=Observe que o retorno da função é uma string inteira do que está escrito
Suponha então que queremos ler todo o conteúdo do arquivo mas ler linha por linha.
Podemos utilizar um laço for para ler cada linha do arquivo, usando a função eachline(): =#

arq = open("aula6_txt\\aula6.txt", "r")

for i in eachline(arq)
    a = split(i)
    println(a)
end

close(arq)
#Com a função split, conseguimos armazenar em um array cada informação lida da linha, separada por espaço
#Observação: sempre é lido com String. Caso queira ler números, é necessário converter (usando parsers)

#Para poder atribuir cada linha a um array de strings, podemos também usar readlines()
arq = open("aula6_txt\\aula6.txt", "r")

f = readlines(arq)

close(arq)


#=
Para uma maior manipulação de dados, apresento aqui uma biblioteca chamada Delimited Files.
Basta adicionar o pacote no REPL, Pkg.add("DelimitedFiles").
=#
using DelimitedFiles

#Para ler uma matriz, podemos usar a função readdlm()
readdlm("aula6_txt\\dlm.txt", ' ', Int64) #Parâmetros: caminho, delimitador e tipo

#Se quisermos apenas um elemento específico da matriz, fazemos:
readdlm("aula6_txt\\dlm.txt", Int64)[1,2]

#E se quisermos separar o header do resto dos dados, podemos fazer:
leitura = readdlm("aula6_txt\\dlm.txt", header = true, Int64)
leitura[2]
leitura[1]


#=
Exercício 1:
Leia e armazene nas devidas estruturas as informações do arquivo mochila.txt

Exercício 2:
Leia e armazene nas devidas estruturas as informações do arquivo mochila2.txt
=#
