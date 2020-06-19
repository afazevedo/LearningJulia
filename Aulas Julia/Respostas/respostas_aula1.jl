#Exercício 1: Faça um programa que peça as 4 notas e mostre a média aritmética.

nota1 =  input("Qual foi a sua 1ª nota?\n")
nota2 = input("Qual foi a sua 2ª nota?\n")
nota3 = input("Qual foi a sua 3ª nota?\n")
nota4 = input("Qual foi a sua 4ª nota?\n")
println(nota1)
println(nota2)
println(nota3)
println(nota4)

#=Exercício 2: Tendo como dados de entrada a altura de uma pessoa, construa um algoritmo que calcule seu peso ideal,
usando a seguinte fórmula: (72.7*altura) - 58=#

altura = parse(Float64,input("Qual a sua altura?\n"))
peso_ideal = (72.7*altura) - 58
println(peso_ideal)

#Exercício 3: Escreva uma programa que leia o raio de um círculo e o utiliza para calcular sua área.
raio = parse(Float64,input("Digite o raio do círculo.\n"))
area = 3.14*raio*raio
println(area)

#= Exercício 4: Faça um programa que pergunte quanto você ganha por hora e o número de horas trabalhadas no mês.
Calcule e mostre o total do seu salário no referido mês,
sabendo-se que são descontados 11% para o Imposto de Renda, 8% para o INSS e 5% para o sindicato.
=#

valor_hora = parse(Float64,input("Quanto você ganha por hora?\n"))
horas_trabalhadas = parse(Int64, input("Quantas horas você trabalha por mês?\n"))
total = valor_hora*horas_trabalhadas
salario = total*0.89*0.92*0.95
println(salario)
