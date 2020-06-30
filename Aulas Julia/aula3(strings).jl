#=
Aula 3: Strings (Parte 2)
Linguagem: Julia
=#

#=Strings não são como números inteiros, de ponto flutuante ou booleanos.
Uma string é uma sequência, ou seja, uma coleção ordenada de outros valores.
Aqui você verá como acessar os caracteres que compõem uma string e aprenderá
alguns métodos que as strings oferecem.
=#

#=
CARACTERES:
Diremos que existe um tipo chamado "char" que representa um único carecter, diferente da string.
É representado pelas aspas simples:
=#

typeof('x')

#=Uma string é uma sequência de caracteres.
Você pode acessar um caractere de cada vez com o operador de colchete:
=#

fruta = "banana"
letra = fruta[1]
println(letra)

#=
Você pode usar uma expressão que contenha variáveis e operadores como índice:
=#

i = 3
print(fruta[i])
print(fruta[i+1])

#O valor do índice tem que ser um número inteiro. Se não for, é isso que aparece:
fruta[1.5]

#=
É muito útil também utilizar a função "lenght", que é uma função integrada
que devolve o número de caracteres em uma string:
=#

tamanho = length(fruta)
println(tamanho)

#Para acessar o último elemento de uma string, podemos fazer o seguinte:
ultimo = fruta[length(fruta)]
println(ultimo)

#=Também é possível "fatiar" uma string.
Um segmento de uma string é chamado de fatia.
Selecionar uma fatia é como selecionar um caractere: =#

s = "New York"
println(s[1:3])
println(s[5:8])
#ou
println(s[5:end])

#=O operador [n:m] retorna a parte da string do “enésimo” caractere
ao “emésimo” caractere.=#

#Também é possível dizer o tamanho de passo que você quer fatiar, exemplo:

animal = "cachorro"
animal[1:2:end]

#Com isso, também é possível escrever uma string ao contrário:

animal[end:-1:1]

#Também é super útil, quando quisermos fazer uma cópia, utilizar:

copia = animal[:]
println(copia)

#=É tentador usar o operador [] no lado esquerdo de uma atribuição,
com a intenção de alterar um caractere em uma string. Por exemplo: =#

palavra = "Olá Mundo!"
palavra[0] = 'A'

#=
A razão do erro é que as strings são imutáveis, o que significa
que você não pode alterar uma string existente.
O melhor que você pode fazer é criar uma string que seja uma variação da original:
=#

palavra = "Olá Mundo!"
palavra = 'A' * palavra[2:end]
print(palavra)

#Em Julia, temos diversas funções úteis que podemos usar com strings:

uppercase("hello, world") #muda para letra maiúscula
findfirst("a", "banana") #encontra a primeira substring de uma string

#O operador "in" verifica se um caractere está em uma string, exemplo:

'a' in "banana"

#Mas se quiser comparar duas strings, basta usar o operador "=="

"abacate" == "abacaxi"

#=Exercício Desafio!
Escreva uma função chamada "palindromo", que terá como parâmetro uma string e
retornará "true" se a palavra enviada for um palíndromo e "false" caso contrário.
=#
