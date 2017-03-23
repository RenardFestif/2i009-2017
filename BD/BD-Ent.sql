create table Employee (
       numss number (15),
       nomE varchar (20),
       prenomE varchar (20),
       VilleE varchar (20),
       dateNaiss date,
       dateCour date default Sysdate,

constraint pk_emp primary key (numss),
constraint format_ss check (length(numss)=15),
constraint ville_emp check (lower(ville) in ('paris','lyon','marseille')),
constraint limit_age check (((dateCour-date)/365)<70),

);

create table Projet (
       numProjet number (7),
       nompProjet varchar (20),
       resProjet number not null,
       budget number (6),
       villeP vachar (20),

constraint pk_projet primary key (numProjet),
constraint fk_resp foreign key (respProjet) references Employee,
constraint ville_proj foreign key (villeP) references Employee,
constraint format_numproj check (numProjet between 10000 and 9999999),
);

create table Grille_SAL(
       profil varchar (7),
       salair number (7,2),

constraint pk_sal primary key (profil),
constraint sal_max (salair < 90000),
);

create table Embauche(
       numss number,
       numProj number,
       dateEmb date default sysdate,
       profil varchar 2,

constraint pk_emb primary key (numss,numProj),
constraint fk-emb foreign key (numss) references Employee,
constraint fk-emb_pro foreign key (numProj) references Projet,
constraint fk-sal foreign key (profil) references Grille_SAL,
);

create assertion domicile_resp check (not exists (	select *
       		 	       	     	  	 	from Employee e , Projet p
							where e.numss = p.resProjet and p.ville <> e.ville ));
