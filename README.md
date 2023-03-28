# EigenShoe
EigenShoe is a project that utilizes Matlab and Singular Value Decomposition (SVD) to categorize different climbing shoes based on their images. The SVD technique is a powerful mathematical tool that can be used to analyze and manipulate data.

## Background
In this project, I scraped data from the web and collected my own data by taking 50 images of different climbing shoes. I also used Yale's face database as a proof of concept for the shoe reconstruction from U matrix and categorization.

## Singular Value Decomposition (SVD)
Singular Value Decomposition is a method for factorizing a matrix into three component matrices. The SVD is defined as:

A = U * S * V^T

where A is the matrix (mxn), m different pixels and n different images, to be factorized. U is an m x m orthonormal (unitary) matrix that defines our face space, it is a series of vectors that point in directions that can comprise our image ie. face, sharp chin, crooked nose. S is an m x n diagonal matrix with non-negative real numbers on the diagonal that describes how important each orthonormal vector is, and how much it is used to reconstruct our original matrix of images. Finally V is an n x n orthogonal matrix describing how much of each orthonormal vector (eigenface) we need to use to construct that specific face V represents.

## Shoe Reconstruction from U Matrix
The U matrix obtained from the SVD can be used to reconstruct the original matrix. In this project, the U matrix was used to reconstruct the shoe images, and to construct never before seen shoes and faces out of our library of shoes.

## Categorization
Categorization can be achieved by checking how much of each EigenShoe is needed to reconstruct a shoe, if it needs more of the orange stripes, maybe its a scarpa instinct. I categorized the shoes by how much they use each Eigenvector.

Image Compression
In addition to categorizing the images, I also experimented with image compression using weights on each of the eigen shoes. I was able to store an eigenshoe image that peers could not tell the difference from the original and was just 11% the size of the original. This was accomplished by using a weighting scheme that emphasizes the most important eigenshoes and minimizes the impact of the less important ones.

Conclusion
EigenShoe is a project that demonstrates the use of Singular Value Decomposition, classification and categorization, and image compression techniques to categorize and compress different climbing shoes based on their images. This project has potential applications in fields such as fashion, product design, and data storage, and human identification.
