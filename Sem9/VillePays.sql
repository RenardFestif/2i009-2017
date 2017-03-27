create table Ville(
  nom varchar,
  population number,
  pays varchar,
  
  constraint fk_pays foreign key (pays) references Pays (nom)
  );
  
create table Pays(
  nom varchar, 
  capitale varchar,
  
  constraint pk_nom primary key (nom),
  constraint fk-cap foreign key (capitale) references Ville (nom)
  );
  
  
