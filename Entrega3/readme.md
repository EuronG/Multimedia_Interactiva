# Interactive Particle Painter

An interactive generative art experiment inspired by [Weave Silk](http://weavesilk.com), redesigned around a game controller and a particle system with physics.

The application places a particle launcher at the center of the screen. Using the controller, particles can be launched in different directions and with different forces, then influenced by a continuously changing flow field to create organic and hypnotic patterns.

The user can control the direction, force, color and size of the particles while experimenting with different brush behaviors.

## Demo

[![Watch the animation on YouTube](https://img.youtube.com/vi/kZrV0znbqm8/0.jpg)](https://youtu.be/kZrV0znbqm8)

[Watch the animation on YouTube](https://youtu.be/kZrV0znbqm8)

## Inspiration

The project was initially inspired by [Weave Silk](http://weavesilk.com), particularly its ability to generate complex and visually engaging patterns from simple interactions.

The particle movement was also influenced by Daniel Shiffman's [Perlin Noise Flow Field](https://thecodingtrain.com/challenges/24-perlin-noise-flow-field).

From these references, the project evolved into a controller-based particle system where the user directly controls the initial conditions of the particles and their subsequent movement.

## Controls

The application is designed primarily for an Xbox-compatible game controller.

| Control                     | Action                                                |
| --------------------------- | ----------------------------------------------------- |
| Left analog stick           | Aim the particle launcher                             |
| Left analog stick magnitude | Controls the initial launch force                     |
| A button                    | Launch particles                                      |
| Right analog stick          | Applies movement to particles after they are launched |
| Left trigger                | Changes the particle color                            |
| GUI slider 1                | Changes particle color                                |
| GUI slider 2                | Changes particle size                                 |
| `1` - `7`                   | Changes the particle brush                            |
| Right mouse button          | Launches particles in all directions from the cursor  |
| `S`                         | Saves a screenshot                                    |
| `C`                         | Clears the canvas                                     |

The left analog stick controls both the direction and magnitude of the launch. Pushing it farther from the center produces a stronger initial velocity.

The right analog stick acts differently: instead of controlling the launch, it applies a continuous force to particles that are already moving.

## How it works

Particles are represented using position, velocity and acceleration vectors.

When launched, a particle receives an initial acceleration based on the direction and magnitude of the controller input. Its velocity is then updated and limited by a maximum speed before being applied to its position.

The movement is further modified by a **Perlin noise flow field**.

```text
Controller input
       |
       v
 Direction + force
       |
       v
 Particle acceleration
       |
       v
 Particle physics
       |
       v
 Perlin noise flow field
       |
       v
      Trail
```

The flow field is continuously regenerated using Perlin noise, giving particles a smooth and organic movement instead of completely random trajectories.

Particles leave trails by drawing a line between their current and previous positions. As particles move and lose their weight, they gradually disappear from the system.

## Brush Types

Seven different particle behaviors can be selected using the number keys.

Each type modifies the movement of the particles through different oscillation parameters, producing substantially different patterns.

This makes the same controller movement capable of generating very different visual results.

There is also an audio-reactive mode in the particle system. The program analyzes microphone input and can automatically generate particles when the detected volume exceeds a threshold.

## Center Particles

In addition to the particles launched by the user, the program continuously generates a second particle system around the center.

These particles are constrained to a circular area and reflect their velocity when they reach its boundary, creating a contained rotating structure that acts as a visual anchor for the composition.

Their trails gradually fade, adding another layer of movement behind the user-controlled particles.


## Technologies

* Processing
* Java
* GameControlPlus
* G4P Controls
* Processing Sound
* Perlin noise
* Vector-based particle physics
* Game controller input
* Generative art

## Running the project

1. Install [Processing](https://processing.org/).
2. Clone this repository.
3. Open `Main.pde`.
4. Install the required Processing libraries:

   * GameControlPlus
   * G4P
   * Sound
5. Connect a compatible game controller.
6. Run the sketch.

### Running without a controller

The application can also be used with a mouse.

When the program asks you to select a control device, select **`EXIT THE GAME`** to continue without a compatible controller.

In mouse mode:

* Move the mouse to aim the launcher.
* Hold the left mouse button to launch particles.
* Right-click to launch particles in all directions from the cursor.



The project separates the main interaction, particle physics, flow field, audio system and GUI into different Processing files.

## What We Explored

This project combines:

* Generative art
* Particle physics
* Perlin noise
* Interactive controllers
* Real-time input
* Audio-reactive systems
* Procedural trails
* GUI controls
* Generative composition

The main goal was to explore how a relatively small set of physical rules and user-controlled parameters could produce complex visual patterns through interaction.
