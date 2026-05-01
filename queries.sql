USE cadastro;

- Ver a tabela alunos completa

SELECT * FROM alunos;

- Uma lista de todas as mulheres | 22 mulheres encontradas na lista
    
SELECT * FROM alunos
WHERE sexo = 'F';
        
- Uma lista com os dados de todos aqueles que nasceram entre 1Jan2000 e 31Dez2015 | 19 alunos

SELECT * FROM alunos
WHERE nascimento BETWEEN '2000-01-01' AND '2015-12-31';
    
    
- Uma lista com o nome de todos os homens que trabalham como Programador | 16 alunos são programadores e 11 são homens 
    
SELECT * FROM alunos
WHERE sexo = 'M' 
  AND profissao = 'programador';
   
    
    
- Uma lista com os dados de todas as mulheres que nasceram no Brasil e que tem seu nome iniciando com a letra J | 
			Somente a aluna Jarismar, com ID 33 atende aos requisitos.

    
SELECT * FROM alunos
WHERE sexo = 'F' 
  AND nacionalidade = 'Brasil'
  AND nome LIKE 'J%';
    
    
- Uma lista com o nome e nacionalidade de todos os homens que tem Silva no nome, não nasceram no Brasil e pesam menos de 100kg
		Somente o aluno Herisson Silva atende aos requisito, ele mora nos EUA. Pesa 74.65
		
SELECT nome,nacionalidade,peso FROM alunos
WHERE sexo = 'M'
	AND nome LIKE '%Silva%'
	AND nacionalidade != 'Brasil' 
	AND peso < 100; 


- Qual é a maior altura entre os homens que moram no Brasil | 2.35

SELECT MAX(altura) FROM alunos
WHERE sexo = 'M'
	AND nacionalidade = 'Brasil';

- Qual é a média de peso dos homens cadastrados | 78.32

SELECT AVG(peso) FROM alunos
WHERE sexo = 'M';

- Qual é o menor peso entre as mulheres que nasceram fora do BR e entre 01Jan1990 e 31Dez2000 | Elaine Nunes com 35.9 kg

SELECT MIN(peso) FROM alunos
WHERE sexo = 'F'
	AND nacionalidade != 'Brasil'
	AND nascimento BETWEEN '1990-01-01' AND '2000-12-31';

SELECT nome FROM alunos
WHERE peso = 35.9;

- Qual é a média de peso de todos os cadastrados | 73.96

SELECT AVG(peso) FROM alunos;

- Quantas mulheres tem mais de 1.90 de altura | 5 mulheres

SELECT COUNT(*) FROM alunos
WHERE sexo = 'F'
	AND altura > 1.90;

- Uma lista com as profissões dos alunos e seus respectivos quantitativos | 
		Auxiliar ADM = 13, Farmaceutico = 2, Programador = 16, Professor = 7, Dentista = 7, Ator = 6, Empreendedor = 7, Médico = 3.

SELECT profissao, COUNT(*) FROM alunos
	GROUP BY profissao;

- Quantos alunos homens e quantas alunas mulheres nasceram após 01Jan2005 | 8 homens e 2 mulheres.

SELECT sexo, COUNT(*) FROM alunos
WHERE nascimento > '2005-01-01'
GROUP BY sexo;

- Uma lista com os alunos que nasceram foram do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. 
	Só nos interessam os países que tiverem mais de 3 alunos com essa nacionalidade
	Portugal = 8, EUA = 8, Canadá = 4, Angola = 4

SELECT nacionalidade, COUNT(*) FROM alunos
WHERE nacionalidade != 'Brasil'
	GROUP BY nacionalidade HAVING COUNT(*) > 3;


- Uma lista agrupada pela altura dos alunos, mostrando quantas pessoas pesam mais de 100kg e que estão acima da média de altura de todos os cadastrados | 8 pessoas

SELECT COUNT(altura) FROM alunos
WHERE peso > 100 
	AND altura > (SELECT AVG(altura) FROM alunos);

SELECT altura, COUNT(*) FROM alunos
WHERE peso > 100
GROUP BY altura
HAVING altura > (SELECT AVG(altura) FROM alunos);


- Uma lista com o nome e a idade de todos os alunos que nasceram no Brasil, têm mais de 25 anos, e cuja altura é maior que a média de altura de todos os alunos cadastrados.
	Daniel Morais, Leila Martins, Letícia Neves, Valter Vilmerson, Rosana Kunz, Paulo Narley, Tiago Ulisses, Robson Rodolpho, Bruna Teles, Denilson Barbosa da Silva, Philppe Oliveira

SELECT nome FROM alunos
WHERE nacionalidade = 'Brasil'
	AND nascimento < '2001-05-01'
	AND altura > (SELECT AVG(altura) FROM alunos);


