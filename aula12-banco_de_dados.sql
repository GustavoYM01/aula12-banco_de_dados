create database aula12;

use aula12; 

select * from alunos;
-- drop table alunos;

create table alunos (
	nome varchar(255),
    email varchar(255)
);

create table cursos_universidade (
	nome_curso varchar(255)
);

delimiter $

create procedure insere_seleciona_cursos(curso varchar(255))
begin
	insert into cursos_universidade values (curso);
    select  * from cursos_universidade;
end$

delimiter ;

call insere_seleciona_cursos('Análise e Desenvolvimento de Sistemas');
call insere_seleciona_cursos('Engenharia da Computação');
call insere_seleciona_cursos('Ciência da Computação');


delimiter $

create procedure emailAluno(nome varchar(255), sobrenome varchar(255), dominio varchar(255))
begin
	set @nome = nome;
    set @ponto = '.';
    set @sobrenome = sobrenome;
    set @arroba = '@';
    set @dominio = dominio;
    set @pontoCom = '.com';
    set @nomeAluno = concat(@nome, ' ', @sobrenome);
    set @emailAluno = concat(@nome, @ponto, @sobrenome, @arroba, @dominio, @pontoCom);
    insert into alunos (nome, email) values (@nomeAluno, @emailAluno);
    select * from alunos;
end$

delimiter ;

-- drop procedure emailAluno;

call emailAluno('joao', 'pedro', 'facens');
call emailAluno('leo', 'dovale', 'facens');