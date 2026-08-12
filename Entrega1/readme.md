# Supershapes

A generative 3D animation created with Processing, based on the mathematical concept of supershapes.

The animation continuously morphs between different geometric forms while changing its size, color and line thickness. Each point of the animated surface is connected to a fixed spherical structure through curved Bézier lines, creating an organic visual effect that resembles a beating heart, but with its own rhythm.

The geometry, motion and visual properties are generated programmatically rather than being predefined.


## Demo

[![Watch the animation on YouTube](https://img.youtube.com/vi/eLHj4jlQABo/0.jpg)](https://youtu.be/eLHj4jlQABo)

[Watch the animation on YouTube](https://youtu.be/eLHj4jlQABo)

## Interaction

The scene can be explored in 3D using the mouse.

- **Mouse:** Rotate and explore the camera
    
- **PeasyCam:** Used for interactive 3D camera control
    

## How it works

The main shape is generated from the **supershape formula**, using different sets of parameters to produce different geometric configurations.

As time progresses, the program interpolates between two randomly selected configurations using a sine function. This simultaneously affects:

- The shape of the surface
    
- Its scale
    
- Its stroke thickness
    
- Its color
    

The surface is generated from a grid of points in 3D space and rendered using `TRIANGLE_STRIP`.

A second, slightly irregular sphere acts as a fixed structure. Every point on the animated surface is connected to a corresponding point on the sphere using a cubic Bézier curve. The control points of these curves are randomized when the program starts, giving each execution a slightly different appearance.

The scene also rotates continuously around the X, Y and Z axes.

## Creative Approach

The initial idea was inspired by this animation:

[Instagram reference](https://www.instagram.com/p/Cmy8r7uvqMM/)

The mathematical foundation for the supershapes was taken from Paul Bourke's reference on the subject:

[Supershape formulas — Paul Bourke](http://paulbourke.net/geometry/supershape)

From those references, the project evolved into an experiment with 3D procedural geometry, interpolation and motion, with the goal of creating something that felt more organic than purely geometric.

## Technologies

- Processing
    
- Java
    
- P3D
    
- PeasyCam
    
- PVector
    
- Bézier curves
    
- Procedural geometry
    
- Supershape mathematics
    

## Running the project

### Executable

A standalone executable is available:

[Download Supershapes](https://drive.google.com/file/d/1ANk3Knw8AHmBEtxwYtoHjHdrynceVcQY/view?usp=sharing)

### From source

1. Install [Processing](https://processing.org/).
    
2. Clone this repository.
    
3. Open the `Supershapes.pde` sketch.
    
4. Install the **PeasyCam** library.
    
5. Run the sketch.
    

## Parameters worth experimenting with

Some of the most interesting results can be obtained by modifying:

```text
shapes1      Supershape configurations
shapes2      Supershape configurations
variframe    Animation speed
variacion    Sphere point randomness
variacion1   Bézier curve variation
total        Surface resolution
```

Changing these values can produce substantially different forms and motion patterns without changing the underlying rendering logic.