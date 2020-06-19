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
