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

- Get references from Jeff:

  > [Eigen faces for recognition](https://watermark.silverchair.com/jocn.1991.3.1.71.pdf?token=AQECAHi208BE49Ooan9kkhW_Ercy7Dm3ZL_9Cf3qfKAc485ysgAAArUwggKxBgkqhkiG9w0BBwagggKiMIICngIBADCCApcGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMBykp2sGU5QT32qpyAgEQgIICaJt-Da3DlHoq7gKndE5hYzSa2aLRwdsTcuyydrCOSVH_SAYWC7oIrEbUMVKmECzKMriXvz1f4PUeWareprBhrS9ZBviKxr9qcJTpFANfEhjOK8r8QOj3Vt6vHLaDo3ScwhvG6vC6fRbUuOw_ap3d781VcblIoJ5AqicryTbncfgZ2lT23kUMVHHxuMu4l1CMkg54jpd9dl6EQP_Izf_b9-WzsGkje0jJAkmEsZZcxqllttVFEiNxBGrUH8JfQHzIBr9uzcWSXJZMpSY4exPQQxX_3_mMmK85zYxoDp_GOltKBcTDREpzPu_Hf637A3Ze_34VqRV7PzRyW0GBb0FjB5-MdwZsKs4aSi-QcYCpxvcpXwmazI5AcHnUH4BOXvWWKsr20uVXKECtvSqFB1r-7uff4oI70rwBEyhtKG59vk6Pp6QK_BaZE_jAvoci197tOs2MexOj9lWiuV7BmUK7VMKt1LGq3ulZ9kN2oW_7-45GEQQY6R0BZNNJm_CTaMx_WtrUOFz0Ys5KzoC8wo_jTFA_33cX4EJYmdeLmjJOBNyv8i4A7clE2VD2nndp5DOEw1f2eZNvRLAI_anSHngnenU7icKQIglgaZLBZ0IFk5arrCuTKh2bqQ1DFyWbupHRxZ_SruKfBgmw5_TD0q5NiIazB9ejOk3FO4MrzqsYBtxxyyCFztOrwrkgzrInQ_U2nD9gFnxFVuW77MtcdAunphhaTUr6IPiMpc0XAFnLXz8rUmlTk1ySLBBwLVZ1tOWrL2bG0IH0I_ZsrL1ssiXCTU1zlGMFNNPe_WXgAm_GkT5MyHoJ2WlY0WM).

  > [Eigenfaces, for Facial Recognition](https://jeremykun.com/2011/07/27/eigenfaces/) Jeremy Kun.

- [Algo Description](https://www.youtube.com/watch?v=61NuFlK5VdU) MIT.
- [Possible walkthrough](https://www.youtube.com/watch?v=XwTW_YA3HG0)
- [Intro matlab code](https://www.mathworks.com/matlabcentral/fileexchange/45915-eigenfaces-algorithm)
- [Colin's beautiful presentation](https://docs.google.com/presentation/d/1XdNUbU__vI7NluMa7jviPBVZLXUZ0i-W5zX_3rgT9ZQ/edit#slide=id.g129d57b8a32_0_11)

Chose the walkthrough, attached [book](http://databookuw.com/)

## Step 4 - Build the input system

- Build an input system so that it can take in a shoe, and output a picture and classification based on what it thinks is the closest shoe.
