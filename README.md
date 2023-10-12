# Image_Carving

A image segmentation techniques suitable for:

 - Content-Aware Resizing: It allows for resizing images while preserving important content and structures, automatically removing less significant regions.
 - Object Removal: Image carving can remove objects or unwanted elements from images seamlessly, leaving minimal artifacts.
 - Image Retargeting: It helps adapt images to different aspect ratios and screen sizes, making them more suitable for various displays.
 - Photography and Photo Editing: It aids photographers and editors in cropping or resizing images while preserving the essential elements.


Input image:

![waterfall](https://github.com/bishwa221/Image_Carving/assets/94813630/bb9e1ad6-7078-4483-a705-807426140caf)


Output image:

![carved_image](https://github.com/bishwa221/Image_Carving/assets/94813630/a2480326-f537-44b6-b736-5d1dc94ccc09)


The summarized version of the steps involved in this image carving algorithm:

1. Energy Map Calculation:
   - Compute an energy map of the input image to determine the importance of each pixel.

2. Dynamic Programming:
   - Use dynamic programming to find and record the optimal seam, which is a connected path of low-energy pixels from the top to the bottom of the image.

3. Seam Removal:
   - Remove the optimal seam, which corresponds to the least important pixels, from the image by shifting the remaining pixels to close the gap.

4. Repeat:
   - Repeat the dynamic programming, seam removal, and resizing steps for the desired reduction in width or height.

5. Output Image:
   - The final output image is resized with the specified dimensions while preserving the most important content.

The process can be adapted for seam carving in both horizontal and vertical directions to resize images according to specific requirements.
