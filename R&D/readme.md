# R&D

A small interactive experiment created to explore **p5.js and sound-based interaction in the browser**.

The project consists of a circular interface with four optional polygons. A small particle continuously moves around the outer circle, and whenever it reaches a vertex of an active polygon, a specific musical note is played.

Each polygon corresponds to a different note, allowing the user to build simple rhythmic and harmonic combinations by activating or deactivating the shapes.

## Try it

The project is hosted on GitHub Pages, so there is no need to clone the repository or install anything.

[![R&D Preview](./preview.png)](https://eurong.github.io/Multimedia_Interactiva/R%26D/index.html)

[Open R&D in your browser](https://eurong.github.io/Multimedia_Interactiva/R%26D/index.html)

## How it works

The four buttons control four different polygons:

| Button | Shape     | Note |
| ------ | --------- | ---- |
| 1      | Dodecagon | C4   |
| 2      | Hexagon   | D#4  |
| 3      | Rhombus   | G4   |
| 4      | Triangle  | Bb4  |

The polygons are generated procedurally from their number of vertices and a fixed radius.

A small particle moves around a circular path. When its position reaches one of the vertices of an active polygon, `p5.MonoSynth` plays the corresponding note.

Multiple polygons can be active at the same time, allowing different combinations of notes to play together.

## Interaction

Click the buttons below the canvas to turn each shape **On** or **Off**.

The animation and sound run continuously, so different combinations of active shapes create different rhythmic patterns.

## Technologies

* p5.js
* p5.sound
* JavaScript
* HTML
* CSS
* Procedural geometry
* Web Audio

## Purpose

This experiment was mainly used as an introduction to **p5.js**, exploring how interactive graphics and sound could be implemented directly in a web browser.

It also served as a smaller research project before developing the larger interactive multimedia experiments in Processing.
