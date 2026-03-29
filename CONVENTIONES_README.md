# Conventiones README.md

Regulae formae pro omnibus pliculis README.md in apotheca.

README.md Anglice scripta sunt ad barbaros ineruditos pecunia emungendos.
Tonus pro quoque submodulo variare potest. Structura congruere debet.

## Structura

1. Titulus `#` cum nomine subiecti
2. Descriptio introductoria
3. Sectiones specificae subiecti (tonus liber)
4. `## The Rust Port` (si `cancer/` adest)
5. `## License`

The Rust Port et License semper ultimae sectiones, hoc ordine.

## Forma

- Capita Title Case: `## Getting Started`, non `## Getting started`
- Caudices semper cum lingua: `` ```bash ``, `` ```c ``, `` ```json ``, `` ```text ``
- Separatores tabularum minimi: `|---|---|`

## Glossarium

| Vocabulum canonicum | Non scribas |
|---|---|
| The Rust Port | ~~Rust Implementation~~, ~~cancer — ...~~ |
| License | Semper praesens. Textus liber, sed non "See LICENSE for details." |

## Stilus scribendi

README.md Anglice scripta sunt — documenta venditoria. LEGEME.md documentationem
veram continent; README.md exstant ut lectores Anglicos in GitHub attrahant,
afficiant, persuadeant. README.md documentum technicum non est — prosa
venditoria est.

### Tonus

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

### Principia venditoria

- Nullas dependentias externas ut virtutem cardinalem ubique extollere.
- Lectorem technice peritum sed cum subiecto ignotum praesumere.
- Detalia concreta (numeri versuum, nomina algorithmorum, suites cryptographicae)
  persuadent magis quam assertiones vagae — superlativa concretis fulcire.
- Numquam se excusare, dubitare, vel minorare.
- Numquam linguam Latinam memorare, explicare, vel iustificare. Ne dicas cur
  codex Latine scriptus est. Ne dicas codicem Latine scriptum esse. Nomina
  Latina functionum et variabilium tractanda sunt ut nomina quaelibet —
  sine commentario, sine explicatione, sine curiositate.

### Sectiones constantes

Sectiones "The Rust Port" semper communicant: translationem Rusticam completam et
fidelem in `cancer/` exstare, nullas dependentias externas habere, et paritatem
cum implementatione C servari.

Sectiones "License" breves sunt. Una linea. Variatio verborum acceptabilis est
("Free. Use however you like.", "Public domain.") sed numquam referentia ad
plicam LICENSE externam.

Caudices codicis linguam indicant: `bash` pro mandatis shell, `c` pro codice C,
`json` pro ISON, `text` pro exitu vel formatis.
