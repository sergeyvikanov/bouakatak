CREATE TABLE public.repondus
(
  id_joueur integer NOT NULL,
  id_question integer NOT NULL,
  CONSTRAINT pk_repondus PRIMARY KEY (id_joueur , id_question ),
  CONSTRAINT fk_rep_joueur FOREIGN KEY (id_joueur)
      REFERENCES public.joueurs (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_rep_question FOREIGN KEY (id_question)
      REFERENCES public.questions (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.repondus
  OWNER TO postgres;

 
 -- Table: public.questions

-- DROP TABLE public.questions;

CREATE TABLE public.questions
(
  id serial NOT NULL,
  enonce character varying(1500),
  reponse character varying(40),
  CONSTRAINT pk_questions PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.questions
  OWNER TO postgres;

  -- Table: public.joueurs

-- DROP TABLE public.joueurs;

CREATE TABLE public.joueurs
(
  id serial NOT NULL,
  pseudo character varying(20),
  email character varying(30),
  nom character varying(20),
  CONSTRAINT pk_joueurs PRIMARY KEY (id )
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.joueurs
  OWNER TO postgres;
