create table Ville(
  nom varchar(20),
  population number,
  pays varchar(20),
  
  constraint fk_pays foreign key (pays) references Pays
  );
  
create table Pays(
  nom varchar(20), 
  capitale varchar(20),
  
  constraint pk_nom primary key (nom),
  constraint fk-cap foreign key (capitale) references Ville (nom)
  );
  
insert into Ville values ('Paris',3000000,'France');
insert into Pays values ('France','Paris');
