# Eksperiment med minneallokering (både stack og heap)

**stackoverflow.c** er generert av GPT UiO 2024-03-06 med prompt "lag et program som overfyller stack". Kan kompileres med 

```
$ gcc -o stackoverflow stackoverflow.c 

```

Kan analyseres med "strace" og "valgrind"

```
$ strace -c ./stackoverflow
$ valgrind --leak-check=yes ./stackoverflow
```

**heapleak.c** er generert av GPT UiO 2024-03-06 med prompt "lag et program som overfyller heap". Programmet har ingen kode for å stoppe. Det skal enten utføre inntil den blir "drept" (hvis kjernen klarer å frigjøre minne basert på en innebygd algoritme), eller inntil kjernen genererer en feil og stopper programmet. Kan kompileres med 

```
$ gcc -o heapleak heapleak.c 

```

**heapleakv2.c** en modifisert versjon av **heapleak.c**. Denne versjonen har en "endelig" løkke og skal allokerer en "endelig" mengde av minne uten deallokering. passer bra for å bli brukt med verktøyet valgrind. 