
MODULES = musicbrainz_collate

PGXS := $(shell pg_config --pgxs)
include $(PGXS)

ICU_LIBS = $(shell icu-config --ldflags-libsonly)

musicbrainz_collate.so: musicbrainz_collate.o
	$(CC) $(ICU_LIBS) -shared -o $@ $< 


