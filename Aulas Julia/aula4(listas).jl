#=
Como uma string, uma lista é uma sequência de valores.
Em uma string, os valores são caracteres;
em uma lista, eles podem ser de qualquer tipo.
Os valores em uma lista são chamados de elementos, ou, algumas vezes, de itens.
=#

#=Há várias formas para criar uma lista;
a mais simples é colocar os elementos entre colchetes [ ]: =#

[1, 2, 3, 4]
['laranja', 'melancia', 'abacaxi']

#=
O primeiro exemplo é uma lista de quatro números inteiros.
O segundo é uma lista de três strings, representando uma lista de frutas.

Porém, os elementos de uma lista não precisam ser do mesmo tipo.
A lista seguinte contém uma string, um número de ponto flutuante,
um número inteiro e também, outra lista:
=#
['spam', 2.3, 5, [1, 2]]

#Chamaremos uma lista dentro de outra lista de lista aninhada.
#Chamaremos também uma lista que não contém elementos lista vazia;
#você pode criar uma com colchetes vazios [].

#Como já se poderia esperar, podemos atribuir uma lista de valores a variáveis:

frutas = ["laranja", "melancia", "abacaxi"]
numeros = [42, 123]
vazio = []
print(frutas, numeros, vazio)

#=
A sintaxe para acessar os elementos de uma lista
é a mesma que para acessar os caracteres de uma string: o operador de colchete.
A expressão dentro dos colchetes especifica o índice.
=#

println(frutas[1]) #Lembre-se! A contagem começa do 1

#=
Listas são mutáveis. Diferentemente de strings, podemos mudar os valores de uma
lista, fazendo uma atribuição a esquerda. Exemplo:
=#

numeros[2] = 5
println(numeros)

#=
Pedaços de Listas.
O operador fatia também funciona com listas. Exemplo:
=#

l = ["a","b","c","d","e","f"]
println(l[1:3])
println(l[3:end])

#O operador fatia [:] faz uma cópia da lista:

outra_lista = l[:]
println(outra_lista)

#Biblioteca no Julia de Array
#=Julia possui algumas funções próprias que opera com listas, como por exemplo
push! adiciona um elemento ao final da lista
=#

push!(l, "g")
println(l)

#Também tem o append! que adiciona ao final uma segunda lista:

l2 = ["h", "i"]
append!(l,l2)
println(l)

#sort! ordena os elementos da lista de forma crescente:

desordem = [2,3,1,4,7,5]
sort!(desordem)
println(desordem)

#Se usarmos apenas sort esta função retorna uma cópia dos elementos ordenados.
#Mantendo assim, a lista intacta:

desordem = [2,3,1,4,7,5]
ordem = sort(desordem)
println(ordem)
println(desordem)

#nota: ! geralmente são funções que modificam o argumento

#Para deletar um elemento em que você saiba o índice, usa-se splice!:

splice!(l,3)
println(l)

#Se quiser deletar o último elemento da lista, usaremos o !pop.
#Para deletar o primeiro da lista, popfirst!

pop!(l)
println(l)

popfirst!(l)
println(l)

#Podemos usar também o insert! para inserir em uma posição específica da lista:

insert!(l, 2, "x")
println(l)

#=Listas e Strings.
Para converter uma string em uma lista de letras (char), podemos usar a função
collect:
=#

l = collect("teste")
println(l)

#Se quisermos quebrar uma string em palavras, podemos usar a função split

l = split("curso de Julia")
println(l)

#também podemos dar um delimitador para o split, caso não seja o espaço.

l = split("curso-de-julia", '-')
println(l)

#join é o inverso de split. Converte uma lista em uma string.

l = ["curso", "de", "julia"]
s = join(l, ' ')
println(s)


#Exercícios

#=Exercício 1:
Preencha uma lista vazia com 5 elementos.
=#

#=Exercício 2
Transforme a string "covid_vai_embora_daqui" em uma lista, mostre-a e depois,
coverta de novo em uma nova string desse jeito: "covid vai embora daqui".
=#

#=Exercício 3
Dada a seguinte lista:
l = [12,5,17]
Crie uma função "maior" que tenha como argumento uma lista e
retorne o maior elemento da lista.
=#

#=Exercício 4
Utilize a seguinte lista:
l = [1,2,3,4,5]
Faça um programa que cria duas listas chamadas "par" e "impar" onde a lista
"par" terá os elementos pares de l e a lista "impar" terá os elementos ímpares
de l.
=#
