#=
Aula 2: Operadores Relacionais, Operadores lógicos e Condicionais
Linguagem: Julia
=#

#=
Operadores Relacionais

Os operadores, em geral, possuem respostas booleanas.
Isto é, verdadeiro ou falso para uma dada expressão.

Veremos aqui o operador ==, que verifica se duas expressões são iguais.
=#

println(3 == 3) #True
println(3 == 4) #False

#Outro operador é o !=, que verifica quando duas expressões são diferentes.

println(3 != 3) #False
println(3 != 4) #True

#=Também é possível verificar expressões utilizando > <, que podem servir para
verificar se uma expressão é estritamente maior ou menor que outra. =#

println(3 > 2) #True
println(3 > 3) #False
println(3 < 4) #True

#= Para verificar a igualdade também, é possível utilizar >= ou <= para isso.
Importante notar a ordenação. =#

println(3 >= 3) #True
println(3 >= 4) #False
#println(3 =< 4) Errado!

#Operadores Lógicos
#=
Há dois operadores lógicos: "e" e "ou".

O operador && significa "e", e implica que ambas as partes que estão sendo comparadas
precisam ser verdadeiras para que se tenha um resultado verdadeiro.
Caso contrário, basta apenas uma parcela ser falsa pra que toda expressão seja falsa. Um exemplo:
=#

println(5>4 && 2>3)

#Por mais que 5 seja de fato maior que 4, 2 não é maior que 3. Portanto, toda expressão será falsa.

println(5==5 && 5 > 4)

#Repare que agora, ambas as partes são verdadeiras, tornando assim toda expressão verdadeira.

#=
O operador || significa "ou", é o contrário do anterior. Ele será falso apenas quando ambas as partes forem falsas.
Caso contrário, basta apenas uma parcela ser verdadeira para que toda expressão seja falsa. Iremos ver os mesmos exemplos:
=#

println(5>4 || 2 < 3)

#Repare que agora essa expressão se tornou verdadeira. Isto se dá por que basta apenas uma parcela ser verdadeira, que no caso é 5 > 4.

println(5==5 || 5 > 4)

#Esta parcela também será verdadeira, pois ambas as partes são.

println(5==4 || 4 > 5)

#Este é o único jeito do "ou" se tornar falso, quando as duas parcelas são falsas.

#=
Execução condicional
Para escrever programas úteis, quase sempre precisamos da capacidade de verificar condições
e mudar o comportamento do programa de acordo com elas. Instruções condicionais nos dão esta capacidade.
A forma mais simples é a instrução if, que tem como objetivo executar um bloco de código se alguma condição
pré-definida for verdadeira, um exemplo:
=#

x = 2

if x > 0
  println("é positivo\n")
end


#=
Execução Alternativa
Uma segunda forma da instrução if é a “execução alternativa”, na qual há duas possibilidades
e a condição determina qual será executada. Para isso, utilizaremos, além do if o else,
que nos indica uma alternativa contrária caso a primeira não seja satisfeita.
A sintaxe é da seguinte maneira:
=#

x = 3

if x % 2 == 0
  println(x, " é par")
else
  println(x, " é ímpar")
end

#=
% é um operador que nos dá o resto de uma divisão. Se o resto quando x for dividido por 2 for 0,
então sabemos que x é par e o programa exibe uma mensagem adequada. Se a condição for falsa,
o segundo conjunto de instruções é executado. Como a condição deve ser verdadeira ou falsa,
exatamente uma das alternativas será executada.
=#

#=
Condicionais Encadeadas
Às vezes, há mais de duas possibilidades e precisamos de mais que dois ramos.
Esta forma de expressar uma operação de computação é uma condicional encadeada.
Utilizamos o elseif. Não há nenhum limite para o número de instruções elseif.
Entretanto, se houver uma cláusula else, ela deve estar no fim, mas não é preciso haver uma.
=#

x = 2
y = 3

if x < y
  println(x, " é estritamente menor que ", y)
elseif x > y
  println(x, " é estritamente maior que ", y)
else
  println(" são iguais ")
end

#=
Condicionais Aninhadas
Uma condicional também pode ser aninhada dentro de outra.
Isto é, é possível utilizar condicionais dentro de outras condicionais.
Utilizando o mesmo exemplo anterior:
=#

x = 2
y = 3

if x == y
  println("são iguais")
else
  if x > y
    println(x, " é estritamente maior que ", y)
  else
    println(x, " é estritamente menor que ", y)
  end
end


#Exercícios

#=Exercício 1: Faça um programa que a partir de um número de 1-10
exiba o dia correspondente da semana. (1-Domingo, 2- Segunda, etc.),
se digitar outro valor deve aparecer valor inválido. =#



#=Exercício 2:
Faça uma calculadora. Dados dois números e uma operação, mostre o cálculo adequeado. 

Se "+" então retornará a soma desses dois números.
Se "-" então retornará a subtração desses dois números.
Se "*" então retornará a multiplicação desses dois números.
Se "/" então retornará a divisão desses dois números.
=#

#=Exercício 3:
Faça um programa que faça 5 perguntas para uma pessoa sobre um crime. As perguntas são:

"Telefonou para a vítima?"
"Esteve no local do crime?"
"Mora perto da vítima?"
"Devia para a vítima?"
"Já trabalhou com a vítima?"
O programa deve no final emitir uma classificação sobre a participação da pessoa no crime.

Se a pessoa responder positivamente a 2 questões ela deve ser classificada como "Suspeita",
entre 3 e 4 como "Cúmplice" e 5 como "Assassino". Caso contrário, ele será classificado como "Inocente".
=#

#Como usar contadores!
#cont_sim = 0
#cont_sim = cont_sim + 1


#=
Exercício 4 (Desafio!)

Faça um programa que faça 2 perguntas ao usuário sobre a pandemia atual:

1 -"Está em isolamento total e usando máscara?"
2 - "Apresenta sintomas?"
Se a pergunta 1 for respondida positivamente e a 2 negativamente, então classifique como "não suspeito" e emita uma mensagem "parabéns, continue assim".

Se obtiver resposta negativa para as duas perguntas, classifique-o como "possível hospedeiro assintomático" e emita uma mensagem de alerta.

Se obtiver uma resposta positiva para as 2 perguntas ou resposta negativa a primeira pergunta e positiva a segunda, faça mais 2 perguntas:

3- "Apresenta tosse ou falta de paladar ou febre?"
4- "Apresenta dificuldade para respirar?"
Se a pessoa responder positivamente a 3 mas negativamente a 4, classifique-o como "suspeito", e emita uma mensagem "mantenha isolamento total, use máscara e se cuide"

Se a pessoa responder negativamente a questão 3, positivamente para 4 ou responder positivamente para ambas as questões, então classifique-o como "muito suspeito", e emita a seguinte mensagem "vá ao hospital e faça o teste!"
=#
