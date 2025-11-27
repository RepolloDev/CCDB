create table horario (
   id_horario bigserial primary key,
   turno      varchar(20),
   dia        varchar(20),
   h_inicio   time,
   h_fin      time,
   f_creacion timestamp default now(),
   f_edicion  timestamp default now()
);

create table periodo (
   id_periodo bigserial primary key,
   f_inicio   timestamp not null,
   f_fin      timestamp not null,
   f_creacion timestamp default now(),
   f_edicion timestamp default now()
);

create table salon (
   id_salon   bigserial primary key,
   nombre     varchar(50),
   piso       integer default 0,
   capacidad  integer default 0,
   f_creacion timestamp default now(),
   f_edicion  timestamp default now()
);

create table actividad (
   id_actividad  bigserial primary key,
   cod_actividad varchar(50) unique,
   nombre        varchar(200) not null,
   descripcion   varchar(1000) default '',
   f_creacion    timestamp default now(),
   f_edicion     timestamp default now(),
   id_periodo    bigint,
   id_horario    bigint,
   id_salon      bigint,
   constraint fk_actividad_periodo foreign key ( id_periodo )
      references periodo ( id_periodo ) ON DELETE CASCADE,
   constraint fk_actividad_horario foreign key ( id_horario )
      references horario ( id_horario ) ON DELETE CASCADE,
   constraint fk_actividad_salon foreign key ( id_salon )
      references salon ( id_salon ) ON DELETE CASCADE
);

create table persona (
   id_persona   bigserial primary key,
   ci           varchar(20) not null,
   nombre       varchar(100) not null,
   paterno      varchar(100) default '',
   materno      varchar(100) default '',
   celular      varchar(20) default '',
   genero       varchar(10) default '',
   f_nacimiento date,
   zona         varchar(100) default '',
   calle        varchar(100) default '',
   nro          varchar(10) default '',
   f_creacion   timestamp default now(),
   f_edicion    timestamp default now()
);

create table rol (
   id_rol bigserial primary key,
   tipo   varchar(50) not null
);

create table nivel_educacion (
   id_nvl_edu bigserial primary key,
   tipo       varchar(50) not null
);

create table tutor (
   id_tutor   bigserial primary key,
   id_persona bigint not null,
   parentesco varchar(50) default '',
   constraint fk_tutor_persona foreign key ( id_persona )
      references persona ( id_persona ) ON DELETE CASCADE
);

create table usuario (
   id_usuario  bigserial primary key,
   id_persona  bigint not null,
   email       varchar(100) unique not null,
   contrasenia varchar(100) not null,
   estado      varchar(20) default 'activo',
   f_creacion  timestamp default now(),
   f_edicion   timestamp default now(),
   id_rol      bigint not null,
   constraint fk_usuario_persona foreign key ( id_persona )
      references persona ( id_persona ) ON DELETE CASCADE,
   constraint fk_usuario_rol foreign key ( id_rol )
      references rol ( id_rol ) ON DELETE CASCADE
);

create table voluntario (
   id_voluntario bigserial primary key,
   id_persona    bigint not null,
   correo        varchar(100) default '',
   id_nvl_edu    bigint,
   constraint fk_voluntario_persona foreign key ( id_persona )
      references persona ( id_persona ) ON DELETE CASCADE,
   constraint fk_voluntario_nivel foreign key ( id_nvl_edu )
      references nivel_educacion ( id_nvl_edu ) ON DELETE CASCADE
);

create table participante (
   id_participante bigserial primary key,
   id_persona      bigint not null,
   matricula       varchar(50),
   estado          varchar(20) default 'activo',
   id_tutor        bigint,
   constraint fk_participante_persona foreign key ( id_persona )
      references persona ( id_persona ) ON DELETE CASCADE,
   constraint fk_participante_tutor foreign key ( id_tutor )
      references tutor ( id_tutor ) ON DELETE CASCADE
);

create table curso_taller (
   id_curtal     bigserial primary key,
   id_actividad  bigint not null,
   enlace        varchar(300) default '',
   id_voluntario bigint,
   constraint fk_ct_actividad foreign key ( id_actividad )
      references actividad ( id_actividad ) ON DELETE CASCADE,
   constraint fk_ct_voluntario foreign key ( id_voluntario )
      references voluntario ( id_voluntario ) ON DELETE CASCADE
);

create table servicio (
   id_servicio  bigserial primary key,
   id_actividad bigint not null,
   tipo         varchar(100) default '',
   estado       varchar(50) default 'activo',
   constraint fk_servicio_actividad foreign key ( id_actividad )
      references actividad ( id_actividad ) ON DELETE CASCADE
);

create table voluntario_participa_servicio (
   id_vps         bigserial primary key,
   id_servicio    bigint not null,
   id_voluntario  bigint not null,
   constraint uq_vps_serv_vol unique ( id_servicio, id_voluntario ),
   constraint fk_vps_servicio foreign key ( id_servicio )
      references servicio ( id_servicio ) ON DELETE CASCADE,
   constraint fk_vps_voluntario foreign key ( id_voluntario )
      references voluntario ( id_voluntario ) ON DELETE CASCADE
);

create table participante_seregistra_curso_taller (
   id_psct          bigserial primary key,
   id_curtal        bigint not null,
   id_participante  bigint not null,
   constraint uq_psct_curtal_part unique ( id_curtal, id_participante ),
   constraint fk_psct_curtal foreign key ( id_curtal )
      references curso_taller ( id_curtal ) ON DELETE CASCADE,
   constraint fk_psct_participante foreign key ( id_participante )
      references participante ( id_participante ) ON DELETE CASCADE
);

create table aporte (
   id_aporte       bigserial primary key,
   monto_total     numeric(10,2) default 0.00,
   descripcion     varchar(400) default '',
   f_creacion      timestamp default now(),
   f_edicion       timestamp default now(),
   id_participante bigint,
   constraint fk_aporte_participante foreign key ( id_participante )
      references participante ( id_participante ) ON DELETE CASCADE
);

create table registro_historico_aporte (
   id_rha     bigserial primary key,
   id_usuario bigint not null,
   id_aporte  bigint not null,
   fecha      timestamp default now(),
   constraint fk_rha_usuario foreign key ( id_usuario )
         references usuario ( id_usuario ) ON DELETE CASCADE,
      constraint fk_rha_aporte foreign key ( id_aporte )
         references aporte ( id_aporte ) ON DELETE CASCADE
);

create table registro_historico_persona (
   id_rhp      bigserial primary key,
   id_usuario  bigint not null,
   id_persona  bigint not null,
   fecha       timestamp default now(),
   descripcion varchar(4000) default '',
   constraint fk_rhp_usuario foreign key ( id_usuario )
         references usuario ( id_usuario ) ON DELETE CASCADE,
      constraint fk_rhp_persona foreign key ( id_persona )
         references persona ( id_persona ) ON DELETE CASCADE
);

create table registro_historico_actividad (
   id_rhac      bigserial primary key,
   id_usuario   bigint not null,
   id_actividad bigint not null,
   fecha        timestamp default now(),
   descripcion  varchar(4000) default '',
   constraint fk_rhac_usuario foreign key ( id_usuario )
         references usuario ( id_usuario ) ON DELETE CASCADE,
      constraint fk_rhac_actividad foreign key ( id_actividad )
         references actividad ( id_actividad ) ON DELETE CASCADE
);