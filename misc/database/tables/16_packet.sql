create table packet (
     "id" bigserial not null,
     "station_id" bigint not null,
     "sender_id" bigint not null,
     "marker_id" bigint null,
     "marker_counter" int null,
     "packet_type_id" smallint not null,
     "timestamp" bigint not null,
     "reported_timestamp" bigint null,
     "position_timestamp" bigint null,
     "latitude" double precision null,
     "longitude" double precision null,
     "posambiguity" smallint null,
     "symbol" text null,
     "symbol_table" text null,
     "map_sector" int null,
     "related_map_sectors" int array null,
     "map_id" smallint default 1,
     "source_id" smallint default 1,
     "speed" real null,
     "course" real null,
     "altitude" real null,
     "rng" real null,
     "latest_rng_timestamp" bigint null,
     "phg" int null,
     "latest_phg_timestamp" bigint null,
     "packet_tail_timestamp" bigint null,
     "is_moving" smallint null,
     "comment" text null,
     "raw_path" text null,
     "raw" text null,
     "to_call" text GENERATED ALWAYS AS ("substring"(raw, '::(.*?) :'::text)) STORED,
     primary key (id),
     foreign key(packet_type_id) references packet_type(id),
     foreign key(station_id) references station(id),
     foreign key(sender_id) references sender(id),
     foreign key(map_id) references map(id),
     foreign key(source_id) references source(id)
);
