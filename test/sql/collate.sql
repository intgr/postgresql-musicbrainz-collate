CREATE EXTENSION musicbrainz_collate;

-- Warning: Older ICU versions (before 4.8 or 4.6) may give different results
SELECT * FROM unnest('{AAA,äää,ÄÄÄ,aaa}'::text[]) AS txt ORDER BY musicbrainz_collate(txt);
SELECT musicbrainz_collate('foobar');
SELECT musicbrainz_collate('ľščťžýáí');
SELECT musicbrainz_collate('');
SELECT musicbrainz_collate(null);

-- Additional tests from Unicode Technical Report #10
-- http://www.unicode.org/reports/tr10/
SELECT * FROM unnest(E'{
    de luge,
    de Luge,
    de\u002dluge,
    de\u002dLuge,
    de\u2010luge,
    de\u2010Luge,
    death,
    deluge,
    deLuge,
    demark,
    ☠happy,
    ☠sad,
    ♡happy,
    ♡sad
}'::text[]) AS txt ORDER BY musicbrainz_collate(txt);

SELECT * FROM unnest('{
    role,
    roles,
    rule,
    rôle,
    Role,
    rôle,
    “role”,
    ro□le
}'::text[]) AS txt ORDER BY musicbrainz_collate(txt);
