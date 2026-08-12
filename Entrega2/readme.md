# Interactive Music

An interactive audiovisual experiment created with Processing that uses a webcam to turn physical movement into music.

The program displays a grid of 8 × 5 cells over a live camera feed. Each row represents a different instrument, while each column represents a different note. When an orange object moves through the camera, its position determines which cells are activated and which sounds are played.

At the center of the scene, a 3D supershape from the previous experiment reacts to the music, changing its size, shape and visual appearance according to the amplitude of the sounds being played.

The result is an interface where movement, sound and generative graphics are directly connected.

## Demo

[![Watch the animation on YouTube](https://img.youtube.com/vi/y-kxAWK7cjM/0.jpg)](https://youtu.be/y-kxAWK7cjM)

[Watch the animation on YouTube](https://youtu.be/y-kxAWK7cjM)

## Interaction

The webcam is the main input of the program.

An **orange object** can be moved in front of the camera to interact with the grid. Its position determines which notes are triggered.

| Element       | Function                                        |
| ------------- | ----------------------------------------------- |
| Orange object | Activates notes based on its position           |
| Grid          | Represents the available instruments and notes  |
| Webcam        | Captures movement and detects the orange object |
| Supershape    | Reacts to the amplitude of the generated sounds |

## How it works

The webcam image is processed in real time using the **HSB color model**. The program looks for pixels with high saturation and brightness whose hue falls within the orange range.

When an orange object is detected, its position is compared against the coordinates of the grid. The corresponding cells are activated and their associated audio samples are played.

The grid contains **40 possible sound triggers**, with 8 columns and 5 rows. Each position has its own `SoundFile` and amplitude analyzer.

When a sound is triggered, the corresponding cell is also animated with an expanding circle, providing visual feedback for the generated music.

## Audio-reactive Supershape

The supershape from the first project was reused and adapted to react to the generated audio.

Instead of being driven directly by time, its main parameters are interpolated according to the combined amplitude of the active sounds.

As the music becomes louder, the supershape expands and changes form. This creates a direct connection between the physical movement in front of the camera and the central visual element:

```text
Camera
   ↓
Orange object detected
   ↓
Grid position
   ↓
Sound triggered
   ↓
Audio amplitude
   ↓
Supershape reacts
```

This makes the supershape function as a visual representation of the music being created.

## Technologies

* Processing
* Java
* Processing Video
* Processing Sound
* P3D
* PeasyCam
* Webcam / real-time video processing
* HSB color detection
* Procedural 3D geometry
* Audio amplitude analysis

## Running the project

1. Install [Processing](https://processing.org/).
2. Clone this repository.
3. Open the `grid.pde` sketch.
4. Install the required Processing libraries:

   * Video
   * Sound
   * PeasyCam
5. Connect a webcam.
6. Run the sketch.
7. Place an orange object in front of the camera and move it across the grid.

The project includes the audio samples used by the different grid positions.




## What We Explored

This project combines several areas of interactive multimedia:

* Real-time computer vision
* Color-based object detection
* Interactive music
* Audio-reactive graphics
* Webcam interaction
* Procedural 3D animation
* Audio amplitude analysis

The main idea was to experiment with turning a physical interaction into a complete audiovisual response, where the same movement controls both the sound and the visual output.
