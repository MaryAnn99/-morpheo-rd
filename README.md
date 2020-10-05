# Gosleep

It's a mobile application that indicates sleep shifts taking into consideration exercise and nutrition. 

The name of the project is the union of two words: "Goldberg" and "sleep". 

## Docs

- [Documentación (Word)](https://docs.google.com/document/d/1zDccoXDcLqYby8P1Qap7GuRd9sET5B3dVq53qzZNRKo/edit?usp=sharing)
- [Treatments (Excel)](https://docs.google.com/spreadsheets/d/14SqCXEcUrHdp1wv3NaR8rFc2M1XSEwa0CBx99DemLyM/edit?usp=sharing)
- [FLow diagram](https://lucid.app/documents/view/411b73e1-30dd-4ed8-8d8c-4dd9f1ddd910)
- [Mockups](https://balsamiq.cloud/sa6o2rw/pqma720)

## References
- [Jet Lag Rooster (example)](https://www.jetlagrooster.com/example)
- [Paper 1 - How To Travel the World Without Jet lag](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2829880/)
- [Paper 2 - Preflight Adjustment to Eastward Travel: 3 Days of Advancing Sleep with and without Morning Bright Light](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1262683/?tool=pmcentrez&report=abstract)
- [About NASA's space scheduling](https://space.stackexchange.com/questions/20821/what-kind-of-time-regiment-schedule-do-iss-astronauts-have)

## About the project evaluation

- Impacto: ¿cuánto impacto tiene el proyecto?, ¿resuelve un gran o pequeño problema?, ¿será inspirador?
- Creatividad: que tanta creatividad/innovación hay, ¿es novedoso o algo que no se haya intentado antes o es una mejora incremental a algo existente?
- Validez: ¿la solución es científicamente viable? ¿hace lo que se supone debe hacer? ¿funcionará en la vida real?
- Relevancia: ¿responde a un reto propuesto? ¿es una solución completa? ¿hace sentido técnico? ¿Qué tan “user friendly” es?
- Presentación: ¿qué tan bien se comunicó el proyecto? ¿fueron eficientes haciendo una historia del proyecto: el reto, la solución y el por qué es importante?

# Module notes

## Basics for time zone adjustment

### Analysis

**Elements**:

- Usuario:
  - Sleep schedule:
    - Start: 23:30
    - Ends: 07:00
- Travel time.
- Sleeping schedule (of the user before the travel)
- Time zone difference.
- Sun light schedule.
- Night schdule: computing sun light schdule.
- Jet lag: Circadian clock - Time zone != zero

**Adjustment of circadian clock**:

- Methods:

  - Antidromic re-entrainment
  - Orthodromic re-entrainmen

- Tools:

    | Symbol | Tool                    |
    |--------|-------------------------|
    | L      | Artficial Light         |
    | D      | Evitar luz brillante    |
    | L      | Tomar luz artificial XP |
    | S      | Tomar el sol            |
    | M      | Tomar melatonina        |
    | M      | Tomar melatonina        |

### Algorithm

1. Estimate when your body temperature reaches a minimum. If sleeping 7 or fewer hours per night, assume this is 2 hours before your usual wake time. If sleeping more, assume this is 3 hours before your usual wake time.

2. Determine whether you need to advance or delay your circadian rhythms. If you are flying east (to a later time zone), such as from Los Angeles to New York, you will need to phase advance. Otherwise, if you are flying west, you will need to phase delay.

3. If you need to phase advance, avoid light for 4 hours before your body temperature minimum, and seek light for 4 hours after it. Otherwise, do the opposite.

4. Shift your estimated body temperature minimum by one hour earlier per day if phase advancing, or one and a half hours later per day if phase delaying.


## La gráfica esa

- Rectángulo amarillo: horario de luz del sol.
- Rectángulo blanco (sin relleno): horario de vuelo.
- Línea morada es con círculo en extremos: horario de sueño en lugar.
- Línea morada con flecha en extremos: horario de sueño en el vuelo.
- "D": Evitar luz brillante.
- "L": Tomar luz artificial XP
- "S": Tomar el sol
- "M": Tomar melatonina
- Triángulito relleno: Avanzar una hora en fase el horario de sueño.
- Trianguilito sin rellono: atrazar una hora en fase del horario de sueño.

## Glossary

- **DLMO**: Dim Light Melatonin Onset. Es la producción de melatonina del propio cuerpo cuando se está oscureciendo.

- **$T_{min}$**: Es el momento del sueño donde la temperatura corporal es mínima. Suele ser 3 horas antes de uno despertarse.