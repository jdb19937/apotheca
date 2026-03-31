# Conventiones

Regulae formae pro omni codice et documentatione in apotheca — C, Rust,
Faceplicae, scripta, LEGEME.md, README.md.

## Lingua

Lingua Latina classica est lingua unica huius apothecae — non Latina
ecclesiastica, non Latina mediaevalis, sed lingua Caesaris et Ciceronis
quantum fieri potest aptata ad res technicas modernas. Hoc non solum
ad codicem pertinet sed ad omnem communicationem: commentaria, documenta,
nuntia committendi, descriptiones petitionum, et colloquia cum usitoribus.
Omnes qui in hac apotheca operantur Latine classice loqui debent.

Omnis codex Latine classice scribitur. Nomina variabilium, functionum,
typorum, commentaria, nuntii — omnia Latina. Vocabula technica moderna
(URL, HTTPS, TLS, JSON, POSIX, SHA-256, AES, RSA, TCP, ANSI, etc.)
immutata retinentur — non Latinizantur. Nomina functionum, variabilium,
mandatorum computatralium in formam originalem manent, saepe in codice
monospatio (`` ` ``).

Ubi vocabulum Latinum aptum adest, adhibetur: "plica" pro "file", "caudex"
pro "block", "aedificatio" pro "build", "proba" pro "test". Ubi nullum
vocabulum Latinum aptum adest vel ambiguitas oritur, vocabulum technicum
retinetur.

## Nomina

### Variabilia — minusculae cum lineis inferioribus

```
num_signa         fons_lon          index_alvei
columna           linea             modus_tacitus
clavis            valor             longitudo
precedenti        currentes         residua
portus            hospes            via
```

### Functiones — minusculae cum lineis inferioribus, praefixo moduli

```
ison_scriptor_crea()      ison_da_chordam()       ison_lege_plicam()
crispus_facilis_initia()   crispus_facilis_age()   crispus_facilis_pone()
lexator_disseca()          schema_valida()         tabula_crea()
summa256_initia()          arca128_occulta()       nm_ex_nihilo()
```

Praefixum moduli nomen bibliothecae indicat: `ison_`, `crispus_`, `schema_`,
etc. Functiones internae sine praefixo publico esse possunt.

### Typi (struct, enum, typedef) — minusculae cum lineis inferioribus et suffixo _t

```
ison_scriptor_t     signum_t           lexator_t
schema_t            tabula_t           cella_t
animus_t            contextus_t        nm_t
dictum_t            lexicon_t          genus_ops_t
summa256_ctx_t      arca128_ctx_t      directio_t
```

Suffixum `_t` semper adhibetur. Nomina Latina.

### Typi opaci — MAIUSCULAE sine suffixo

```
typedef void CRISPUS;       /* manubrium facile */
typedef void CRISPUSM;      /* manubrium multiplex */
typedef int CRISPUScode;
typedef int CRISPUSMcode;
```

Haec forma rara est — solum pro interfaciis opacis ad modum cURL.

### Enumerationes — MAIUSCULAE Latine

Nomen typi minusculis cum _t; valores MAIUSCULAE cum praefixo:

```
signum_genus_t:   SIGNUM_FINIS, SIGNUM_SPATIUM, SIGNUM_CHORDA, SIGNUM_VERBUM
gravitas_t:       GRAVITAS_MONITUM, GRAVITAS_ERRATUM
phylum_t:         FIXUM, CIBUS, ANIMA, DEI
genus_t:          VACUUM, SAXUM, FELES, URSUS, MURUS, RAPUM, FUNGUS
directio_t:       DIR_NIHIL, SEPTENTRIO, MERIDIES, OCCIDENS, ORIENS
modus_t:          QUIESCE, MOVE, PELLE, CAPE, TRAHE, LOQUERE, OPPUGNA
```

### Macrae — MAIUSCULAE Latine

```
SIGNA_MAX          VIA_MAX            NUNTIUS_MAX
LIM_FILUM          LIM_VERSUS         LIM_REGULAE
CRISPUSE_OK        CRISPUSE_ERRATUM   CRISPUSE_MEMORIA
CRISPUSOPT_URL     CRISPUSOPT_CAPITA_HTTP
CAP_MOVE           CAP_PELLE          CAP_CAPE
GRADUS_PRAEFINITUM PI_GRAECUM
FOSSA_LIBERA       FOSSA_VOLANS       FOSSA_PERFECTA
```

### Custodiae capitum — NOMEN_H

```
#ifndef ISON_H
#define ISON_H
...
#endif /* ISON_H */
```

Nomen MAIUSCULUM cum `_H`. Commentarium post `#endif`.

## Commentaria

### Caput plicae — blocum /* */

```
/*
 * ison.h — ISON auxiliaria
 *
 * Scriptor aedificat objecta ISON.
 * Lector paria clavis-valor ex objecto plano extrahit.
 * Navigator per viam punctatam ("a.b[0].c") navigat.
 */
```

Prima linea: nomen plicae, trabs, descriptio brevis. Sequentes lineae
explicationem addunt si opus est.

### Divisores sectionum

```
/* ================================================================
 * signa (tokens) — lexator
 * ================================================================ */
```

Vel cum lineis brevioribus:

```
/* --- scriptor --- */
```

### Documentatio functionum — supra declarationem

```
/*
 * ison_lege_plicam — legit plicam integrum in memoriam.
 * vocans liberet per free(). reddit NULL si error.
 */
char *ison_lege_plicam(const char *via);
```

Brevis. Imperative. Reddit quid et effectus laterales.

### Commentaria interna — // vel /* */

```
int linea   = 1;
int columna = 0;  // positus incipiens

/* est character vocabuli? */
static int est_verbale(int c)
```

Utraque forma acceptabilis. Praefertur brevitas.

### Commentaria enumerationum

```
typedef enum {
    SIGNUM_FINIS = 0,       /* finis fasciculi */
    SIGNUM_SPATIUM,         /* spatia et tabulae */
    SIGNUM_LINEA_NOVA,      /* '\n' */
} signum_genus_t;
```

Commentarium breve post unumquodque valorem.

### Stilus commentariorum

- Latina classica, tonus directus et siccus
- Explicare "cur", non "quid" (ubi "quid" clarum est ex codice)
- Nulla verbositas superflua
- Vocabula technica immutata

## Structura plicae C

Ordo:

1. Commentarium capitis (/* */)
2. Custodia capitis (`#ifndef` / `#define`)
3. Inclusiones — locales primum, deinde std, deinde POSIX
4. Divisores sectionum (`/* === */`)
5. Definitiones typorum
6. Declarationes functionum
7. Macrae (si interfacies publica)
8. `#endif` cum commentario

### Ordo inclusionum

```
#include "ison.h"          /* locale primum */
#include "internum.h"

#include <ctype.h>         /* std deinde */
#include <stdlib.h>
#include <string.h>

#include <sys/socket.h>    /* POSIX ultimo */
#include <netdb.h>
```

## Rust (cancer/)

Translationes Rusticae in directorio `cancer/` iacent. Conventiones C
sequuntur quantum lingua Rust permittit.

### Structurae — PascalCase Latine

```
pub struct CrispusFacilis { ... }
pub struct CrispusMulti { ... }
pub struct IsonScriptor { ... }
pub struct UrlPartes { ... }
```

PascalCase est conventio Rustica; nomina Latina manent.

### Functiones et variabilia — minusculae cum lineis inferioribus

```
pub fn crispus_slist_adde(...)
fn scribe_chordam(receptaculum: &mut String, s: &str)
pub fn crea() -> Self
pub fn adde(&mut self, clavis: &str, valor: &str)
pub fn fini(mut self) -> String

let mut portus: u16 = 443;
let hospes: String;
let via: String;
```

### Moduli — minusculae

```
pub mod arca;
pub mod crispus;
pub mod numerus;
pub mod summa;
pub mod effugium;
pub mod scriptor;
pub mod navigator;
```

### Constantiae — MAIUSCULAE Latine

```
const LIM_FILUM: usize = 131072;
const LIM_PRAECEPTA: usize = 256;
pub const CRISPUSE_OK: i32 = 0;
pub const CRISPUSMSG_PERFECTUM: i32 = 1;
```

### Commentaria Rustica

```
//! cancer — bibliotheca retis HTTPS sine dependentiis externis
//!
//! Translatio fidelis Rustica ex bibliotheca crispus.

/// Index capitum — catena coniuncta ut crispus_slist in C
pub struct CrispusSlist { ... }

// praetermitte schema
if let Some(post) = s.strip_prefix("https://") {
```

Doc commentaria `//!` (modulus) et `///` (elementum). Commentaria
interna `//`. Omnia Latine.

Capita plicarum Rusticarum etiam blocum `/* */` adhibere possunt si
congruentia cum plica C servanda est.

## Arbor fontis

### Radix apothecae

```
apotheca/
    Faceplica              # aedificatio radicis
    LEGEME.md              # documentatio Latina
    README.md              # documentatio Anglica (venditoria)
    CONVENTIONES.md        # regulae formae
    .gitmodules
    scripta/               # scripta auxiliaria (.sh)
```

### Submoduli — structura typica

```
submodulum/
    Faceplica              # aedificatio (semper praesens)
    LEGEME.md              # documentatio Latina
    README.md              # documentatio Anglica
    nomen.c                # fons principalis
    nomen.h                # caput publicum
    internum.h             # caput internum (si opus)
    proba.c                # probationes (si adsunt)
    cancer/                # translatio Rustica
        Cargo.toml
        src/
            lib.rs         # radix moduli Rustici
            modulus.rs     # moduli singuli
            bin/           # executabilia Rustica (si adsunt)
        tests/             # probationes Rusticae (si adsunt)
```

Nomina plicarum Latina: `principale.c`, `inspectio.c`, `lexator.c`,
`arcana.c`, `numerus.c`, `velum.c`, `utilia.c`.

### Bibliotheca simplex (exemplum: ison)

```
ison/
    Faceplica
    ison.c                 # fons unicus
    ison.h                 # caput unicum
    cancer/src/lib.rs      # translatio Rustica
```

### Bibliotheca composita (exemplum: crispus)

```
crispus/
    Faceplica
    crispus.c  crispus.h   # retis HTTPS
    arcana.c   arcana.h    # cryptographia
    numerus.c              # numeri magni
    summa.c                # SHA-256
    velum.c                # TLS
    internum.h             # caput internum commune
    utilia.h               # macrae auxiliares
    proba.c    proba.h     # probationes
    crispe.c               # instrumentum mandati lineae
    cancer/src/            # moduli Rustici paralleli
```

### Applicatio complexa (exemplum: munda)

```
munda/
    Faceplica
    curre.c                # executabile principale (sine terminali)
    lude.c                 # executabile interactivum
    fare.c                 # imperativum oraculi
    daemonium.c            # servitor TCP
    coniunge.c             # cliens interactivus
    specta.c               # cliens sine capite
    tabula.c  tabula.h     # tabula (grid)
    oraculum.c oraculum.h  # interfacies oraculi
    terminalis.c/h         # interfacies terminalis
    cogitatio.c/h          # logica cogitationis
    utilia.c/h             # auxiliaria communia
    fictio.c/h             # fictiones probationis
    genera.h               # enumerationes generum
    cellula.h              # definitio cellulae fundamentalis
    cella.h                # definitio cellae plenae
    cellae/                # implementationes per phylum
        fixum.c/h          # phylum FIXUM (dispatch)
        cibus.c/h          # phylum CIBUS (dispatch)
        animus.c/h         # phylum ANIMA (dispatch)
        deus.c/h           # phylum DEI (dispatch)
        fixa/              # cellae fixae singulae
            vacuum.c/h
            saxum.c/h
            murus.c/h
        cibi/              # cellae cibi singulae
            rapum.c/h
            fungus.c/h
        animae/            # cellae animatae singulae
            feles.c/h
            ursus.c/h
            dalekus.c/h
            corvus.c/h
        dei/               # cellae divinae singulae
            zodus.c/h
            oculus.c/h
    oracula/               # provisores oraculi
        provisor.h         # interfacies provisoris
        openai.c
        anthropic.c
        xai.c
        fictus.c           # provisor fictus (probatio)
    retis/                 # protocollum retis TCP
        retis.c/h
        serializa.c/h
        cliens.c/h
        visus.c/h
        crudus.c/h
    mundae/                # plicae configurationis mundorum
    schemae/               # schemata ISON
    ison/                  # submodulum (dependentia)
    crispus/               # submodulum (dependentia)
```

### Directoria aedificationis

Objecta (`.o`) et bibliothecae (`.a`) et executabilia in eodem directorio
cum fontibus iacent. Nullum directorium separatum aedificationis (`build/`,
`out/`, `target/`). Rust exceptionem habet: `cancer/target/` a Cargo
generatur.

## Indentatio

Codex C in `face/` tabulis indentat. Omnis alius codex (C, Rust, scripta)
quattuor spatiis indentat. Faceplicae ipsae tabulis indentant, ut `face`
requirit.

## Formatio

Bracchia circa corpus unius sententiae non requiruntur:

```
if (!fons) return -1;
if (c == '\n') break;
for (int i = 0; i < n; i++) sum += v[i];
```

Bracchia adhibenda sunt si corpus plures lineas occupat.

## Faceplicae

### Variabilia — MAIUSCULAE vel minusculae cum lineis inferioribus

```
CC       ?= cc
AR       ?= ar
CFLAGS   ?= -Wall -Wextra -pedantic -std=c99 -O2
FONTES   = ison.c
OBJECTA  = $(FONTES:.c=.o)
BIBLIOTHECA = libison.a
```

Nomina variabilium Latina: `FONTES`, `OBJECTA`, `BIBLIOTHECA`, `COMMUNES`,
`CAPITA`, `APOTHECA`.

### Scopi (targets) — Latine

```
omnia          # aedifica omnia (default)
purga          # dele aedificata
proba          # curre probationes
para           # initia submodula
expara         # remove submodula
trahe          # trahe capita recentissima
firma          # firma ad commit fixum
fige           # fige ad tags ultimas
signa          # signa apothecam
census         # numeratio linearum
```

### Commentaria — # Latine

```
# Faceplica — aedificatio libison.a
#
# Usus:
#   face            — aedifica libison.a
#   face purga      — dele omnia aedificata
```

## Glossarium technicum

| Vocabulum | Definitio |
|---|---|
| plica | res in systemate plicarum reposita, continens data vel codicem |
| chorda | series characterum in memoria disposita |
| numerus | quantitas mathematica, integer vel fractus |
| clavis | nomen quo valor in pare clavis-valor identificatur |
| valor | datum quod clavi respondetur |
| via | iter per systema plicarum vel per structuram ISON ad elementum inveniendum |
| signum | unitas minima quam lexator ex fonte dissecta reddit |
| fons | textus originalis codicis qui dissecandus vel compilandus est |
| caput / capita | plica declarationum (.h) quae interfaciem publicam exponit |
| alveus | regio memoriae temporaria in quam data scribuntur antequam emittantur |
| caudex | portio codicis vel textus inter delimitatores contenta |
| linea | versus unus in plica, characteribus a principio ad '\n' |
| columna | positio horizontalis characteris in linea, ab 0 numerata |
| longitudo | mensura quantitatis characterum vel elementorum |
| probatio | examen automaticum quo rectitudo codicis confirmatur |
| aedificatio | processus quo ex fontibus executabilia vel bibliothecae generantur |
| purga | deletio omnium rerum aedificatarum ut status pristinus restituatur |
| morire | exitio fatalis cum nuntio erroris — programma statim terminatur |
| genus | classificatio rei — typus vel species |
| modus | status vel actio quam res agit |
| fictus | simulatus — qui sine effectu vero responsa praefinita reddit |
| daemonium | processus qui in fundo currit et coniunctiones accipit |
| retis | systema communicationis inter processus |
| mandatum | imperium quod usitor vel systema exsequendum dat |
| scopus | res quae aedificanda est — plica vel executabile destinatum |

---

## Conventiones LEGEME.md

Regulae formae pro omnibus pliculis LEGEME.md in apotheca. LEGEME.md
documentationem veram continent — technicas, directas, Latinas.

### Structura

1. Titulus `#` cum nomine subiecti
2. Paragraphus descriptionis (una vel duae sententiae)
3. Nota blockquote: `> **Nota:** README.md ignorandum est. Anglice scriptum est ad barbaros ineruditos pecunia emungendos.`
4. Sectiones `##` ordine logico

### Ordo sectionum commendatus

- Aedificatio
- Usus
- (Sectiones specificae subiecti)
- Cancer (si adest)
- Dependentiae (si adest)
- Licentia (si adest)

### Forma

- Caudices codicis semper sepiti cum `` ``` `` (numquam indentati)
- Caudices nudi — sine lingua post `` ``` ``
- Separatores tabularum minimi: `|---|---|`
- Linea vacua ante et post elementa truncalia (tabulae, caudices, capita)
- Hierarchia capitum: `#` > `##` > `###`, sine saltu
- Nullae spatia terminalia

### Glossarium LEGEME

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

### Stilus LEGEME

Tonus est directus, siccus, practicus. Nulla iactatoria, nulla venditio, nullus
humor. Descriptiones breves et accuratae. Sententiae simplices praeferuntur;
periodi longae et complexae vitandae. Documentatio technica est, non prosa
litteraria.

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

---

## Conventiones README.md

Regulae formae pro omnibus pliculis README.md in apotheca. README.md Anglice
scripta sunt ad barbaros ineruditos pecunia emungendos. Tonus pro quoque
submodulo variare potest. Structura congruere debet.

### Structura README

1. Titulus `#` cum nomine subiecti
2. Descriptio introductoria
3. Sectiones specificae subiecti (tonus liber)
4. `## The Rust Port` (si `cancer/` adest)
5. `## License`

The Rust Port et License semper ultimae sectiones, hoc ordine.

### Forma README

- Capita Title Case: `## Getting Started`, non `## Getting started`
- Caudices semper cum lingua: `` ```bash ``, `` ```c ``, `` ```json ``, `` ```text ``
- Separatores tabularum minimi: `|---|---|`

### Glossarium README

| Vocabulum canonicum | Non scribas |
|---|---|
| The Rust Port | ~~Rust Implementation~~, ~~cancer — ...~~ |
| License | Semper praesens. Textus liber, sed non "See LICENSE for details." |

### Stilus README

README.md Anglice scripta sunt — documenta venditoria. LEGEME.md documentationem
veram continent; README.md exstant ut lectores Anglicos in GitHub attrahant,
afficiant, persuadeant. README.md documentum technicum non est — prosa
venditoria est.

#### Tonus

Fidens, grandiloquens, superbus. README.md iactat, persuadet, afficit. Superlativa
libere adhibenda sunt. Verbositas virtus est — sententiae longae, elaboratae,
rhetoricae acceptantur et commendantur. Lectorem non informare sed convertere vis.

- **Superlativus.** "Best", "fastest", "most elegant" — haec verba non timenda sunt.
  Si res bona est, dic eam optimam esse. Modestia in venditione vitium est.
- **Verbosus.** Nulla brevitas necessaria. Expande, elabora, orna. Si sententia
  rem bene dicit, adde alteram quae melius dicit. Prosa fluere debet, non
  staccato procedere.
- **Fidens sine dubitatione.** Numquam cave, minora, vel excusa. Non "simple but
  effective", non "admittedly limited", non "for most use cases". Assertiones
  absolutae. Fiducia totalis.
- **Persuasivus.** Quaeque sectio valorem subiecti arguere debet. Nulla sectio
  mere descriptiva — omnia vendunt.
- **Comparativus.** Comparationes implicitae cum instrumentis notis efficaces sunt
  ("Other projects depend on OpenSSL and hope for the best"). Numquam per nomen
  reprehendere, sed semper ostendere cur hoc melius sit.

#### Principia venditoria

- Nullas dependentias externas ut virtutem cardinalem ubique extollere.
- Lectorem technice peritum sed cum subiecto ignotum praesumere.
- Detalia concreta (numeri versuum, nomina algorithmorum, suites cryptographicae)
  persuadent magis quam assertiones vagae — superlativa concretis fulcire.
- Numquam se excusare, dubitare, vel minorare.
- Numquam linguam Latinam memorare, explicare, vel iustificare. Ne dicas cur
  codex Latine scriptus est. Ne dicas codicem Latine scriptum esse. Nomina
  Latina functionum et variabilium tractanda sunt ut nomina quaelibet —
  sine commentario, sine explicatione, sine curiositate.

#### Sectiones constantes

Sectiones "The Rust Port" semper communicant: translationem Rusticam completam et
fidelem in `cancer/` exstare, nullas dependentias externas habere, et paritatem
cum implementatione C servari.

Sectio "License" semper eadem, verbatim:

```
## License

Free. Public domain. Use however you like.
```

Caudices codicis linguam indicant: `bash` pro mandatis shell, `c` pro codice C,
`json` pro ISON, `text` pro exitu vel formatis.
