Algoritmo EvaluacionApp
	Definir opcion, numEstudiantes, i, e Como Entero
	Definir a, b, resultado, suma, promedioGeneral, notaMayor, notaMenor Como Real
	Definir operacion Como Cadena
	Definir notasRegistradas, operacionRealizada Como Lógico
	Definir operacionGuardar Como Cadena
	Dimensionar nombres(100)
	Dimensionar todasNotas(100,5)
	Dimensionar promedios(100)
	notasRegistradas <- Falso
	operacionRealizada <- Falso
	Repetir
		Escribir '----- MENU INTERACTIVO -----'
		Escribir '1. Operaciones básicas'
		Escribir '2. Registro de notas'
		Escribir '3. Guardar resultados'
		Escribir '4. Salir'
		Leer opcion
		Según opcion Hacer
			1:
				Escribir 'Ingrese el primer número: '
				Leer a
				Escribir 'Ingrese el segundo número: '
				Leer b
				Escribir 'Ingrese la operación (+,-,*,/): '
				Leer operacion
				Según operacion Hacer
					'+':
						resultado <- a+b
						Escribir 'Resultado: ', resultado
						operacionGuardar <- ConvertirATexto(a)+' + '+ConvertirATexto(b)+' = '+ConvertirATexto(resultado)
					'-':
						resultado <- a-b
						Escribir 'Resultado: ', resultado
						operacionGuardar <- ConvertirATexto(a)+' - '+ConvertirATexto(b)+' = '+ConvertirATexto(resultado)
					'*':
						resultado <- a*b
						Escribir 'Resultado: ', resultado
						operacionGuardar <- ConvertirATexto(a)+' * '+ConvertirATexto(b)+' = '+ConvertirATexto(resultado)
					'/':
						Si b<>0 Entonces
							resultado <- a/b
							Escribir 'Resultado: ', resultado
							operacionGuardar <- ConvertirATexto(a)+' / '+ConvertirATexto(b)+' = '+ConvertirATexto(resultado)
						SiNo
							Escribir 'Error: División entre cero.'
							operacionGuardar <- 'Intento de división entre cero: '+ConvertirATexto(a)+' / '+ConvertirATexto(b)
						FinSi
					De Otro Modo:
						Escribir 'Operación no válida.'
						operacionGuardar <- 'Operación inválida'
				FinSegún
				operacionRealizada <- Verdadero
			2:
				Escribir 'Ingrese el número de estudiantes a registrar: '
				Leer numEstudiantes
				Para e<-1 Hasta numEstudiantes Hacer
					Escribir 'Ingrese el nombre del estudiante ', e, ': '
					Leer nombres[e]
					suma <- 0
					Para i<-1 Hasta 5 Hacer
						Repetir
							Escribir 'Ingrese nota ', i, ' (0 a 10): '
							Leer todasNotas[e,i]
							Si todasNotas[e,i]<0 O todasNotas[e,i]>10 Entonces
								Escribir 'Nota inválida. Debe estar entre 0 y 10.'
							FinSi
						Hasta Que todasNotas[e,i]>=0 Y todasNotas[e,i]<=10
						suma <- suma+todasNotas[e,i]
					FinPara
					promedios[e] <- suma/5
				FinPara
				notasRegistradas <- Verdadero
				Escribir 'Registro de notas completado.'
			3:
				Si operacionRealizada Entonces
					Escribir '--- OPERACION BASICA ---'
					Escribir operacionGuardar
					operacionRealizada <- Falso
				SiNo
					Si notasRegistradas Entonces
						promedioGeneral <- 0
						notaMayor <- -1
						notaMenor <- 11
						Definir totalAprobados, totalReprobados Como Entero
						totalAprobados <- 0
						totalReprobados <- 0
						Para e<-1 Hasta numEstudiantes Hacer
							promedioGeneral <- promedioGeneral+promedios[e]
							Si promedios[e]>notaMayor Entonces
								notaMayor <- promedios[e]
							FinSi
							Si promedios[e]<notaMenor Entonces
								notaMenor <- promedios[e]
							FinSi
							Si promedios[e]>=7 Entonces
								totalAprobados <- totalAprobados+1
							SiNo
								totalReprobados <- totalReprobados+1
							FinSi
						FinPara
						promedioGeneral <- promedioGeneral/numEstudiantes
						Escribir '--- RESUMEN FINAL ---'
						Para e<-1 Hasta numEstudiantes Hacer
							Escribir 'Estudiante: ', nombres[e], ' | Promedio: ', promedios[e]
						FinPara
						Escribir 'Promedio general: ', promedioGeneral
						Escribir 'Nota mayor: ', notaMayor
						Escribir 'Nota menor: ', notaMenor
						Escribir 'Aprobados: ', totalAprobados
						Escribir 'Reprobados: ', totalReprobados
						notasRegistradas <- Falso
					SiNo
						Escribir 'No hay resultados para guardar.'
					FinSi
				FinSi
			4:
				Escribir 'Saliendo del programa...'
			De Otro Modo:
				Escribir 'Opción inválida. Intente de nuevo.'
		FinSegún
	Hasta Que opcion=4
FinAlgoritmo

Funcion SinTitulo
	
FinFuncion
