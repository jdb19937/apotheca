# Conventiones LEGEME.md

Regulae formae pro omnibus pliculis LEGEME.md in apotheca.

## Structura

1. Titulus `#` cum nomine subiecti
2. Paragraphus descriptionis (una vel duae sententiae)
3. Nota blockquote: `> **Nota:** README.md ignorandum est...`
4. Sectiones `##` ordine logico

## Ordo sectionum commendatus

- Aedificatio
- Usus
- (Sectiones specificae subiecti)
- Cancer (si adest)
- Dependentiae (si adest)
- Licentia (si adest)

## Forma

- Caudices codicis semper sepiti cum `` ``` `` (numquam indentati)
- Caudices nudi — sine lingua post `` ``` ``
- Separatores tabularum minimi: `|---|---|`
- Linea vacua ante et post elementa truncalia (tabulae, caudices, capita)
- Hierarchia capitum: `#` > `##` > `###`, sine saltu
- Nullae spatia terminalia

## Glossarium

Vocabula canonica quae in omnibus LEGEME.md adhibenda sunt:

| Vocabulum canonicum | Non scribas | Significatio |
|---|---|---|
| Aedificatio | ~~Compilatio~~ | Sectio de aedificando |
| Rustica | ~~Rusta~~ | Adiectivum linguae Rust (femininum ad "translatio") |
| Cancer | ~~cancer~~ | Sectio de translatione Rustica (semper maiuscula) |
| dependentiae externae | — | Formulae: "sine ullis dependentiis externis" vel "nullae dependentiae externae" |
| purga | ~~mundum~~ | Mandatum ad purgandum (ubi `face` vel `make` adhibetur) |
| Plicae | ~~Fasciculi~~ | Sectio enumerans plicas fontis |
| Probationes | — | Sectio de probationibus (non "Tests") |

## Stilus scribendi

LEGEME.md Latine classice scripta sunt — non Latine ecclesiastica, non Latine
mediaevali, sed lingua Caesaris et Ciceronis quantum fieri potest aptata ad res
technicas modernas.

Tonus est directus, siccus, practicus. Nulla iactatoria, nulla venditio, nullus
humor. Descriptiones breves et accuratae. Sententiae simplices praeferuntur;
periodi longae et complexae vitandae. Documentatio technica est, non prosa
litteraria.

Vocabula technica moderna (URL, HTTPS, TLS, JSON, POSIX, etc.) immutata
retinentur — non Latinizantur. Nomina functionum, variabilium, mandatorum
computatralium in formam originalem manent, saepe in codice monospatio (`` ` ``).

Ubi vocabulum Latinum aptum adest, adhibetur: "plica" pro "file", "caudex" pro
"block", "aedificatio" pro "build", "proba" pro "test". Ubi nullum vocabulum
Latinum aptum adest vel ambiguitas oritur, vocabulum technicum retinetur.

Sectiones repetitae (Nota, Cancer) verbatim inter plicas congruere debent.
Sectiones specificae subiecti libere scribi possunt, sed eodem tono sicco et
directo.

Exempla boni stili:
- "Nullae dependentiae externae. Solum compilator C et `make`."
- "Translatio Rustica in `cancer/` iacet. Non curatur."
- "Configuratio per plicam ISON. Omnes campi optionales sunt — defalta supplentur."

Exempla mali stili:
- Superlativa venditoria ("optima", "velocissima", "sine pari")
- Explicationes longae ubi sententia brevis sufficit
- Anglicismi ubi vocabulum Latinum commune adest
