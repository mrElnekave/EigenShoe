# Goal

> Create a climbing shoe differentiator
>
> Input: Image of a climbing shoe is a specific format
>
> Output: The closest resembling shoe, and description

## Step 1 - Data

- Gather from REI climbing shoes [store](https://www.rei.com/c/climbing-shoes)
- visit every single link for the shoes, class: <sub><sup>(cdr-grid_12-1-0 cdr-grid--gutter-medium@xs_12-1-0 cdr-grid--gutter-medium@sm_12-1-0 cdr-grid--gutter-large@md_12-1-0 cdr-grid--gutter-large@lg_12-1-0 \_9LGEi0F4X4AsY1DIaa70j)</sup></sub>
- At every page collect the image, as well as the title

## Step 2 - Cleaning

- Grayscale all the images so they can be represented by an 8 bit number
- Manually get rid of all shoes that are at an angle
- Make the images way smaller so that there is less info

## Step 3 - Train the model

- Classify the shoes so that you can get the basic shoe, and each shoes eigenvalue

[Algo Description](https://www.youtube.com/watch?v=61NuFlK5VdU)
[Possible walkthrough](https://www.youtube.com/watch?v=XwTW_YA3HG0)
[Intro matlab code](https://www.mathworks.com/matlabcentral/fileexchange/45915-eigenfaces-algorithm)
[Colin's beautiful presentation](https://docs.google.com/presentation/d/1XdNUbU__vI7NluMa7jviPBVZLXUZ0i-W5zX_3rgT9ZQ/edit#slide=id.g129d57b8a32_0_11)

## Step 4 - Build the input system

- Build an input system so that it can take in a shoe, and output a picture and classification based on what it thinks is the closest shoe.
